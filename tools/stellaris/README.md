# Stellaris 开发工具接入

2026-10-11：为本工作区接入两套本地工具，保留原有 mod 校验和文案审批流程。

## 安装与固定版本

源码放在工作区根目录 `.local-tools/`，由根 `.gitignore` 排除，不进入 `1/` 或发布包。
Node.js 当前为 24.11.1；两仓库均要求 Node.js 20+，没有 npm 运行时依赖。

| 工具 | 上游 | 固定提交 |
|---|---|---|
| RStellarScribe | https://github.com/g5Sunnystarscout/RStellarScribe | `bb8ab3ed8597bc02d8eaed22b325787014f89798` |
| RStellarisGui | https://github.com/g5Sunnystarscout/RStellarisGui | `40e9a8ab5be1da37730e20c88068368fe71d8e5f` |

全新工作区可在根目录运行以下命令恢复相同工具版本；已有目录不要再次 clone 或覆盖。

```powershell
git clone https://github.com/g5Sunnystarscout/RStellarScribe.git .local-tools/RStellarScribe
git -C .local-tools/RStellarScribe checkout bb8ab3ed8597bc02d8eaed22b325787014f89798
git clone https://github.com/g5Sunnystarscout/RStellarisGui.git .local-tools/RStellarisGui
git -C .local-tools/RStellarisGui checkout 40e9a8ab5be1da37730e20c88068368fe71d8e5f
node tools/stellaris/run.mjs smoke
```

两个项目的许可证均为 AGPL-3.0-or-later，源码与许可证保留在各自 checkout 中。接入层没有复制其实现进 mod。
升级时先检查上游差异，再更新固定提交和本文件验证记录；不要自动 pull。

## MCP 和即时调用

`.codex/config.toml` 是项目级 MCP 配置，已设置 Node 绝对路径、工具工作目录与游戏路径。
未修改用户全局 Codex 配置或认证信息。搬迁工作区或换机时，需要调整此配置中的绝对路径。
Codex 只加载受信任项目的项目级配置；如当前聊天尚未出现工具，重新打开项目聊天或重启应用后检查 MCP 状态。
配置依据：[Codex 官方 MCP 文档](https://learn.chatgpt.com/docs/extend/mcp?surface=cli)。

当前会话也可以直接使用等价 CLI，不需要等待 MCP 重新加载：

```powershell
node tools/stellaris/run.mjs smoke
node tools/stellaris/run.mjs list scribe
node tools/stellaris/run.mjs list gui
node tools/stellaris/run.mjs call gui gui_knowledge_search tools/stellaris/gui-query.json
powershell -ExecutionPolicy Bypass -File 1/tools/validate_mygo_mod.ps1
node tools/stellaris/run.mjs validate
```

任意工具的参数先通过 `list` 查看 JSON Schema，再保存为 UTF-8 JSON 文件：
`node tools/stellaris/run.mjs call scribe TOOL_NAME ARGS.json`。
CLI 每次创建独立进程，不能跨调用保留 workspace_id 或 layout_id；需要连续编辑布局时使用同一个 MCP 会话。

`validate` 调用 Scribe 的只读全项目检查，原始报告保存至 `.local-tools/reports/scribe-project.json`。
报告包含错误时退出码为 1；这表示有待复核诊断，不自动表示游戏内容有错。报告会覆盖前次结果，需留证时先另存。

## 工作规则

1. 开始脚本工作时，用 Scribe 查询相关知识；MCP 中用 `open_stellaris_workspace` 打开绝对路径 `1/`。
2. 以当前原版和参考 workshop mod 验证知识库结论，继续沿用现有事件、scripted effect 和本地化结构。
3. 修改后必须先运行 `1/tools/validate_mygo_mod.ps1`，再获取 Scribe 补充报告，逐条核对涉及的现役文件。
4. Gui 用于知识查询、现有素材/界面检查、日志分析。此次安装不授权新增 GUI、美术或主界面修改。
5. 生成器默认 dry-run。任何未来候选输出先放独立暂存目录，不直接写加载目录；剧情仍需人工批准、导入预检和显式 `-Apply`。
6. 不把归档、废案和根目录草稿的诊断当成现役问题。Gui 检查使用明确的文件列表，不递归扫描整个 `1/`。

## 本机验证与限制

- `codex mcp get rstellariscribe` 与 `codex mcp get rstellarisgui` 均读取到 enabled 项目配置。
- `smoke` 真实启动两个子进程，完成 initialize、initialized 与 tools/list：分别 48 和 34 个工具。
- Gui 的 `gui_knowledge_search` 实际返回知识主题，检索可用。
- 本机 `F:/steam/steamapps/common/Stellaris/launcher-settings.json` 报告 **Cygnus v4.5.0**；mod descriptor 为 **v4.4.***。
- Gui 固定面向 4.4.x。真实执行 `gui_assets_search` 后明确拒绝 4.5.0 安装，因此原版素材索引及依赖该索引的检查/预览目前受阻。没有绕过检查、修改原版或降级游戏。需要合法的 4.4.x 安装路径，或上游支持 4.5 的版本，才能完成这些验证。
- Scribe README 写 4.1.7，package 描述写 4.4.x；不能据此证明 4.5 语法兼容。
- 原有 MyGO 校验返回 `validate ok`。Scribe 全项目扫描实际返回 **17 errors / 750 warnings**，保留原始报告，未据此修改任何游戏内容。
- Scribe `src/lib/paradox.mjs:372` 的 `findEventIds` 用正则搜所有 `id = ...`，没有区分顶层定义与事件调用。16 条 duplicate event 诊断受到此缺陷影响；已抽查 `mygo.400`、`mygo.637`、`mygo_resurrection.9`，所谓另一处定义实际是调用。不能直接删除事件。另一条错误来自根目录 `新建 文本文档.txt`，属于非加载目录扫描结果。
- 750 条 warning 尚未逐项审计；其中版本不匹配属实，其他缺失本地化/文件命名等结论需人工复核。没有运行上游全部自测，也没有启动游戏进行回归。

## 回退

仅停用工具时，把 `.codex/config.toml` 中对应服务器设置 `enabled = false`，重新加载客户端。
完整撤销接入可移除这两个配置表及本次新增的工作流说明/包装器；源码目录可留作缓存。
不要使用全局 `codex mcp remove` 代替编辑项目级配置，也不要回滚整个 mod 工作树。
