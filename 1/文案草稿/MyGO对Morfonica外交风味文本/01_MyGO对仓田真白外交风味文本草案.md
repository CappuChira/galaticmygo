# MyGO 对仓田真白外交风味文本草案

> 状态：`merged`
> 人工批准：世界上最好的用户已经完成；用户于2026-07-22明确批准全部合并
> 写入范围：外交短句及具名候选已导入`common/`与`localisation/`；无键特殊来电保留为候选。
> 方向定义：发言方固定为迷子号／MyGO，主要发言人为千早爱音；接收方固定为仓田真白／Morfonica。
> 实现提醒：未来导入时同时检定发言方具有 `origin_mygo_eternal_return`、接收方具有 `mygo_morfonica`，不得与现有“真白对MyGO”短句共用方向条件。
> 标题中的P0/P1/P2表示未来落地优先级，不是已经删除的剧情Phase 2。

## 一、事实与信息边界

### MyGO已知

- Morfonica、Poppin'Party与旧CRYCHIC曾经并行航行，并举行过联合Live。
- 真白认识灯，过去会与灯交换笔记。灯与真白已经通过受损旧笔记重新交谈。
- Morfonica定居后遭遇自然飓风，档案受损，修复与救灾仍占用其人力。
- 真白和灯从旧笔记中找到第一太空休息区路线，Morfonica因定居与救灾无法同行。
- 爱音知道真白会因创作比较产生自卑，但这来自筑紫的转述，不代表真白主动向爱音公开全部私人情绪。
- 爱音知道Morfonica不是随时待命的档案服务机构。它有居民、殖民地与自己的安排。

### MyGO不能擅自确定

- 爱音不能替灯决定要向真白展示哪些笔记、歌词或私人内容。
- 爱音不知道真白对旧CRYCHIC、失忆与方舟解体的全部看法。
- Morfonica不知道迷子号内乱、爆破栓和记忆清理的完整因果，爱音也没有向其公开。
- 爱音不能把真白的迟疑一律理解成需要鼓励。有时真白是在拒绝、核对或保护边界。
- 不因Morfonica是和平协约国，就默认其在战争中软弱、无舰队或不会反击。

## 二、爱音面对真白时的声音

- 爱音比真白更快建立熟悉感，容易主动缩短称呼和距离。
- 她会接真白的幻想表达，也可能故意用夸张中二台词帮对方从尴尬里脱身。
- 爱音并不真正理解灯与真白过去的全部关系。她可以传话、安排频道，不能替灯回应亲密问题。
- 她羡慕苍蝶高原的真实天空、天气与重力，也会把这种羡慕落到访问、移民和演出安排中。
- 正式事务中，爱音会努力把真白从“需要照顾的人”当成国家代表看待；战争中尤其不能轻视她。
- 敌对时，爱音可能攻击Morfonica总拿档案修复、表决和程序拖延决定。这会真实伤害真白，不作旁白找补。

### 称呼暂定

- 常规与友好：`小真白`
- 正式、关系疏远：`仓田代表`或`真白`
- 战争与强烈冲突：`仓田真白`

既有`mygo_story.567.ask`已经使用“小真白”，本稿优先沿用。

## 三、既有首次接触与剧情

本稿不替换：

- `mygo_contact.reply.morfonica.friendly`
- `mygo_contact.reply.morfonica.reserved`
- `mygo_contact.reply.morfonica.forceful`
- `mygo_contact.relic.morfonica.a`
- `mygo_story.552`及`mygo_story.565—567`

后续文本承认双方已经谈过失忆、受灾档案、旧笔记与第一太空休息区。

## 四、MyGO随机外交问候 P0

### 4.1 中立问候

候选前缀：`MYGO_TO_MORFONICA_NEUTRAL_GREETING_`

1. 小真白，频道接通了！今天是你本人，还是筑紫负责正式事项？
2. 苍蝶高原今天风大吗？只是问一下！绝对不是想去玩~
3. 哼哼~（音乐）
4. Tomorin在写东西。不能保证她马上给你看哦。
5. 迷子号状态正常。小真白，你们那边怎么样？

### 4.2 友好问候

候选前缀：`MYGO_TO_MORFONICA_FRIENDLY_GREETING_`

1. 小真白！客房别只给Tomorin留啦，我也要能看到高原云层的那间！最高的那种！！
2. 你上次说要保密的内容，我已经看到了！咳咳，漆黑之羽，如深……（断线）
3. Tomorin就在频道旁边！我把主画面让给你们。
4. 我试着写了一段很有感觉的开场白，听完不许笑！从深渊中苏醒的大魔姬，其血色双瞳……
5. 等手头的事情告一段落，来迷子号住几天吧。怎么样？

### 4.3 敌对问候

候选前缀：`MYGO_TO_MORFONICA_HOSTILE_GREETING_`

1. 仓田代表，迷子号频道已经开放。请说明来意。
2. 档案还在整理、表决还没完成、之后再答复——真白，这次你到底准备怎么做？
3. 不要通过灯的私人频道绕开国家之间的问题。
4. 和平不是让Morfonica永远不用为自己的选择负责。
5. 真白，我不是来听你说“我这种人”的。我在等Morfonica的决定。

### 4.4 战争问候

候选前缀：`MYGO_TO_MORFONICA_WAR_GREETING_`

1. 停火条件发到军事频道。不要再让民用船靠近交火区。
2. 真白，别把灯牵扯进来。这场战争是我们下令开始的。
3. 我知道你会害怕。但我的舰队不会因此停下。
4. 仓田真白，在轨道轰炸开始之前，我允许你让Morfonica的居民疏散，我给你36小时的时间。
5. 过去我们的同行与今天的炮火并不冲突。

## 五、宣战与和平 P0

### 5.1 MyGO向Morfonica宣战

候选key：`MYGO_TO_MORFONICA_DOW_PROPOSE_01`

> “最后通牒。”
>
> “真白，我知道你不想作出这个决定。我也不想。”
>
> “开始战斗！我将把你的高原夷为平地，哪怕苍蝶已经突破云端。”

### 5.2 MyGO收到Morfonica宣战

候选key：`MYGO_TO_MORFONICA_DOW_ACCEPT_01`

> “宣战书收到了。”
>
> “迷子号舰队进入战斗位置。迷子号将与Morfonica进入战争状态。”

### 5.3 MyGO提议和平

`MYGO_TO_MORFONICA_PEACE_PROPOSE_01`：真白，peace。love and peace。

### 5.4 MyGO考虑和平

`MYGO_TO_MORFONICA_PEACE_CONSIDER_01`：立希正在确认撤军线。等一下。

### 5.5 MyGO接受和平

`MYGO_TO_MORFONICA_PEACE_ACCEPT_01`：协议通过。迷子号会按顺序停火。真白，先确认居民和伤员。

### 5.6 MyGO拒绝和平

`MYGO_TO_MORFONICA_PEACE_DECLINE_01`：迷子号不能接受。

### 5.7 第二次战争

`mygo_to_morfonica_second_war.desc`：§L“苍蝶高原的山仍然还屹立着，这是我的失误。全舰进入战斗位置！”§!

### 5.8 战后第一次普通通讯

`mygo_to_morfonica_postwar_first_contact.desc`：频道恢复了。真白，你们有什么事？

## 六、贸易、赠礼与边境 P1

`MYGO_TO_MORFONICA_TRADE_PROPOSE_01`：这是迷子号能稳定供应的资源。小真白，周边我们需要另外谈授权。

`MYGO_TO_MORFONICA_TRADE_CONSIDER_01`：七深标注的“普通价格”到底是什么意思？爽世正在重新核对。

`MYGO_TO_MORFONICA_TRADE_ACCEPT_01`：条件确认。成交！那个，真白，道歉不能写进合同附录哦。

`MYGO_TO_MORFONICA_TRADE_DECLINE_01`：目前承担不了这些交付。等迷子号补充资源以后再谈。

`MYGO_TO_MORFONICA_GIFT_ACCEPT_01`：谢谢！这些正好能用在居住区。小真白，我喜欢你！

`MYGO_TO_MORFONICA_GIFT_PROPOSE_01`：送给你。珍奇小物件！

`MYGO_TO_MORFONICA_OPEN_BORDERS_01`：Morfonica民用船获准进入迷子号控制区。主方舟附近请按引导灯航行。

`MYGO_TO_MORFONICA_CLOSE_BORDERS_01`：边境暂时关闭。已经入境的船只可以沿原航线离开。

## 七、使馆、研究与档案 P1

`MYGO_TO_MORFONICA_EMBASSY_PROPOSE_01`：迷子号可以为Morfonica设置常驻办公室。档案终端和私人客房会分开的，放心吧。

`MYGO_TO_MORFONICA_EMBASSY_ACCEPT_01`：使馆申请通过。小真白，房间已经准备好了，Tomorin的舱室不在同一层哦。

`MYGO_TO_MORFONICA_EMBASSY_DECLINE_01`：目前不适合设置常驻机构。

`MYGO_TO_MORFONICA_RECALL_EMBASSY_01`：迷子号使馆将在本周期内撤回。共同档案按现有权限封存。

`MYGO_TO_MORFONICA_RESEARCH_PROPOSE_01`：Tomorin很想和你一起研究。

`MYGO_TO_MORFONICA_RESEARCH_CONSIDER_01`：瑠唯的校验规则很完整。我们还在接驳。

`MYGO_TO_MORFONICA_RESEARCH_ACCEPT_01`：研究协议通过。真白，Tomorin急着想见你。

`MYGO_TO_MORFONICA_RESEARCH_DECLINE_01`：这些数据涉及迷子号内部权限，目前不能开放。

`MYGO_TO_MORFONICA_RESEARCH_BREAK_01`：共享终端将在本周期结束后关闭。

## 八、商业与移民 P1

`MYGO_TO_MORFONICA_COMMERCIAL_PROPOSE_01`：高原场地、迷子号移动舞台、双方演出宣传。小真白，这个企划很适合做成联合系列吧？

`MYGO_TO_MORFONICA_COMMERCIAL_CONSIDER_01`：透子的宣传页先别公开！我还没确认自己的照片是哪一张！

`MYGO_TO_MORFONICA_COMMERCIAL_ACCEPT_01`：商业协议通过。联名设计稿由双方一起审核，不许透子和我跳过流程。

`MYGO_TO_MORFONICA_COMMERCIAL_DECLINE_01`：当前方案会占用太多泊位。以后再来。

`MYGO_TO_MORFONICA_COMMERCIAL_BREAK_01`：商业协议终止。未完成活动按清单退款，档案授权同时失效。

`MYGO_TO_MORFONICA_MIGRATION_PROPOSE_01`：想体验方舟生活的人可以上船，想留在高原的人也能下船。往返窗口和适应说明都准备好了。怎么样？

`MYGO_TO_MORFONICA_MIGRATION_CONSIDER_01`：高原重力、昼夜温差、返航名额……再等一下，这次不能只因为风景好看就签哦。

`MYGO_TO_MORFONICA_MIGRATION_ACCEPT_01`：协议通过。小真白，请替第一次下船的人准备合适的路线！

`MYGO_TO_MORFONICA_MIGRATION_DECLINE_01`：迷子号居住容量不足。现在接受申请只会让居民住进不安全的舱室。抱歉。

`MYGO_TO_MORFONICA_MIGRATION_BREAK_01`：停止受理新申请。已经批准的迁移不会临时取消。

## 九、条约、联邦与驿站 P1

### 9.1 互不侵犯

`MYGO_TO_MORFONICA_NAP_PROPOSE_01`：真白，把不会开火这件事正式确认吧。

`MYGO_TO_MORFONICA_NAP_ACCEPT_01`：协议成立。嗯，我也希望这份文件永远没有实际用途。

`MYGO_TO_MORFONICA_NAP_DECLINE_01`：边境问题还没解决，现在签字只是在绕开它。

`MYGO_TO_MORFONICA_NAP_BREAK_01`：互不侵犯协议终止。真白，让舰队离迷子号远一点。

### 9.2 防御条约

`MYGO_TO_MORFONICA_DEFENSIVE_PROPOSE_01`：高原遇到入侵，我们也会赶到。

`MYGO_TO_MORFONICA_DEFENSIVE_ACCEPT_01`：共同防御成立。小真白，害怕的时候也可以先呼叫我们。

`MYGO_TO_MORFONICA_DEFENSIVE_DECLINE_01`：迷子号目前无法覆盖这么大的防御范围。不能为了让你安心就假装做得到。

`MYGO_TO_MORFONICA_DEFENSIVE_BREAK_01`：防御义务解除。联合舰队按撤离方案解散。

### 9.3 联邦

`MYGO_TO_MORFONICA_FEDERATION_INVITE_01`：我们在同一个联盟里可以像过去那样携手向前。Morfonica愿意加入吗？

`MYGO_TO_MORFONICA_FEDERATION_ACCEPT_01`：迷子号同意加入。小真白，下次会议别把脸藏到发言稿后面！

`MYGO_TO_MORFONICA_FEDERATION_DECLINE_01`：我们还需要保留自己的航线和决定。现在不能加入。

`MYGO_TO_MORFONICA_FEDERATION_LEAVE_01`：退出程序已经启动。普通通讯和私人频道不会因此关闭。

### 9.4 驿站

`MYGO_TO_MORFONICA_WAYSTATION_PROPOSE_01`：在苍蝶高原留一个迷子号泊位吧。我想要一条能直接看到云层的访问路线。

`MYGO_TO_MORFONICA_WAYSTATION_ACCEPT_01`：驿站选址通过。Morfonica也可以在这里补给。

`MYGO_TO_MORFONICA_WAYSTATION_DECLINE_01`：这个坐标会影响主方舟航线。换一个位置再提交吧。

`MYGO_TO_MORFONICA_WAYSTATION_BREAK_01`：驿站许可撤销。设备可在宽限期内转运。

## 十、附庸与宗主关系 P2

`MYGO_TO_MORFONICA_SUBJUGATE_PROPOSE_01`：Morfonica的安全与对外航线将由迷子号统一保护。

`MYGO_TO_MORFONICA_SUBJUGATE_DECLINE_01`：迷子号不是等待Morfonica安置的流亡船。我们拒绝臣服。

`MYGO_TO_MORFONICA_BECOME_SUBJECT_ACCEPT_01`：协议通过。小真白，迷子号会履行义务，听候您的差遣~

`MYGO_TO_MORFONICA_ACCEPT_SUBJECT_01`：从现在起，迷子号承担保护义务。真白，有危险就直接呼叫我。

`MYGO_TO_MORFONICA_RELEASE_SUBJECT_01`：从属协议结束。Morfonica恢复完整外交权限。

`MYGO_TO_MORFONICA_ASK_RELEASE_01`：真白，迷子号已经能够独立承担航线与防务工作。是时候结束从属条款了。

`MYGO_TO_MORFONICA_SECRET_FEALTY_01`：小真白，迷子号需要你们的帮助，我会说明条件。

## 十一、敌对外交 P1/P2

`MYGO_TO_MORFONICA_RIVAL_PROPOSE_01`：真白，过去的同行没有改变现在的判断。我们是敌人。

`MYGO_TO_MORFONICA_RIVAL_END_01`：宿敌声明撤销。真白……

`MYGO_TO_MORFONICA_INSULT_01`：小真白，你每次都说“我这种人”，其实……你这种人确实不怎么讨人喜欢。

`MYGO_TO_MORFONICA_GUARANTEE_01`：任何针对Morfonica的入侵都会收到迷子号的回应。高原不会独自迎敌。

`MYGO_TO_MORFONICA_SUPPORT_INDEPENDENCE_01`：撤离路线和接应舰队已经准备好。真白，决定行动时直接呼叫我。

## 十二、特殊状态来电候选 P2

### 12.1 Morfonica被第三方重创

> “先把居民、伤员和受损档案的坐标发来。迷子号会分批接应。”

### 中间删了。

## 十三、暂不落地与禁写

- 不替换现有首次接触、旧笔记和休息区路线剧情。
- 不让爱音替灯决定与真白的私人关系或作品分享。
- 不把真白每一次迟疑都写成软弱，也不让爱音永远负责鼓励她。
- 不让Morfonica因为和平主义或旧友情无条件开放档案、边境与军事权限。
- 不反复使用漆黑之羽、蝴蝶、羽翼和梦境作为每条短句的装饰。
- 不让爱音公开尚未向Morfonica说明的内乱、方舟解体或爆破栓细节。
- 不直接反用现有`MYGO_MORFONICA_*`键；那些文本的说话人是真白。
- 不写已删除的剧情Phase 2、地球之墓和未确定终局。

## 十四、人工复核重点

1. 爱音对真白是否统一称“小真白”，敌对时是否改用“仓田代表”。
对。
2. 爱音是否知道筑紫转述的真白自卑细节；若认为该内容不应成为爱音稳定认知，需要收紧相关敌对文本。
帮你写了更狠的打嘴炮。
3. 灯与真白私人频道在国家敌对或战争时是否应由爱音关闭。
随便。
4. 侮辱文本攻击真白拖延决定，烈度是否过高。
烈度过低！
5. Morfonica成为MyGO附庸时，爱音的保护口径是否需要更强调居民表决。
不。
6. 特殊状态来电继续只保留候选，触发条件另行设计。
好。
