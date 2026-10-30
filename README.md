# 星际迷子：永恒归还

Stellaris 4.5.x 的 MyGO 游牧国家 Mod，当前 descriptor 版本为 `0.4.2`。游戏内容位于 `1/`，本地启动描述文件为 `1.mod`。

## 本地安装

将 `1/` 目录复制到 Stellaris 的本地 `mod/` 目录，并将 `1.mod` 放在同一目录。修改 `1.mod` 中的 `path`，使它指向复制后的 `1/` 目录。启用 Mod 前请确认已安装并启用原版游牧/方舟船相关 DLC。

## 开发与校验

项目现状、已知缺口和验证范围见 [`1/项目背景.md`](1/项目背景.md)。修改后运行：

```powershell
powershell -ExecutionPolicy Bypass -File 1\tools\validate_mygo_mod.ps1
```

这个脚本只做静态校验，游戏内行为仍需单独回归。`AGENTS.md` 记录了开发边界和文件约定。

此仓库保存当前开发快照。大型打包压缩包、第三方本地工具和 IDE 状态不在仓库内。
