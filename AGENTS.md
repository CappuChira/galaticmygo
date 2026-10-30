# Project Context: MyGO Stellaris Nomad Mod

本工作区是 Stellaris 本地 mod 目录：

`C:\Users\LemueDuck\Documents\Paradox Interactive\Stellaris\mod`

当前主要项目是 `1/` 文件夹和 `1.mod`，目标是制作一个基于 BanG Dream!《It's MyGO!!!!!》的群星游牧国家 mod。除非用户明确要求，其他 `ugc_*.mod` 与 workshop mod 文件不要修改。

## 项目目标

mod 名义上是《星际迷子：永恒归还》/ MyGO 游牧国家。玩家开局扮演千早爱音，领导无母星游牧方舟船“迷子号（Spica）”。五名核心角色是爱音、灯、立希、爽世、乐奈。剧情主题是逃离、失忆、沿着过去遗弃物形成的“星尘信标”逐步归来，然后展开星际巡演。最后终局之战。

第一版目标是代码骨架和可运行内容，不制作新美术素材。美术、头像、事件图、图标都优先使用原版占位资源，WIP 资源 key 要集中登记，方便后续替换。

## 设计原则

- 尽量抄原版和参考 mod 的框架，不从零发明复杂系统。
- 目标游戏版本按当前 descriptor，约为 Stellaris 4.4.x。
- 明确依赖原版游牧/方舟船 DLC 机制。
- 玩家国家必须绑定 `origin_mygo_eternal_return`，主线逻辑尽量通过这个起源触发和限制。
- 事件要有引导感，不要强行按头。玩家应被剧情、遗迹和局势压力诱导推进。
- 不做新 GUI。随时通讯栏第一版使用 Gray 式可反复打开的通讯事件菜单。
- 所有新剧情创作以 `1/文案风格最高要求.txt` 为最高的文风约束；`1/文案草稿/逆向.md` 与 `1/文案草稿/弃用.yaml` 仅保留为历史材料。
- 人工文案复核通过前不得写入游戏加载目录。导入载荷必须带人工批准标记，先运行默认预检，再显式使用 `-Apply`。

## 当前剧情结构

Phase 1：虚空流浪与记忆残页。

- 开局为游牧帝国，无母星，乘坐迷子号。
- 开局后触发序章和星尘信标事件链。重力诅咒 Situation 已整体迁入 `1/废案/重力诅咒/`，不再由游戏加载，也不得重新接入。
- 星尘信标不是全部开局生成，而是类似先驱者/站在巨人之肩：先揭示第一个，再逐步揭示后续。
- 第一个信标生成在母星系，后续信标生成在新建星系，避免坐标离玩家过远。
- 玩家依次完成四条详细星尘信标链；Popy 终章补齐旧版遗物兼容旗标。
- Popy 终章直接结束 Phase 1 并进入 Phase 2，不再设置额外压力条、高频缓存清理或删除记忆选择。

Phase 2：失忆的齿轮与地球之墓。
- 刷出终极遗址“地球之墓”。
- 完成后开始星际巡演玩法，在每个国家触发事件，巡回演出。


## 当前重要文件

- `1.mod`：本地 mod 入口。
- `1/descriptor.mod`：mod 元数据。
- `1/prescripted_countries/00_mygo_prescripted_countries.txt`：MyGO 玩家预设国与三个 AI 乐队国家。
- `1/common/governments/civics/00_mygo_origins.txt`：`origin_mygo_eternal_return`。
- `1/common/on_actions/00_mygo_on_actions.txt`：开局触发入口。
- `1/events/mygo_events.txt`：主线、考古、通讯菜单等通用事件。
- `1/events/mygo_story_events.txt`：开局剧情通讯链，事件号主要为 `mygo.400+`。
- `1/events/mygo_sakiko_events.txt`：地球之后的祥子归来航路与月之森分支，事件号主要为 `mygo.649-681`。
- `1/events/mygo_resurrection_events.txt`：爽世、灯、乐奈、立希的死亡与复活事件。
- `1/common/scripted_effects/00_mygo_effects.txt`：主线遗址生成、Phase 切换、星尘信标推进等效果。
- `1/common/scripted_effects/01_mygo_story_effects.txt`：开局剧情中创建队员领袖等效果。
- `1/common/archaeological_site_types/00_mygo_arc_sites.txt`：星尘信标与地球之墓考古遗址定义。
- `1/common/missions/missions/00_mygo_contracts.txt`：作曲、演出、巡演三类合约。
- `1/common/special_projects/00_mygo_contract_projects.txt`：三类合约对应的特殊项目。
- `1/common/special_projects/01_mygo_sakiko_projects.txt`：祥子归来航路的 A3 至 A7 联合审计项目。
- `1/common/country_types/00_mygo_country_types.txt`：随时通讯自定义联系人类型。
- `1/common/governments/00_mygo_governments.txt`：四国及月之森分支的政府显示。
- `1/common/diplo_phrases/`：三个乐队国家及 MyGO 对外的外交文本槽位。
- `1/common/solar_system_initializers/00_mygo_stardust_initializers.txt`：后续信标新建星系 initializer。
- `1/common/start_screen_messages/00_mygo_start_screen_messages.txt`：MyGO 开局文本绑定。
- `1/localisation/simp_chinese/mygo_l_simp_chinese.yml`：简体中文本地化，必须保持 UTF-8 BOM。
- `1/common/scripted_variables/00_mygo_wip_assets.txt`：WIP 占位资源登记。
- `1/tools/import_gemini_drafts.ps1`：Gemini 草稿导入器。
- `1/tools/validate_mygo_mod.ps1`：基础校验脚本。
- `1/import_queue/`：待导入 Gemini 草稿队列。
- `1/import_archive/`：已处理草稿归档。
- `1/import_failed/`：导入失败草稿归档。
- `1/剧情事件模板.txt`：剧情通讯事件模板。
- `1/考古遗址模板.txt`：星尘信标考古链模板。
- `1/导入模板.yaml`：给 Gemini 或文案组使用的结构化草稿模板。
- `1/文案风格最高要求.txt`：当前剧情创作的最高规范，优先级高于其他文风文件。
- `1/文案原文总结_考古遗址与MyGO事件.md`：指定本地化区间的剧情事实、角色信息边界、伏笔与连续性汇总；续写联合Live和Popy路线前应先读取。
- `1/项目背景.md`：面向人类与后续会话的当前功能矩阵、已知缺口和下一步；项目状态以此处为准。
- `1/WIP文本清单.md`：当前简中本地化中全部带 `WIP` 标记的现役与兼容文本；修补时逐项核对，避免遗漏。
- `1/废案/重力诅咒/`：已从游戏加载范围剥离的旧 Situation、事件、修正、本地化及接线记录，不得重新接入。

## 当前开局事件节奏

Stellaris 以天为基本时间单位，事件不宜过近。当前规则：

- 连续小链事件间隔 1-5 天。
- 非连续主线事件间隔 20-60 天。
- 特殊控制节奏用的事件间隔200天及以上。
- 开局最初的建立性事件可以略短，但也不要堆在同一天。

当前安排：

- `mygo.400`：开局初始化后 5 天。
- `mygo.410`：开局初始化后 30 天。
- `mygo.410.b -> mygo.420`：35 天。
- `mygo.420.b -> mygo.421`：25 天。
- `mygo.421.a -> mygo.422`：30 天。
- `mygo.422 -> mygo.423`：2 天，舰内巡视连续段。
- `mygo.423 -> mygo.424`：2 天，舰内巡视连续段。
- `mygo.424 -> mygo.425`：25 天。

## 开局剧情链现状

`mygo.400`：SOYO 内政汇报，推进后创建 SOYO official。

`mygo.410`：TOMORI 科学汇报，推进后创建 TOMORI scientist，并揭示第一个星尘信标。

`mygo.420`：TAKI 军需处通讯，推进后创建 TAKI commander。

`mygo.421`：ANON 私人高频缓存日志。

`mygo.422`、`mygo.423`、`mygo.424`：迷子号舰内巡视连续三段。

`mygo.425`：RAANA 独立勘探员，推进后创建 RAANA scientist。

通讯事件一般使用：

```txt
diplomatic = yes
picture_event_data = { room = root }
```

普通询问选项使用 `response_text` 和 `is_dialog_only = yes`，不会推进剧情。推进剧情的选项使用 `default_hide_option = yes`，并在 `hidden_effect` 中触发后续事件或 scripted effect。

## 星尘信标现状

截至 2026-07-22，已接入四条详细考古链：

- `mygo_stardust_string_site`：6 阶段，`mygo.1001-1006`。
- `mygo_stardust_black_gold_site`：9 阶段，`mygo.1101-1109`。
- `mygo_stardust_two_site`：6 阶段，`mygo.1201-1206`，完成后进入联合 Live 与三国重逢桥段。
- `mygo_stardust_popy_station_site`：7 阶段，`mygo.1301-1307`，完成后揭示地球坐标并进入 Phase 2。

`mygo_stardust_crychic_site` 已正式退役为 1 阶段兼容占位。保留定义和旧事件，不删除、不生成、不扩写，也不得重新接入主线。当前正式 Popy 终章直接补齐 `mygo_relic_notebook` 与 `mygo_relic_crychic` 等兼容旗标，并触发 `mygo.120` 进入 Phase 2。

扩写后续考古链时，参考 `1/考古遗址模板.txt`。如果详细考古链本身已经包含结尾反应，最终阶段不要再额外触发 `mygo.111` 到 `mygo.115` 这类占位弹窗。

地球之墓 `mygo_earth_tomb_site` 已接入 6 阶段 `mygo.201-206`；`mygo.204` 两天后触发 `mygo.207`，最终阶段交给 `mygo.220` 完成单一路线的巡演解锁。旧坏结局/真结局口径已经退役。

## Gemini 草稿导入规则

用户会经常把 `gemini-code-*.txt` 和 `gemini-code-*.yaml` 放到 `1/` 根目录或 `1/import_queue/`。

这些文件不能直接裸加载。处理流程：

1. 先读取并理解草稿内容。
2. 判断它属于开局剧情、通讯菜单、考古链、合约、Phase 2、领袖解锁还是纯素材。
3. 手动安排事件入口。导入器不会、也不应该自动设计事件入口。
4. 合并到正式文件：
   - 事件进 `1/events/mygo_story_events.txt` 或 `1/events/mygo_events.txt`。
   - 本地化进 `1/localisation/simp_chinese/mygo_l_simp_chinese.yml`。
   - 领袖、资源、遗址生成、阶段切换等逻辑优先写入 scripted effect。
5. 原始 Gemini 文件处理完后移动到 `1/import_archive/gemini_merged_YYYYMMDD_HHMMSS/`。
6. 更新 `1/import_report.txt`，说明本批草稿如何接入。
7. 运行校验脚本。

可以用导入器辅助，但不要盲目相信导入结果：

```powershell
powershell -ExecutionPolicy Bypass -File 1\tools\import_gemini_drafts.ps1
```

导入器适合把草稿合并到正式文件，但事件入口、节奏、阶段位置仍应人工判断。

## 校验要求

### 外部 Stellaris 工具（2026-10-11 接入）

- 已配置项目级 MCP `rstellariscribe` 和 `rstellarisgui`，源码位于根目录 `.local-tools/`，不打包进 mod。操作方法、固定版本和已知限制见 `tools/stellaris/README.md`。
- 脚本工作先用 Scribe 查询相关知识、打开 `1/` 工作区；修改后运行原有校验器，再用 `node tools/stellaris/run.mjs validate` 获取补充诊断。只检查现役加载内容，不能根据归档、废案或其他版本规则直接改游戏文件。
- Gui 用于现有界面、素材注册和日志的检查与参考；本次工具接入不改变“不新建 GUI、不新增美术”的约束。生成器先 dry-run；文案写入仍遵守人工批准和导入预检规则。
- 本机原版当前为 4.5.0，descriptor 为 4.4.*；Gui 的原版读取限定 4.4.x，不能绕过版本检查或把工具自检当成游戏内验收。Scribe 文档混有 4.1.7 与 4.4.x 口径，语法结论务必核对本机原版。
- 当前会话未加载新 MCP 时，使用 `node tools/stellaris/run.mjs list scribe` / `list gui` 查看参数，再用 `call scribe|gui TOOL ARGS.json` 调用。不要将整个 mod 根目录交给 Gui 递归检查（会包含归档和废案）。

每次修改后至少运行：

```powershell
powershell -ExecutionPolicy Bypass -File 1\tools\validate_mygo_mod.ps1
```

简中本地化必须保持 UTF-8 BOM：

```powershell
$path='1\localisation\simp_chinese\mygo_l_simp_chinese.yml'
$bytes=[System.IO.File]::ReadAllBytes((Resolve-Path -LiteralPath $path))
if ($bytes.Length -ge 3 -and $bytes[0] -eq 239 -and $bytes[1] -eq 187 -and $bytes[2] -eq 191) { 'utf8 bom ok' } else { 'missing bom'; exit 1 }
```

常用检索：

```powershell
rg -n "mygo\.42|mygo_story\.42|mygo_zero|mygo_stardust" 1
```

## 编码与文件编辑注意事项

- 使用 `apply_patch` 做手动文件编辑。
- 不要用随意的 shell 重定向覆盖 yml，本地化 BOM 容易丢。
- 不要改 workshop mod 的 `ugc_*.mod`，除非用户明确要求。
- 不要把 `import_archive/` 的草稿重新当作待导入文件处理。
- 不要删除或重新接线退役的旧事件入口、兼容占位和内容不同的“副本”草稿；除非用户以后明确授权删除，否则原地保留。
- 不要把 `*.yaml` 直接放进 Stellaris 本地化目录，游戏读取的是 `.yml`。
- `l_english:` 的 Gemini 草稿即使内容是中文，也要并入 `l_simp_chinese:` 文件。
- 新增 key 使用 `mygo_` / `mygo.` / `mygo_story.` 前缀，避免和原版或其他 mod 冲突。
- `mygo_l_simp_chinese.yml` 中不要重复本地化 key。
- 事件 ID 不要重复。当前开局及延伸故事主要使用 `mygo.400-567`，信标使用 `mygo.1001-1307`，地球之墓使用 `mygo.201-220`，合约、巡演、战争与首都到访主要使用 `mygo.600-639`。

## 参考路径

本机 Stellaris 原版路径：

`F:\steam\steamapps\common\Stellaris`

参考 workshop mod：

`F:\steam\steamapps\workshop\content\281990\3491727485`

务必参考原版/外部 mod。

## 当前优先级

1. 先为 2026-07-21 之后积累的大量未提交代码、本地化、美术和文档建立可回退检查点；不得借整理之名删除旧入口、重复草稿、废案或本地工具。
2. 优先游戏内回归 `mygo.640-642` 改名链、`mygo.649-681` 祥子归来航路和 `MYGO_A3_A7_AUDIT_PROJECT`，覆盖和解、和平臣属、征服战争、祥子执政及旧存档重试。
3. 回归 `mygo_resurrection.1-8`，确认两个领袖死亡 on_action 不会重复触发，四名角色能在 7 天后正确重建。
4. 在新开档确认重力诅咒完全消失，同时四条信标、Popy 终章、Phase 2 和 `mygo.220` 单一路线巡演解锁保持正常。
5. 核对改名链、MyGO 舰队/部队命名和复活文案的审核记录漂移；未确认人工批准前不继续扩写，也不擅自撤回当前加载内容。
6. 随后补测自定义通讯联系人、36 条臣属问候、事件图、三类合约、首都到访和普通外交槽位，并逐步留下具体覆盖记录。
7. 继续维护 Gray 式通讯菜单及 Phase 1 / Phase 2 / 巡演解锁后的差分，不新建 GUI；未经用户明确要求不继续新增美术。

## 不要做的事

- 不要制作新美术素材。
- 不要改主界面 GUI。
- 不要把剧情事件密集堆在开局几天内。
- 不要让所有星尘信标开局全部生成。
- 不要让详细考古链和占位记忆排异事件重复触发。
- 不要为了“完整”大幅重构已有文件。优先沿用当前文件结构和命名。
