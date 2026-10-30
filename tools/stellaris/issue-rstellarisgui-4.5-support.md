# [Feature request] 支持 Stellaris 4.5.x，并在状态查询中保留版本拒绝原因

## 背景

当前的 Stellaris 为 **Cygnus v4.5.0**。

README 明确声明目标为 4.4.6，而且4.5确实用不了啊。

因此这里作为 **4.5 支持请求**。

反正就是得更新一下。

## 复现环境

- Windows，PowerShell 7.6.5
- Node.js v24.11.1
- RStellarisGui 0.1.0
- 测试提交：`40e9a8ab5be1da37730e20c88068368fe71d8e5f`，本地 checkout 无修改
- Stellaris：`Cygnus v4.5.0 (8697)` / `rawVersion: v4.5.0` / `modsCompatibilityVersion: 4.5`
- 显式设置 `STELLARIS_GAME_ROOT`；目录中存在 `interface/`、`common/` 和 `launcher-settings.json`

## 最小复现

在仓库根目录执行，将路径替换为自己的：

```powershell
$env:STELLARIS_GAME_ROOT = 'F:\steam\steamapps\common\Stellaris'
node src/index.mjs --skill call-tool gui_interface_inventory
$LASTEXITCODE
```

结果：退出码为 **1**。错误全文如下（实际安装路径替换为 `<install>`）：

```text
refusing to read <install>: it reports Stellaris v4.5.0, and every constant in this build was measured against 4.4. Field names and file layouts differ between versions, so answering from the wrong one produces plausible-looking wrong answers.
```

另存 `args.json`：

```json
{ "query": "close", "limit": 3 }
```

执行素材搜索，也得到同样错误和退出码 1：

```powershell
node src/index.mjs --skill call-tool gui_assets_search --json-file args.json
```

## 对照结果

| 调用 | 实测结果 |
|---|---|
| `gui_interface_inventory` | 退出码 1，明确拒绝 v4.5.0 |
| `gui_assets_search`，query 为 `close` | 退出码 1，同样拒绝 |
| `gui_knowledge_search`，query 为 `custom_gui`、limit 为 3 | 退出码 0，返回 3 个主题；topicCount 为 36 |
| `inspect_rstellarisgui_state` | 退出码 0，但 `gameRoot`、`gameVersion`、`assetIndex` 均为 null |

状态查询的相关字段：

```json
{
  "gameRoot": null,
  "gameVersion": null,
  "assetIndex": null
}
```

## 源码定位

以下链接固定到测试提交：

- [src/lib/paths.mjs](https://github.com/g5Sunnystarscout/RStellarisGui/blob/40e9a8ab5be1da37730e20c88068368fe71d8e5f/src/lib/paths.mjs)：`TARGET_VERSION = '4.4'`；`resolveGameRoot()` 读取版本后，通过 `version.includes(TARGET_VERSION)` 判断，不匹配时抛错。
- [src/lib/asset-index.mjs](https://github.com/g5Sunnystarscout/RStellarisGui/blob/40e9a8ab5be1da37730e20c88068368fe71d8e5f/src/lib/asset-index.mjs)：`getAssetIndex()` 和 `buildAssetIndex()` 都先调用 `resolveGameRoot()`，因此在读取/解析原版素材前就已拒绝该安装。
- [src/index.mjs](https://github.com/g5Sunnystarscout/RStellarisGui/blob/40e9a8ab5be1da37730e20c88068368fe71d8e5f/src/index.mjs)：初始化 context 时捕获 `resolveGameRoot(null)` 的异常，并将 `gameRoot` 设为 null，没有拒绝原因。
- [src/tools/index.mjs](https://github.com/g5Sunnystarscout/RStellarisGui/blob/40e9a8ab5be1da37730e20c88068368fe71d8e5f/src/tools/index.mjs)：`gui_interface_inventory` 使用资产索引；`gui_layout_preview` 默认也请求资产索引，但提供 `check_assets: false` 的路径。

换句话说这东西甚至有版本拦截啊。

## 期望行为 / 建议处理

**明确 4.5 支持状态**：支持新版本。

不建议仅将 `TARGET_VERSION` 改为 `4.5` 。

## 建议验收项

- 对状态查询能够报告拒绝原因。
- 正式支持 4.5。
- 或者把版本拦截直接删了（）
