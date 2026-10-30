# MyGO 的 Stellaris 4.5 适配记录

日期：2026-10-12。目标为 4.5 系列。首次适配时本机为 Cygnus v4.5.0 (8697)，随后本机更新为 4.5.2 (9776)，已重新比对原版文件并补齐差异，尚未进行游戏内运行验证。

官方资料：https://steamcommunity.com/app/281990/announcements/

## 更新对项目的影响

- 4.5 人口组改为记录思潮与派系比例，4.4 及以前存档不兼容。应使用 4.5 新开档测试；mod 不能修复引擎层面的存档格式变化。
- 删除 `pop_has_ethic`、`pop_group_has_ethic`，新增人口思潮数量/比例查询；现役脚本未使用这两个旧触发器。国家思潮与领袖背景思潮不属于本次人口接口替换。
- 移除若干旧派系、国家类型、建筑上限及科技参数；现役 common、events、prescripted_countries 的扫描未发现审计脚本列出的旧参数。
- 方舟可用内容、AI 建造和考古行为、行星旗标作用域及领袖系统有多项修复。MyGO 使用原版方舟体系，保留其入口；未新增 GUI、美术或剧情。
- 4.5.2 新增方舟武器与驿站防御政策，并修复停用方舟的恢复等问题。项目未覆盖这些政策和组件，但完整原版事件覆盖仍须在安装该补丁后重新比对。

## 实际代码修改

- `1.mod` 与 `1/descriptor.mod` 的 supported_version 从 `v4.4.*` 更新为 `v4.5.*`。
- `1/events/on_action_events_1.txt` 的原版部分对齐本机 4.5.0：恢复 Infernal 净化合金系数 0.24/0.18，保持机器物种 0.12；同步 syndaw.1030/1035 的调度；加入 martial_law_knights 清理；同步原版行星旗标接口及可选作用域语法。
- 保留 MyGO 首次接触六段描述、九个回复、三处战争结束过滤以及领袖肖像选择。对齐后与原版只有八处差异，全部是上述 MyGO 定制。
- 原版 `is_star_seeker_empire` 和 `must_be_advanced_empire` 的条件与项目扩展核对一致，未修改。

## 回退与验证

已有 Git 检查点 `c417cce` 保存此前主体代码。本次将修改前入口、descriptor、整份覆盖、项目背景和 Scribe 报告另存至 `.local-tools/backups/mygo-before-4.5-20261012/`。回退时只恢复对应文件，避免覆盖其他工作。

执行结果：

- `powershell -ExecutionPolicy Bypass -File 1/tools/validate_mygo_mod.ps1`：validate ok。
- `python tools/stellaris/audit_45.py`：通过原版覆盖差异、旧参数、on_action 名称、版本声明、全部简中 yml BOM 检查。此工具是只读审计，未来原版改动会使覆盖差异检查失败，需人工重新合并。
- `node tools/stellaris/run.mjs validate`：17 errors / 749 warnings，返回码 1；修改前为 17 / 750。错误列表与修改前一致，版本不匹配警告已消失。正则将调用误识别为事件定义，以及扫描非加载根目录文本的已知限制仍存在。未把这个结果表述为全项目无错误。
- Gui 固定 4.4.x 的版本检查仍阻止读取本机原版，未绕过限制。

## 尚需游戏内回归

使用 4.5 新开档并在 debug_mode 下记录错误日志，覆盖起源与无母星方舟开局、队员创建和复活、四条信标及地球之墓、首次接触三国与战争收尾、祥子航路及联合审计项目、自定义通讯、合约和巡演。特别观察停用/恢复方舟、臣属与战争退出、人口相关项目条件。

本次未启动游戏，也未转换旧存档；静态通过不等于引擎验收。

## 4.5.2 追加核对

本机版本已核实为 4.5.2 (9776)。整份事件覆盖相对新版原版只缺少一条原版逻辑：`action.85` 的混合所有权星系行星归属处理新增 `is_nomadic_synaptic_lathe = no`，避免将游牧突触凝练机纳入该归属转移。已补齐；MyGO 定制差异仍为八处。修改前覆盖及 Scribe 报告保存至 `.local-tools/backups/mygo-before-4.5.2-20261012/`。

现役脚本未使用新版移除的 `multiply_by_habitability_effect_modifier`、改名的 `basic_eligibility_for_separatism_joining_trigger` 或旧护盾维护费变量，也未覆盖新增方舟/驿站政策。无需复制这些新政策到 mod。版本声明继续使用 `v4.5.*`。
