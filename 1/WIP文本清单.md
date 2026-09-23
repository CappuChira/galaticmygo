# 玩家可见 WIP 文本清单

更新日期：2026-07-31

本清单机械盘点 `localisation/simp_chinese/mygo_l_simp_chinese.yml` 中全部带 `WIP` 字样的 16 个本地化键。修补文本时以本表逐项核对；修改正式本地化后仍需保持 UTF-8 BOM 并运行 `tools/validate_mygo_mod.ps1`。

2026-07-31 复核结果：加载目录仍为 16 项，全部属于下方 C 组；正式内容待补写仍为 0 项，重力诅咒旧文本仍只存在于非加载废案目录。

当前分类：

- **正式内容待补写**：继续保留在游戏中的正式界面或剧情文本，应补成最终文案。
- **已剥离废案**：重力诅咒系统及专属文本已经迁入非加载废案目录，不计入当前 16 个加载中 WIP。
- **退役保留**：当前主线不调用，或只属于已经退役的兼容定义；按用户要求原地保留，不删除、不重新接线。
- 本表只盘点明确含 `WIP` 字样的键，不代表所有短文本都已经达到最终文案质量。

## A. 正式内容待补写：0 项

| 优先级 | 本地化键 | 当前用途 | 状态 |
|---|---|---|---|
| P0 | `origin_mygo_eternal_return_desc` | 起源选择界面说明 | 已替换 |
| P0 | `EMPIRE_DESIGN_mygo_nomads_desc` | MyGO 预设国家说明 | 已替换 |
| P0 | `mygo_stardust_signal_poi_desc` | 下一处星尘信标的 Situation Log POI 说明 | 已替换 |
| P1 | `edict_mygo_open_comms_desc` | 退役法令的兼容说明 | 已替换，法令入口已移除 |
| P1 | `mygo.300.desc.phase_1` | 通讯菜单 Phase 1 说明 | 已替换 |
| P1 | `mygo.300.desc.phase_2` | 通讯菜单 Phase 2 说明 | 已替换 |
| P1 | `mygo.300.tomori.response` | 灯的 Phase 1 通讯回复 | 已替换 |
| P1 | `mygo.300.taki.response` | 立希的 Phase 1 通讯回复 | 已替换 |
| P1 | `mygo.300.soyo.response` | 爽世的 Phase 1 通讯回复 | 已替换 |
| P1 | `mygo.300.rana.response` | 乐奈的 Phase 1 通讯回复 | 已替换 |
| P1 | `mygo.300.anon.response` | 爱音／舰桥 Phase 1 回复 | 已替换 |

通讯菜单同时新增了 Phase 2 与巡演阶段的角色差分，以及 `mygo.300.desc.tour`。这些新键没有使用 WIP 标记。入口已从法令移至通讯总览中的 `NAME_mygo_internal_comms` 自定义联系人，并在完成第一个信标、获得 `mygo_relic_string` 后开放。

## B. 重力诅咒已剥离废案：14 项（不计入当前 16 项）

重力诅咒的理念、进度条、月度推进、阶段惩罚和循环事件已经整体迁入 `废案/重力诅咒/`。本组 14 个 WIP 键、另外 9 个不含 `WIP` 的系统键，以及名字表中的战列舰名“重力诅咒”均已退出游戏加载范围；本表保留清单只为历史追踪。

| 本地化键 | 当前用途 | 下一步 |
|---|---|---|
| `situation_mygo_gravity_curse_desc` | 重力诅咒 Situation 主说明 | 已迁入废案 |
| `situation_mygo_gravity_curse_monthly_change_tooltip` | 月度推进提示 | 已迁入废案 |
| `mygo_gravity_curse_stage_1_tt` | 阶段 1 提示 | 已迁入废案 |
| `mygo_gravity_curse_stage_2_tt` | 阶段 2 提示 | 已迁入废案 |
| `mygo_gravity_curse_stage_3_tt` | 阶段 3 提示 | 已迁入废案 |
| `mygo_gravity_curse_stage_4_tt` | 阶段 4 提示 | 已迁入废案 |
| `mygo_gravity_curse_stage_5_tt` | 阶段 5 提示 | 已迁入废案 |
| `mygo_gravity_curse_complete_tt` | 进度完成提示 | 已迁入废案 |
| `mygo_gravity_curse_stage_1_desc` | 阶段 1 修正说明 | 已迁入废案 |
| `mygo_gravity_curse_stage_2_desc` | 阶段 2 修正说明 | 已迁入废案 |
| `mygo_gravity_curse_stage_3_desc` | 阶段 3 修正说明 | 已迁入废案 |
| `mygo_gravity_curse_stage_4_desc` | 阶段 4 修正说明 | 已迁入废案 |
| `mygo_gravity_curse_stage_5_desc` | 阶段 5 修正说明 | 已迁入废案 |
| `mygo.90.desc` | 进度满后的循环事件说明 | 已迁入废案 |

## C. 退役或不可达兼容文本：16 项

这些键继续保留不会自行触发。风险只在于未来误接线，因而不删除，但也不得当作现役入口继续扩写。

| 本地化键 | 所属旧内容 | 当前处理 |
|---|---|---|
| `mygo_stardust_crychic_site_desc` | 已退役的独立第五信标兼容遗址 | 保留，不生成、不扩写 |
| `mygo_popy.route.name` | 已由 `mygo.567` 取代的 `mygo.1230` 旧路线 | 保留，不重新接线 |
| `mygo_popy.route.desc` | 同上 | 保留，不重新接线 |
| `mygo_popy.route.ask` | 同上 | 保留，不重新接线 |
| `mygo_popy.route.ask.response` | 同上 | 保留，不重新接线 |
| `mygo_popy.route.live` | 同上 | 保留，不重新接线 |
| `mygo_popy.route.live.response` | 同上 | 保留，不重新接线 |
| `mygo_popy.route.accept` | 同上 | 保留，不重新接线 |
| `mygo.10.desc` | 无当前调用方的旧开局占位事件 | 保留，不重新接线 |
| `mygo.101.desc` | 旧第一遗物占位事件 | 保留，不重新接线 |
| `mygo.104.desc` | 旧第四遗物占位事件 | 保留，不重新接线 |
| `mygo.105.desc` | 已退役第五信标使用的旧最终遗物事件 | 保留，不重新接线 |
| `mygo.111.desc` | 旧记忆排异占位弹窗 | 保留，不重新接线 |
| `mygo.112.desc` | 旧记忆排异占位弹窗 | 保留，不重新接线 |
| `mygo.113.desc` | 旧记忆排异占位弹窗 | 保留，不重新接线 |
| `mygo.114.desc` | 旧记忆排异占位弹窗 | 保留，不重新接线 |

## 修补顺序

1. 在新开档中回归重力诅咒已消失、四条信标仍按顺序推进、Popy 终章仍进入 Phase 2。
2. 在游戏内回归通讯总览入口及 Phase 1、Phase 2、巡演三组差分。
3. 每批修改后搜索 `WIP`，核对加载用本地化仍只有 C 组 16 项。
4. C 组兼容文本默认不动；如果将来只想去掉字面上的 `WIP`，也只改本地化文字，不恢复事件入口。
