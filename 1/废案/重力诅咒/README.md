# 重力诅咒废案

退役日期：2026-07-29

重力诅咒的 Situation、进度条、月度推进、阶段惩罚、循环事件及专属本地化已经从游戏加载路径中剥离。本目录只保存历史实现，不参与 Stellaris 加载。

退役原因：

- 以伪危机进度条强迫玩家推进的设计已经不符合当前主线。
- 四条正式星尘信标链本身已经具备剧情、遗物、资源与路线引导，不再需要额外压力系统。
- Phase 1 到 Phase 2 现在由 Popy 终章自然交接。

保留内容：

- `00_mygo_situations.txt.disabled`：原 Situation 定义。
- `mygo_gravity_curse_events.txt.disabled`：原 `mygo.90` 循环事件。
- `mygo_gravity_curse_modifiers.txt.disabled`：原五阶段静态修正。
- `mygo_gravity_curse_localisation.yml.disabled`：原 23 个专属本地化键。
- `mygo_gravity_curse_names.yml.disabled`：原战列舰随机名“重力诅咒”。
- `retired_hooks.md`：从现役代码拆除的四处接线。

这些归档文件本身不得改回 `.txt` / `.yml` 后放入 `common/`、`events/` 或 `localisation/`，也不得恢复旧 ID、惩罚或循环事件。旧存档若已经保存了活动中的重力诅咒 Situation，不保证能在硬退役后的版本继续使用；验证请使用新开档。

2026-08-02，经用户明确授权，项目参考这里保存的 Situation 结构另行制作了正向系统“星尘解析度”。现役系统使用全新的 ID、文本和效果，位于正式加载目录；本目录中的重力诅咒文件继续保持 `.disabled`，没有重新接线。
