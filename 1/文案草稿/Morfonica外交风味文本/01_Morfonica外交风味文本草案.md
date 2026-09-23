# Morfonica 外交风味文本草案

> 状态：`merged`
> 人工批准：用户于 2026-07-21 明确批准合并
> 写入范围：已导入 `events/`、`common/`、`localisation/`；低频状态来电保留为候选。
> 依据：`文案风格最高要求.txt`、`文案原文总结_考古遗址与MyGO事件.md`、`群星原版特殊国家外交文本调研.md`。  
> 实现提醒：未来导入时，专属 `diplo_phrases` 使用 `mygo_morfonica + origin_mygo_eternal_return` 双重条件，并覆盖对应 action 的 `select/consider/propose/accept/refuse` 实际槽位。  
> 标题中的 P0/P1/P2 表示落地优先级，不是已经删除的剧情 Phase 2。  

## 一、文案事实边界

### Morfonica 已知

- 蝶之翼和平协约国由Morfonica方舟定居形成，保留大量并行方舟时代档案。
- Morfonica、Poppin'Party与CRYCHIC曾经并行航行，并举办过三团联合Live。
- CRYCHIC后来偏离航线并失联；Morfonica不知道迷子号此后经历的完整过程。
- 真白认得灯，也记得两人过去会交换笔记。她知道自己曾在比较中产生自卑和难堪。
- Morfonica已经得知迷子号失忆。筑紫向迷子号说明过并行方舟、其他乐队去向和档案受灾情况。
- 定居地曾遭遇自然飓风。档案得到抢救，但修复、排序和校验仍在继续。
- 真白与灯已经通过受损旧笔记重新交谈，并提供过第一太空休息区路线。
- 协约国已经定居。它有居民、救灾、档案修复、殖民地管理和自己的演出安排，不能随叫随到。

### Morfonica 尚未知

- 不知道迷子号内乱、方舟解体与记忆清理的完整因果。
- 不知道爆破栓、被剥离区段或祥子在其中的确切责任。
- 不知道循环、地球之墓和任何尚未落地的终局真相。
- 不应自动知道玩家刚完成的遗址内容；特殊来电必须有可验证的信息来源。
- 真白可以从灯的反应中猜测过去，但猜测不等于恢复完整记忆。

### 声音原则

- 主要发言人是仓田真白。她会犹豫、自我修正，也能在代表国家时把话说完。
- 真白不是持续柔弱或持续诗化。她处理具体事务时会核对资料、承认错误、给出安排。
- 她的想象力应落在可见对象上：受潮纸页、礼堂灯光、山脊气流、档案扫描线。不要每句话都写蝴蝶、羽翼或梦境。
- 触及灯、旧笔记和创作比较时，她的迟疑会更明显。不要把这种迟疑直接写成爱情结论。
- 筑紫可以承担组织、接待和救灾口径；瑠唯可以提供技术和审核意见；透子与七深可以偶尔打断，但不能把国家外交变成五人轮流报名字。
- 和平协约国愿意合作，不等于没有边界。战争、移民、附庸和档案访问都要承认居民与机构的判断。

## 二、首次接触

普通首次接触与联合Live旧频段接通均已落地，本稿不替换：

- `mygo_contact.normal.morfonica.desc`
- `mygo_contact.truenormal.morfonica.desc`
- `mygo_contact.relic.morfonica.known_desc`

后续文本承认：真白已经问过灯是否还在，也已经知道迷子号失忆。不得再次把普通问候写成第一次认出CRYCHIC。

## 三、随机外交问候 P0

问候语不加引号，不写台词外动作。每条独立抽取。

### 3.1 中立问候

候选前缀：`MYGO_MORFONICA_NEUTRAL_GREETING_`

1. 迷子号的识别信号很清楚哦。请问这次需要Morfonica做什么？
2. 早上好，小爱音！
3. 小灯最近还在写吗？如果她愿意的话，可以把新的那一本也给我看看。
4. 苍蝶高原今天有强侧风。没什么，只是想让你知道。
5. 透子说小爱音直接飞过来看她也没关系，但请不要听她的！

### 3.2 友好问候

候选前缀：`MYGO_MORFONICA_FRIENDLY_GREETING_`

1. 小灯在吗？我写到一半，有一部分不知道该不该留下来……想先给她看看。
2. 小爱音！客房已经整理好了。窗外能看到高原的云层……晚上会很冷，多带一件衣服。
3. 今天透子说，她有点想你了。
4. 爱音！今天我这边天气不错，要不要，趁这个机会一起来整理照片？
5. 好怀念过去和你一起的时光……

### 3.3 敌对问候

候选前缀：`MYGO_MORFONICA_HOSTILE_GREETING_`

1. ……早，爱音小姐。
2. 爱音小姐，请让迷子号退出敏感区与警戒区。其他事情以后再谈。
3. 我不想把以前的相遇拿来替你现在的行为辩解。
4. 小灯的频道不会被关闭，和你的频道是另一回事。
5. 你没有过去的爱音好。一点也不如。

### 3.4 战争问候

候选前缀：`MYGO_MORFONICA_WAR_GREETING_`

1. 就算是我这种人，也不会屈服于你们的！
2. 我很害怕。但Morfonica的舰队会执行防御命令！
3. 不要靠近居民区。那里没有你们要找的答案。
4. 如果小灯也在舰桥上，告诉她离舷窗远一点。
5. 我会永远记住这一刻，爱音。

## 四、宣战与和平 P0

### 4.1 Morfonica 向 MyGO 宣战

候选 key：`MYGO_MORFONICA_DOW_PROPOSE_01`

> “最后一份交涉记录已经封存。”
>
> “Morfonica将与你们进入战争状态。我们会保护自己，哪怕代价是你们的全部！”

### 4.2 玩家向 Morfonica 宣战后的回应

候选 key：`MYGO_MORFONICA_DOW_ACCEPT_01`

> “我知道了。”
>
> “我不想在这种时候提起从前。舰队已经进入防御位置，哪怕是我这种人！我不会让你们越过哪怕一座炮台！”

### 4.3 Morfonica 提议和平

候选 key：`MYGO_MORFONICA_PEACE_PROPOSE_01`

> “伤员转运和失踪船只的搜寻都需要稳定航道。”
>
> “请停火，哪怕是为了迷子号的船员们！”

### 4.4 考虑玩家的和平提议

候选 key：`MYGO_MORFONICA_PEACE_CONSIDER_01`

> “请稍等。筑紫和瑠唯正在核对边界、撤离时限和人员交换名单。”

### 4.5 接受和平

候选 key：`MYGO_MORFONICA_PEACE_ACCEPT_01`

> “协议通过了。所有舰队会在确认对方撤离后停火。”
>
> “爱音小姐……至少今天，不会再有人因为我们下达的命令受伤了。”

### 4.6 拒绝和平

候选 key：`MYGO_MORFONICA_PEACE_DECLINE_01`

> “我们不能接受！我们会继续战斗，直到彻底打败你，粉色的怪物！”

## 五、战争结果事件 P0

### 5.1 第一次战争维持现状

候选 key：`mygo_morfonica_war_status_quo_first.desc`

> “小灯的名字不在伤员上面。”
>
> “我们的未来是可以修复的，爱音小姐。”

### 5.2 MyGO 战胜 Morfonica

候选 key：`mygo_morfonica_war_lost_first.desc`

> “Morfonica会履行停战条款。爱音……我不想再看见你。”

### 5.3 Morfonica 战胜 MyGO

候选 key：`mygo_morfonica_war_won_first.desc`

> “条款不会再追加。把受损的船带走吧，爱音。”

### 5.4 第二次战争开始

候选 key：`mygo_morfonica_second_war.desc`

> “我们的怒火，马上要烧到你的甲板上！”
>
> “超空间引擎，启动！”

### 5.5 战后第一次恢复普通通讯

候选 key：`mygo_morfonica_postwar_first_contact.desc`

> “爱音。你们有什么事？”

## 六、基础外交行动 P1

### 6.1 贸易与赠礼

**Morfonica提出贸易**  
`MYGO_MORFONICA_TRADE_PROPOSE_01`：小爱音，这是我们提出的方案！

**考虑玩家贸易**  
`MYGO_MORFONICA_TRADE_CONSIDER_01`：请等一下。七深说这个价格很普通，但她说的普通……有时候不太可信呢。

**接受贸易**  
`MYGO_MORFONICA_TRADE_ACCEPT_01`：核对完成。谢谢你，小爱音。

**拒绝贸易**  
`MYGO_MORFONICA_TRADE_DECLINE_01`：很抱歉，这些超出了Morfonica的承受范围。

**收到玩家赠礼**  
`MYGO_MORFONICA_GIFT_ACCEPT_01`：真的可以收下吗？谢谢你们，谢谢你，爱音！

### 6.2 开放与关闭边境

`MYGO_MORFONICA_OPEN_BORDERS_01`：民用航道已经向迷子号开放。欢迎你来。

`MYGO_MORFONICA_CLOSE_BORDERS_01`：边境暂时关闭。已经入境的船只可以沿原航线离开。

### 6.3 使馆

`MYGO_MORFONICA_EMBASSY_ACCEPT_01`：使馆用房在档案馆外侧。那里很安静，放心休息，爱音。

`MYGO_MORFONICA_EMBASSY_DECLINE_01`：嗯……再考虑一下，小爱音？

`MYGO_MORFONICA_RECALL_EMBASSY_01`：工作人员和私人资料会安全送回，爱音，注意接收。

### 6.4 研究协议

`MYGO_MORFONICA_RESEARCH_PROPOSE_01`：我很希望能再听到小灯的声音。她的想法很有价值……

`MYGO_MORFONICA_RESEARCH_ACCEPT_01`：协议通过。谢谢你，小爱音！

`MYGO_MORFONICA_RESEARCH_DECLINE_01`：唔，暂时不行，抱歉。

`MYGO_MORFONICA_RESEARCH_BREAK_01`：共享终端将在本周期结束后关闭。小灯……

### 6.5 商业协议

`MYGO_MORFONICA_COMMERCIAL_PROPOSE_01`：要交换演出无料吗？

`MYGO_MORFONICA_COMMERCIAL_ACCEPT_01`：可以哦。要注意一下！透子负责的宣传页需要另外送审，千万不能直接发布！

`MYGO_MORFONICA_COMMERCIAL_DECLINE_01`：暂时不行。希望爱音你能理解。

`MYGO_MORFONICA_COMMERCIAL_BREAK_01`：我觉得，自己处理自己的事情比较好……

### 6.6 移民协议

`MYGO_MORFONICA_MIGRATION_PROPOSE_01`：迷子号的大家要是累了，随时来高原定居！

`MYGO_MORFONICA_MIGRATION_ACCEPT_01`：高原昼夜温差很大，请把适应说明一起发给居民。

`MYGO_MORFONICA_MIGRATION_DECLINE_01`：现在不能答应。爱音，希望你能理解。

`MYGO_MORFONICA_MIGRATION_BREAK_01`：移民协议会终止的。虽然我不想这么做。

### 6.7 互不侵犯与防御条约

`MYGO_MORFONICA_NAP_ACCEPT_01`：其实我觉得，我们之间不需要签这个！

`MYGO_MORFONICA_NAP_DECLINE_01`：有一些事还没有得到解释，爱音。现在签字太早了。

`MYGO_MORFONICA_NAP_BREAK_01`：互不侵犯协议已经终止。爱音……你们会攻击我吗？

`MYGO_MORFONICA_DEFENSIVE_ACCEPT_01`：小爱音！有你在，我们都会更安全的！

`MYGO_MORFONICA_DEFENSIVE_DECLINE_01`：Morfonica不会接受这份条约……抱歉。

`MYGO_MORFONICA_DEFENSIVE_BREAK_01`：共同防御义务到此结束。爱音，我们之间。

### 6.8 联邦

`MYGO_MORFONICA_FEDERATION_INVITE_01`：恢复我们过去的友情吧！迷子号，愿意加入吗？

`MYGO_MORFONICA_FEDERATION_ACCEPT_01`：成员表决已经完成！Morfonica愿意加入。

`MYGO_MORFONICA_FEDERATION_DECLINE_01`：我们目前不能加入。还不可以。

`MYGO_MORFONICA_FEDERATION_LEAVE_01`：退出程序已经启动。又一次分开了，爱音……

### 6.9 驿站协定

`MYGO_MORFONICA_WAYSTATION_PROPOSE_01`：迷子号驿站！听起来很棒~

`MYGO_MORFONICA_WAYSTATION_ACCEPT_01`：选址通过。我们会协助补给和维修窗口！

`MYGO_MORFONICA_WAYSTATION_DECLINE_01`：暂时不行，爱音。

`MYGO_MORFONICA_WAYSTATION_BREAK_01`：驿站许可已撤销，爱音，你们的设备可在宽限期内拆除转运。

### 6.10 附庸与宗主关系 P2

`MYGO_MORFONICA_SUBJUGATE_PROPOSE_01`：这份协议会为迷子号居民提供长期保护。请完整阅读！

`MYGO_MORFONICA_SUBJUGATE_DECLINE_01`：Morfonica暂时还不会把自己的居民和档案交给迷子号管理。

`MYGO_MORFONICA_BECOME_SUBJECT_ACCEPT_01`：表决已经通过。靠你了，小爱音。

`MYGO_MORFONICA_ACCEPT_SUBJECT_01`：我们会履行保护义务。站在我的身后，小爱音！

`MYGO_MORFONICA_RELEASE_SUBJECT_01`：小爱音，我们之间的协议暂时解除了。

`MYGO_MORFONICA_ASK_RELEASE_01`：那个，小爱音！我们请求结束从属条款！

`MYGO_MORFONICA_SECRET_FEALTY_01`：小爱音……我们偷偷地……

## 七、敌对外交 P1/P2

`MYGO_MORFONICA_RIVAL_PROPOSE_01`：爱音！你把以前我们的同行看成什么了？

`MYGO_MORFONICA_RIVAL_END_01`：爱音，谢谢你没有忘掉我们的过去……

`MYGO_MORFONICA_INSULT_01`：爱音小姐，连透子都比你现在可靠！

`MYGO_MORFONICA_GUARANTEE_01`：迷子号不会独自面对入侵！

`MYGO_MORFONICA_SUPPORT_INDEPENDENCE_01`：救命！！

## 八、特色合约文本 P1

### 8.1 作曲委托

**发布**  
候选 key：`contract_mygo_composition_issued_morfonica`

> Morfonica发来一批刚从受潮档案中分离出来的纸页。扫描件满是水痕、折角。看来真白的旧歌词只剩下几个能够辨认的句子。她们需要灯帮忙识别歌词。
>
> 瑠唯在说明末尾写道：§L“不要补写无法确认的原文。请以现存片段完成一份可以演奏的新稿。”§!

**接受后的来电**  
候选 key：`mygo_morfonica_composition_accept.desc`

> 真白把两本册子并排放在扫描台上，又把其中一本往镜头外推了一点。
>
> “帮我看看这个！”

**完成**  
候选 key：`contract_mygo_composition_completed_morfonica`

> 真白把文件名里的“复原稿”改成了“灯的创作”。

**失败/取消**  
候选 key：`contract_mygo_composition_failed_morfonica`

> 受损纸页重新回到恒湿匣。或许没人能知道它们是什么了。
>
> 最后一栏写着：§L等待下一次可用扫描。§!

### 8.2 演奏委托

**发布**  
候选 key：`contract_mygo_performance_issued_morfonica`

> 飓风修复后的礼堂需要一场新的live来振奋人心。
>
> “我们想用一次真正的演出来重新启动它！如果迷子号愿意来的话。”

**接受后的来电**  
候选 key：`mygo_morfonica_performance_accept.desc`

> 筑紫把场地、泊位和排练时间逐项确认好了。
>
> 就等你们来。

**完成**  
候选 key：`contract_mygo_performance_completed_morfonica`

> 最后一个音落下后，礼堂的回声沿新修复的侧墙返回舞台。
>
> 真白站在幕布后听着观众席连绵不绝的掌声。

**失败/取消**  
候选 key：`contract_mygo_performance_failed_morfonica`

> 预定演出未能举行，礼堂恢复为空载测试模式，舞台灯一排排熄灭。
>
> 人们都很失望。已经印好的节目单被收进下一场活动的纸箱底部，用来防潮。

### 8.3 星海巡演

**发布**  
候选 key：`contract_mygo_tour_issued_morfonica`

> Morfonica把数座高原殖民地列入巡演路线。部分站点仍在重建，主要的舞台包括正式礼堂、临时风障舞台和档案馆中庭。
>
> “要来吗，和我们一起演奏！”

**接受后的来电**  
候选 key：`mygo_morfonica_tour_accept.desc`

> 巡演路线确认！真白上传了一份空白记录册，Morfonica将暂时与你们一同前行。
>
> “联合live！真让人期待……”

**完成**  
候选 key：`contract_mygo_tour_completed_morfonica`

> 巡演圆满完成。真白的眼角泛着泪水。安可曲目更是见证着你们一路的笑与泪。
>
> 真白和灯久久不愿意分开：§L下一次也要一起演出！§!

**失败/取消**  
候选 key：`contract_mygo_tour_failed_morfonica`

> 未抵达站点的页面，路线状态旁标注了“暂时中止活动”。
>
> 你知道，对少女乐队来说，“暂时”的意思就是“永远”了。

## 九、低频状态来电 P2

### 9.1 MyGO击杀守护者

> 在确认迷子号没有人员失踪后，Morfonica的真白发来祝贺。
>
> “很厉害。还有……你们都回来就好。”

### 9.2 MyGO成为银河守护者

> “需要保护的地方会比地图上标出的更多。”
>
> “相信你们！”

### 9.3 MyGO成为银河危机

> “小灯写过的东西，不是为了满足你们扭曲的欲望！”

### 9.4 Morfonica被第三方重创

> “如果迷子号还能抵达，请帮我们接走居民！”

实现前必须检定：双方非交战、Morfonica确实遭受严重战争损失、事件未重复触发。

### 9.5 迷子号主方舟失去行动能力

> “小灯听得到的话，请回复！我们会来帮忙的！”

实现前必须检定：双方非交战、主方舟确实失能、Morfonica具备通讯和可达条件。

## 十、暂不落地与禁写

- 不重写已经落地的首次接触、旧笔记与第一太空休息区路线。
- 不写Phase 2、地球之墓和真结局反应，相关路线已经从当前方案删除或尚未决定。
- 不让真白自动知道内乱、爆破栓或祥子的确切责任。
- 不把真白的每句话都写成诗，也不把她固定成只会自卑和道歉的人。
- 不把真白与灯的关系直接宣布成爱情、灵魂伴侣或命中注定。
- 不让Morfonica因为旧友情无条件开放全部档案、边境或军事权限。
- 不把筑紫只写成吐槽真白，也不把瑠唯只写成否定情绪的机器。
- 不用“蝴蝶重新振翅”之类总结句替每场通讯收尾。

## 十一、人工复核重点

1. 真白对灯的称呼是否固定为“小灯”，对爱音是否固定为“爱音小姐”。
当然不是。看我心情。
2. 敌对与战争状态下，私人笔记频道是否仍保留，还是随国家频道一并关闭。
这算什么。游戏里没有这个东西。这只是一个设定。看我心情。
3. Morfonica国家制度的正式口径：协约国议会、成员表决、档案委员会是否可继续使用。
看我心情。独裁挺好的。
4. 作曲委托是否允许瑠唯在发布说明中直接出现，还是全部由真白转述。
这算什么问题啊。凑数的吗。
5. 附庸与秘密效忠文本是否符合计划中的国家强度；若不会启用，可整段保留为候选。
启用启用。
6. 低频状态来电只保留草案，触发条件另行设计，不与普通外交短句同时导入。
随便。反正没什么可能能触发。
