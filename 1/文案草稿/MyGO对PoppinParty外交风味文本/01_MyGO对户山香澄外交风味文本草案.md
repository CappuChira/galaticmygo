# MyGO 对户山香澄外交风味文本草案

> 状态：`merged`
> 人工批准：用户于2026-07-22明确批准全部合并
> 写入范围：外交短句及具名候选已导入`common/`与`localisation/`；无键特殊来电保留为候选。
> 依据：`文案风格最高要求.txt`、`文案原文总结_考古遗址与MyGO事件.md`、既有 Poppin'Party 对 MyGO 外交文本。
> 方向定义：发言方固定为迷子号／MyGO，主要发言人为千早爱音；接收方固定为户山香澄／Poppin'Party。
> 实现提醒：未来导入时必须同时检定发言方具有 `origin_mygo_eternal_return`、接收方具有 `mygo_popipa`，不能与现有“香澄对 MyGO”短句共用同一方向条件。
> 标题中的P0/P1/P2表示未来落地优先级，不是已经删除的剧情Phase 2。

## 一、事实与信息边界

### MyGO 已知

- Poppin'Party、Morfonica与旧CRYCHIC曾经并行航行，并举行过三团联合Live。
- 香澄认得Spica及CRYCHIC，记得三团约定的下一场Live。
- 爱音已经把失忆、星尘信标和经过筛选的航行经历告诉香澄。
- 香澄已经承诺Poppin'Party会支持迷子号，有困难可以直接提出。
- Poppin'Party已经定居，拥有殖民地、居民、舰队、公共设施和自己的演出安排。
- 爱音已经开始练吉他，也参与过迷子号内部Live。她并非因为香澄出现才第一次接触吉他。
- 爱音知道香澄热情、行动快，也逐渐看出有咲经常负责把香澄的想法整理成可执行方案。

### MyGO没有公开或不能擅自确定

- 爱音没有向香澄说明内乱、方舟解体和爆破栓的完整经过。
- 爱音自己也不掌握失忆前全部事实，不能在外交短句中突然恢复完整记忆。
- 不能因为香澄无条件支持迷子号，就默认Poppin'Party会无条件接受边境、战争、附庸或移民要求。
- 不能把香澄的热情自动理解为私人爱慕，也不能让爱音替她定义关系。
- 不写已经删除的Phase 2、地球之墓或未确定终局。

## 二、爱音的对外声音

- 常规发言人是千早爱音。她自来熟、反应快、擅长把尴尬转成可继续谈的话题。
- 她在香澄面前容易产生两种同时存在的冲动：想靠近这个熟悉自己的旧朋友，也想证明自己不只是需要帮助的失忆者。
- 她喜欢受到肯定。香澄直接夸奖她时，她可能立刻得意；发现频道里还有其他人在听后，又会补上正式口径。
- 她会用执政官身份处理边境、战争、居民和条约，不应把所有国家事务写成少女闲聊。
- 爱音可以偶尔让爽世核对合同、让立希确认军务、替灯转交作品，但不能每条文本都把五人轮流叫出来。
- 友好不等于永远轻松。香澄反复问“要不要帮助”时，爱音会感激，也会因为被当成弱者而逞强。
- 敌对时爱音会说重话、攻击香澄的判断，也可能拿有咲收拾残局来刺她。发生了就发生了，不用补一句“其实仍然关心”。

### 称呼暂定

- 中立、正式场合：`香澄前辈`
- 友好、私人频道：可使用`香澄`，偶尔使用`香澄前辈`
- 敌对、战争：`香澄`或`户山香澄`
- 国家正式名称使用`Poppin'Party`；轻松场合可以使用`popipa`

称呼尚未在现有角色间称呼表中明确，需人工确认后再落地。

## 三、既有首次接触

现有首次接触已经包含MyGO对香澄的直接回复，本稿不替换：

- `mygo_contact.normal.popipa.a`：你好，Poppin'Party！迷子号仍在航行~
- `mygo_contact.reply.popipa.friendly`
- `mygo_contact.reply.popipa.reserved`
- `mygo_contact.reply.popipa.forceful`
- `mygo_contact.relic.popipa.a`：嗯，还没有结束！
- `mygo_story.551`：爱音向香澄坦白失忆与星尘信标

后续文本不得再次写成爱音第一次认出香澄，也不得让她每次通讯都重新坦白失忆。

## 四、MyGO随机外交问候 P0

这些文本用于Poppin'Party打开MyGO外交界面时，由爱音主动应答。

### 4.1 中立问候

候选前缀：`MYGO_TO_POPIPA_NEUTRAL_GREETING_`

1. 香澄前辈，频道很清楚。Poppin'Party这次想谈什么？
2. 先说好哦，迷子号今天的航线没有走反。立希确认过了。
3. 香澄前辈，你们送来的殖民地广播我听完了。最后那段是正式节目，还是忘记关麦了？
4. Tomorin在整理新的词。等她自己决定要不要发，我可不会替她答应哦。
5. 迷子号目前一切正常。嗯，至少这份对外报告上是这么写的。

### 4.2 友好问候

候选前缀：`MYGO_TO_POPIPA_FRIENDLY_GREETING_`

1. 香澄！你上次说的广场Live还算数吧？我已经把档期空出来一点点了。真的只有一点点。
2. 不用每次接通都先问我们缺不缺东西啦。补给表我等下发给你，谢谢。
3. 香澄前辈，我最近吉他真的进步了！别问立希，问我就行。
4. 今天舰桥很安静。你那边要是正在排练，就把现场声开过来吧。
5. 我发现你会把“不知道怎么办”说成“一起做什么”。……还挺好用的。

### 4.3 敌对问候

候选前缀：`MYGO_TO_POPIPA_HOSTILE_GREETING_`

1. 迷子号频道已经接通。请直接说明事项。
2. 不要再用“小爱音”把问题带过去。香澄，我正在等你的正式回答。
3. Poppin'Party过去认识的是谁，不代表你们可以替现在的迷子号作决定。
4. 如果你只是想确认我们需不需要被保护，可以关闭频道了。
5. 香澄，你总说先一起做点什么。这次请先把你做过的事解释清楚。

### 4.4 战争问候

候选前缀：`MYGO_TO_POPIPA_WAR_GREETING_`

1. 停火条件发到军事频道。其他话等舰队撤开以后再说。
2. 香澄，每一艘船上都是活生生的生命。
3. 我不会让迷子号再从任何人的星图上消失。
4. 别再说你会保护我们。先命令你的舰队停止射击。
5. 户山香澄，我是迷子号的执政官。现在，由我来回答你的舰队。

## 五、宣战与和平 P0

### 5.1 MyGO向Poppin'Party宣战

候选key：`MYGO_TO_POPIPA_DOW_PROPOSE_01`

> “最后一次交涉已经结束。”
>
> “香澄，我知道你会说再谈一次、再试一次。可是舰队已经越过了我们能退让的位置。”
>
> “迷子号将与你们进入战争状态。”

### 5.2 MyGO收到Poppin'Party宣战

候选key：`MYGO_TO_POPIPA_DOW_ACCEPT_01`

> “宣战书收到了。”
>
> “不要以为我只会带着大家逃走，香澄。迷子号会留在这里，拦住你们。”

### 5.3 MyGO向Poppin'Party提议和平

候选key：`MYGO_TO_POPIPA_PEACE_PROPOSE_01`

> “双方伤员名单、撤离线和交换坐标已经发送。”
>
> “香澄，先停火。我们之间剩下的问题，不该继续交给舰炮回答。”

### 5.4 MyGO考虑Poppin'Party的和平提议

候选key：`MYGO_TO_POPIPA_PEACE_CONSIDER_01`

> “等一下。立希正在确认撤军线，爽世在核对人员交换名单。”

### 5.5 MyGO接受和平

候选key：`MYGO_TO_POPIPA_PEACE_ACCEPT_01`

> “条件确认。迷子号舰队将按协议停火。”
>
> “香澄前辈，先把所有人带回去吧。”

### 5.6 MyGO拒绝和平

候选key：`MYGO_TO_POPIPA_PEACE_DECLINE_01`

> “我等待的是一场大胜。”
>
> “这不是停火方案。迷子号拒绝。weapons free，继续开火！”

### 5.7 第二次战争开始

候选key：`mygo_to_popipa_second_war.desc`

> “全舰进入战斗位置。”

### 5.8 战后第一次普通通讯

候选key：`mygo_to_popipa_postwar_first_contact.desc`

> “频道恢复了。香澄，你说吧。”

## 六、贸易、赠礼与边境 P1

### 6.1 MyGO提出贸易

`MYGO_TO_POPIPA_TRADE_PROPOSE_01`：香澄前辈！这是迷子号能稳定提供的数量。限量版周边不算正式货币。

### 6.2 MyGO考虑Poppin'Party的贸易

`MYGO_TO_POPIPA_TRADE_CONSIDER_01`：等一下，香澄前辈，你为什么在运费一栏画了星星？

### 6.3 MyGO接受贸易

`MYGO_TO_POPIPA_TRADE_ACCEPT_01`：条件没问题。成交！这次是我本人和Soyor……爽世小姐一起确认过的。

### 6.4 MyGO拒绝贸易

`MYGO_TO_POPIPA_TRADE_DECLINE_01`：抱歉，迷子号现在承担不了这个数量。等库存稳定以后再谈吧。

### 6.5 MyGO收到赠礼

`MYGO_TO_POPIPA_GIFT_ACCEPT_01`：真的全都给我们？谢谢，香澄前辈。那个……下次不要在货箱外面写“给小爱音”啦，全舰都看见了。

### 6.6 MyGO向Poppin'Party赠礼

`MYGO_TO_POPIPA_GIFT_PROPOSE_01`：你们收下就好。

### 6.7 MyGO开放边境

`MYGO_TO_POPIPA_OPEN_BORDERS_01`：迷子号控制区已经向Poppin'Party开放。喂！不要突然冲到舷窗外打招呼！

### 6.8 MyGO关闭边境

`MYGO_TO_POPIPA_CLOSE_BORDERS_01`：从现在起，Poppin'Party舰船不得进入迷子号控制区。已经入境的船只按指定航线离开。

## 七、使馆与基础合作 P1

### 7.1 MyGO提议设立使馆

`MYGO_TO_POPIPA_EMBASSY_PROPOSE_01`：我们在民用区整理出一间常驻办公室。香澄前辈，派谁来都可以，但入住名单必须先给S……爽世小姐！

### 7.2 MyGO接受使馆

`MYGO_TO_POPIPA_EMBASSY_ACCEPT_01`：申请通过。房间离排练区不远，可能会有点吵。你们应该不会介意吧？

### 7.3 MyGO拒绝使馆

`MYGO_TO_POPIPA_EMBASSY_DECLINE_01`：目前不适合设置常驻机构。现有频道先保留，香澄前辈。

### 7.4 MyGO召回使馆

`MYGO_TO_POPIPA_RECALL_EMBASSY_01`：迷子号使馆人员会在本周期内撤回。私人资料和共同档案请按清单移交。

### 7.5 MyGO提出研究协议

`MYGO_TO_POPIPA_RESEARCH_PROPOSE_01`：Poppin'Party有陆地实验资料，迷子号有新的方舟数据。香澄，交换着看会更快吧？

### 7.6 MyGO考虑研究协议

`MYGO_TO_POPIPA_RESEARCH_CONSIDER_01`：先别催，灯还在看你们附上的旧歌词。有咲的技术目录已经交给科研部门了。

### 7.7 MyGO接受研究协议

`MYGO_TO_POPIPA_RESEARCH_ACCEPT_01`：协议通过。超级天才爱音酱和超级天才香澄，合作成立！

### 7.8 MyGO拒绝研究协议

`MYGO_TO_POPIPA_RESEARCH_DECLINE_01`：现在不能开放这些数据。不是不信任你，香澄前辈，是迷子号自己也还没有弄清楚。

### 7.9 MyGO终止研究协议

`MYGO_TO_POPIPA_RESEARCH_BREAK_01`：共享终端将在本周期结束后关闭。已经完成的成果仍按原协议保留。

## 八、商业与移民 P1

### 8.1 MyGO提出商业协议

`MYGO_TO_POPIPA_COMMERCIAL_PROPOSE_01`：迷子号能提供移动演出、航线宣传和外环维修。Poppin'Party负责固定场地和销售窗口。怎么样，很像正式企划吧？

### 8.2 MyGO考虑商业协议

`MYGO_TO_POPIPA_COMMERCIAL_CONSIDER_01`：周边分成、场地费用、运输损耗……香澄前辈，这份真的是你写的吗？完成度也太高了吧——咳咳！没有说你不靠谱的意思！真的没有！

### 8.3 MyGO接受商业协议

`MYGO_TO_POPIPA_COMMERCIAL_ACCEPT_01`：通过！联名标志设计稿统一送审。明天就能看到结果啦！

### 8.4 MyGO拒绝商业协议

`MYGO_TO_POPIPA_COMMERCIAL_DECLINE_01`：条件还不够稳定。爱音品牌的首次跨星域合作可不能随便开始……我是说，迷子号暂时拒绝。

### 8.5 MyGO终止商业协议

`MYGO_TO_POPIPA_COMMERCIAL_BREAK_01`：商业协议到此终止。还没交付的订单按原价退款，毛绒玩具周边……暂时不算在里面。

### 8.6 MyGO提出移民协议

`MYGO_TO_POPIPA_MIGRATION_PROPOSE_01`：想留在星球上的人可以下船，想看看迷子号的人也能上来。返航和家属联系都写清楚了，这次真的很完整。

### 8.7 MyGO考虑移民协议

`MYGO_TO_POPIPA_MIGRATION_CONSIDER_01`：居住区名额、重力适应和返航窗口还要确认。香澄前辈，不能先上船再说哦。

### 8.8 MyGO接受移民协议

`MYGO_TO_POPIPA_MIGRATION_ACCEPT_01`：协议通过。欢迎Poppin'Party的居民登上迷子号。

### 8.9 MyGO拒绝移民协议

`MYGO_TO_POPIPA_MIGRATION_DECLINE_01`：现在的居住容量不够。让居民挤进不安全的舱室，不太好。

### 8.10 MyGO终止移民协议

`MYGO_TO_POPIPA_MIGRATION_BREAK_01`：新申请停止受理。已经批准的迁移不会临时取消。

## 九、条约、联邦与驿站 P1

### 9.1 互不侵犯

`MYGO_TO_POPIPA_NAP_PROPOSE_01`：既然都不想再把舰炮对准对方，就正式写下来吧。香澄前辈，这次不只做口头约定。

`MYGO_TO_POPIPA_NAP_ACCEPT_01`：互不侵犯协议成立。嗯，我也觉得我们本来不需要这个，但写下来更好。

`MYGO_TO_POPIPA_NAP_DECLINE_01`：现在还不能签。边境上的问题没有解决，假装没问题只会更糟。

`MYGO_TO_POPIPA_NAP_BREAK_01`：协议终止。香澄，接下来每一次舰队调动都会被当成真实威胁。

### 9.2 防御条约

`MYGO_TO_POPIPA_DEFENSIVE_PROPOSE_01`：绝——对——不是谁单方面保护谁。Poppin'Party遇到入侵，迷子号也会赶到。这样才叫共同防御吧？

`MYGO_TO_POPIPA_DEFENSIVE_ACCEPT_01`：共同防御成立。香澄前辈，这次我们站在同一条警戒线上。

`MYGO_TO_POPIPA_DEFENSIVE_DECLINE_01`：迷子号不能承诺自己目前做不到的防御范围。抱歉。

`MYGO_TO_POPIPA_DEFENSIVE_BREAK_01`：共同防御义务解除。现有联合行动会按撤离方案结束。

### 9.3 联邦

`MYGO_TO_POPIPA_FEDERATION_INVITE_01`：香澄前辈，我们不必回到过去的队形，也可以从现在开始站到同一边。Poppin'Party愿意加入吗？

`MYGO_TO_POPIPA_FEDERATION_ACCEPT_01`：迷子号同意加入。先说好，我要一个正式席位，不是被安排在Poppin'Party后面的嘉宾席！

`MYGO_TO_POPIPA_FEDERATION_DECLINE_01`：现在加入会把太多决定交出去。我们还需要一点自己的航线。

`MYGO_TO_POPIPA_FEDERATION_LEAVE_01`：退出程序已经启动。香澄前辈，这不是切断通讯。只是迷子号接下来要自己走。

### 9.4 驿站协定

`MYGO_TO_POPIPA_WAYSTATION_PROPOSE_01`：在闪耀花园给迷子号留一个固定泊位吧。下次我们就不用绕着恒星找入口了。

`MYGO_TO_POPIPA_WAYSTATION_ACCEPT_01`：驿站选址通过。Poppin'Party的船也可以在这里补给，但公共广播音量要遵守舰内规定哦。

`MYGO_TO_POPIPA_WAYSTATION_DECLINE_01`：这个位置会影响主方舟航线。换一个坐标再提交吧。

`MYGO_TO_POPIPA_WAYSTATION_BREAK_01`：驿站许可撤销。设备可以在宽限期内拆除，人员由迷子号送回。

## 十、附庸与宗主关系 P2

### 10.1 MyGO要求Poppin'Party臣服

`MYGO_TO_POPIPA_SUBJUGATE_PROPOSE_01`：Poppin'Party的安全、航线和居民将由迷子号统一保护。香澄前辈，我不是在开玩笑。请完整考虑这份协议。

### 10.2 MyGO拒绝成为Poppin'Party附庸

`MYGO_TO_POPIPA_SUBJUGATE_DECLINE_01`：谢谢你想保护我们。但是我们拒绝臣服。

### 10.3 MyGO接受成为Poppin'Party附庸

`MYGO_TO_POPIPA_BECOME_SUBJECT_ACCEPT_01`：协议通过。香澄前辈，迷子号会履行义务，但我们的内部决定仍然属于我们。

### 10.4 MyGO接受Poppin'Party成为附庸

`MYGO_TO_POPIPA_ACCEPT_SUBJECT_01`：从现在起，迷子号承担保护义务。香澄前辈，不是只有你会说“有困难就直接告诉我”。

### 10.5 MyGO释放Poppin'Party

`MYGO_TO_POPIPA_RELEASE_SUBJECT_01`：从属协议结束。Poppin'Party重新取得完整外交权限。香澄，万事加油！

### 10.6 MyGO请求脱离Poppin'Party

`MYGO_TO_POPIPA_ASK_RELEASE_01`：香澄前辈，迷子号已经能继续独立航行。请结束从属条款，让我们用自己的名字承担结果！

### 10.7 MyGO向Poppin'Party秘密效忠

`MYGO_TO_POPIPA_SECRET_FEALTY_01`：香澄前辈，迷子号需要你们的舰队。条件我会亲自说明。

## 十一、敌对外交 P1/P2

### 11.1 MyGO宣布Poppin'Party为宿敌

`MYGO_TO_POPIPA_RIVAL_PROPOSE_01`：香澄！不要再拿过去要求我让路。过去你是一个糟糕的领航员，现在更是一个糟糕的执政官。

### 11.2 MyGO结束宿敌关系

`MYGO_TO_POPIPA_RIVAL_END_01`：宿敌声明撤销。别急着庆祝，香澄。我们的事还在后面呢。

### 11.3 MyGO侮辱Poppin'Party

`MYGO_TO_POPIPA_INSULT_01`：香澄前——辈——，你的热情只负责开场，烂摊子最后还是全都交给有咲吧？

### 11.4 MyGO保证Poppin'Party独立

`MYGO_TO_POPIPA_GUARANTEE_01`：任何针对Poppin'Party的入侵都会收到迷子号回应。香澄前辈，我可是迷子号舰内跑步冠军。

### 11.5 MyGO支持Poppin'Party独立

`MYGO_TO_POPIPA_SUPPORT_INDEPENDENCE_01`：撤离坐标、补给点和接应舰队都准备好了。香澄前辈，决定行动时直接呼叫我。

## 十二、关系状态与特殊来电候选 P2

本节暂不设计触发器，只确定MyGO面对香澄时的反向态度。

### 12.1 Poppin'Party被第三方重创

> “把伤员坐标给我。其他事等迷子号到了再说。”

## 十三、暂不落地与禁写

- 不替换已经落地的首次接触和`mygo_story.551`。
- 不让爱音在普通外交中说出尚未告诉香澄的内乱、方舟解体或爆破栓细节。
- 不把爱音写成只会模仿香澄的后辈；两人都擅长行动，但爱音更在意社交评价、现实安排和自身领导能力。
- 不把香澄的支持写成爱音理所当然可以调用的私人资源。
- 不让每条友好文本都围绕Live、星星、闪耀或“心动不已”。
- 不让爱音永远轻浮。涉及战争、居民、移民和附庸时，她必须承担执政官身份。
- 不用旁白宣布爱音把香澄当成偶像、姐姐、竞争者或恋爱对象；当前材料不足以确定。
- 不写Phase 2、地球之墓和已经删除或尚未确定的终局内容。
- 不将现有`MYGO_POPIPA_*`键直接反用；那些文本的说话人是香澄，不是爱音。

## 十四、人工复核重点

1. 爱音对香澄的常用称呼应固定为“香澄前辈”，还是友好状态可以直接叫“香澄”。
友好状态可以直接叫“香澄”。但是已经写好的没必要改。
2. 爱音与香澄之间是否需要更强的“同类竞争”感，还是以旧同行者和受援方的复杂感受为主。
旧同行者和受援方的复杂感受
3. 敌对文本中“不想被保护”的敏感是否符合计划中的爱音，是否应再提高攻击性。
我帮你把攻击性拉满了。阴阳怪气来。
4. 研究协议中的“超级天才爱音酱”是否应由爱音主动接梗，还是只保留为香澄单方面称呼。
其实这是一个伏笔。由爱音主动接梗。
5. 联邦邀请中“不回到过去的队形”是否过早回应CRYCHIC与MyGO身份问题。
无所谓。
6. MyGO成为Poppin'Party附庸时，保留内部决定的要求是否符合实际附庸协议强度。
无所谓。
7. 秘密效忠文本是否需要更明显的难堪和迟疑，还是保持爱音在危机中的行动效率。
无所谓。
8. 低频来电继续只保留候选，触发设计另行研究。
好。
