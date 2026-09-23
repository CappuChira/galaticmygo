# MyGO 对丰川祥子外交风味文本草案

> 状态：`merged`
> 人工批准：yes；用户于2026-07-22明确批准全部合并
> 写入范围：外交短句及具名候选已导入`common/`与`localisation/`；无键特殊来电保留为候选。
> 方向定义：发言方固定为迷子号／MyGO，主要发言人为千早爱音；接收方固定为丰川祥子／月之森企业联盟。
> 实现提醒：未来导入时同时检定发言方具有 `origin_mygo_eternal_return`、接收方具有 `mygo_tsukinomori`，不得与现有“祥子对MyGO”短句共用方向条件。
> 标题中的P0/P1/P2表示未来落地优先级，不是已经删除的剧情Phase 2。

## 一、事实与信息边界

### MyGO已知

- 月之森与旧CRYCHIC存在直接关系，保存Spica、联合Live和旧内部频段资料。
- 祥子知道迷子号失忆，也知道爱音正在追寻星尘信标。
- 祥子拒绝解释过去，要求爱音停止追寻，并允许爱音把她视为逃掉的人或敌对方。
- 祥子认可爱音带方舟逃离绝境、维持居民生存和继续发展的领导能力。
- 祥子没有完全切断关系。她愿意讨论月之森星域演出，也愿意接收联合Live录像。
- 爱音在这次谈话以前已经练习吉他。祥子的要求改变的是她面对过去和对外演出的压力，不是第一次让她拿起吉他。
- 月之森拥有居民、舰队、企业和正式制度。祥子的私人决定不能自动代表每一名成员。

### MyGO尚不知道或不能擅自确定

- 爱音不知道祥子掌握多少内乱、爆破栓与方舟解体细节。
- 爱音不能确定祥子拒绝说明是保护、愧疚、敌意、利益判断，还是几种因素同时存在。
- 爱音记忆残缺。她可以怀疑祥子，也可以被某句话刺到，但不能凭外交短句恢复完整旧关系。
- 祥子没有公开允许迷子号自由调用月之森资料、工业和舰队。
- 两人的靠近、竞争和相互在意必须留在具体交锋中，不能由旁白宣布她们已经和解或相爱。

## 二、爱音面对祥子时的声音

- 爱音通常称她“祥子同学”，关系变好后可以直接叫“祥子”。这是现有称呼表明确给出的变化。
- 爱音擅长交涉，但祥子会让她更容易失去预设节奏。她可能追问、逞强、故意轻松，也可能突然只剩一句名字。
- 她非常在意祥子对自己领导能力的评价。被肯定时会得意，也会怀疑那是不是对方结束话题的手段。
- 爱音不喜欢祥子替她判断什么重要、什么应该忘记。这个冲突会进入研究、条约、联邦和附庸文本。
- 两人都习惯主动安排别人。友好时会出现谁来定航线、谁来照顾谁、谁先挂断频道的细小较劲。
- 正式事务中爱音不会只追问旧事。她能够讨论价格、舰队、居民和合同，并要求祥子同样尊重她的执政官身份。
- 敌对和战争时，旧关系不会自动软化命令。她们可以说重话，而且知道哪些话最能刺中对方。

### 称呼规则

- 中立、正式：`祥子同学`或`丰川代表`
- 友好、私人：`祥子`
- 敌对：`祥子`；需要刻意拉开距离时使用`丰川代表`
- 战争与极端冲突：`丰川祥子`

## 三、既有首次接触与剧情

本稿不替换：

- `mygo_contact.reply.tsukinomori.friendly`
- `mygo_contact.reply.tsukinomori.reserved`
- `mygo_contact.reply.tsukinomori.forceful`
- `mygo_contact.relic.tsukinomori.a`
- `mygo_story.553`

后续文本承认：爱音已经追问过过去，祥子已经拒绝，也已经提出在月之森星域演出的可能。

## 四、MyGO随机外交问候 P0

### 4.1 中立问候

候选前缀：`MYGO_TO_TSUKINOMORI_NEUTRAL_GREETING_`

1. 祥子，频道接通了。你要谈什么事项？
2. 当前航线、补给和舰队状态已经上传。如何？比起你在的时候。
3. 如果今天还是不能谈过去，那就先谈现在。月之森需要迷子号做什么？
4. 吉他有在练。你不用每次都问我！
5. 迷子号正在听。请继续。

### 4.2 友好问候

候选前缀：`MYGO_TO_TSUKINOMORI_FRIENDLY_GREETING_`

1. 祥子，我还有一段新的吉他录音……只给你听。
2. 你上次说我很有领导才能。再说一次也没关系，我不会得意忘形的！
3. 我把下一段航线改到附近了。不是专程找你！只是……刚好顺路。
4. 祥子，你也可以把做不到的事交给我。随时拜托我就好。
5. 只是想看看你有没有好好休息。看完了，我走啦。

### 4.3 敌对问候

候选前缀：`MYGO_TO_TSUKINOMORI_HOSTILE_GREETING_`

1. 迷子号频道已接通。请说明事项。
2. 祥子，那不是你的权限。
3. 你要认可我的领导能力。
4. 你们没有解释一切的权力。
5. 不要转移话题。

### 4.4 战争问候

候选前缀：`MYGO_TO_TSUKINOMORI_WAR_GREETING_`

1. 丰川祥子，有话快说。
2. 你要我堂堂正正击败你。好，我正在这里。
3. 不用再替迷子号计算该往哪里逃。我会击溃你的一切。
4. 祥子，别用现在逃开过去。
5. 舰队继续锁定。

## 五、宣战与和平 P0

### 5.1 MyGO向月之森宣战

候选key：`MYGO_TO_TSUKINOMORI_DOW_PROPOSE_01`

> “最后通牒时限结束。”
>
> “祥子，我会以迷子号执政官的身份承担这个决定！你也以月之森企业代表的身份回答吧。”
>
> “战争将继续延续！迷子号将与你们进入战争状态。”

### 5.2 MyGO收到月之森宣战

候选key：`MYGO_TO_TSUKINOMORI_DOW_ACCEPT_01`

> “宣战书收到。”
>
> “你说我的领导不差，对吧？那就看着我怎么拦住你，祥祥。”

### 5.3 MyGO提出和平

`MYGO_TO_TSUKINOMORI_PEACE_PROPOSE_01`：撤军线、伤员交换和赔付方案都在附件里。祥子，确认以后停火。

### 5.4 MyGO考虑和平

`MYGO_TO_TSUKINOMORI_PEACE_CONSIDER_01`：你等我的答案。

### 5.5 MyGO接受和平

`MYGO_TO_TSUKINOMORI_PEACE_ACCEPT_01`：条件有效。迷子号会按协议停火。祥子，把你的人带回去！

### 5.6 MyGO拒绝和平

`MYGO_TO_TSUKINOMORI_PEACE_DECLINE_01`：这不是那么轻易的事情。迷子号拒绝。

### 5.7 第二次战争

`mygo_to_tsukinomori_second_war.desc`：§L开始作战。祥子，这次谁也不要先移开视线。§!

### 5.8 战后第一次普通通讯

`mygo_to_tsukinomori_postwar_first_contact.desc`：普通频道恢复了。祥子，你说。

## 六、贸易、赠礼与边境 P1

`MYGO_TO_TSUKINOMORI_TRADE_PROPOSE_01`：价格、交付窗口和违约责任都写好了。祥子，请过目！

`MYGO_TO_TSUKINOMORI_TRADE_CONSIDER_01`：条件确实不错……等一下，不要直接告诉我名字签哪里，让我看完！

`MYGO_TO_TSUKINOMORI_TRADE_ACCEPT_01`：合同成立。祥祥！别露出那种“果然会同意”的表情。

`MYGO_TO_TSUKINOMORI_TRADE_DECLINE_01`：收益不足以覆盖迷子号的运输风险。驳回。嗯！是不是没想到？

`MYGO_TO_TSUKINOMORI_GIFT_ACCEPT_01`：谢谢……祥子。

`MYGO_TO_TSUKINOMORI_GIFT_PROPOSE_01`：收下它们，祥祥。

`MYGO_TO_TSUKINOMORI_OPEN_BORDERS_01`：我允许月之森船只进入迷子号控制区。

`MYGO_TO_TSUKINOMORI_CLOSE_BORDERS_01`：通行许可撤销。宽限期结束前离境，祥子。

## 七、使馆与研究 P1

`MYGO_TO_TSUKINOMORI_EMBASSY_PROPOSE_01`：迷子号愿意设置月之森常驻使馆。派你的人过来。

`MYGO_TO_TSUKINOMORI_EMBASSY_ACCEPT_01`：使馆申请通过。人员和设备按清单登记。那个，你本人来的话……提前告诉我。

`MYGO_TO_TSUKINOMORI_EMBASSY_DECLINE_01`：现在不接受常驻使馆。现在你也能找到我。

`MYGO_TO_TSUKINOMORI_RECALL_EMBASSY_01`：迷子号使馆将在四十八小时内撤回。工作人员必须全须全尾地回来！

`MYGO_TO_TSUKINOMORI_RESEARCH_PROPOSE_01`：你说CRYCHIC号没有什么是你不知道的。那就和迷子号现在的数据一起核对。

`MYGO_TO_TSUKINOMORI_RESEARCH_CONSIDER_01`：权限目录里缺了好几段。祥祥，你知道缺的是什么，对吧？

`MYGO_TO_TSUKINOMORI_RESEARCH_ACCEPT_01`：协议生效。嗯……你是不是也想念Tomorin了，祥子……祥祥？

`MYGO_TO_TSUKINOMORI_RESEARCH_DECLINE_01`：你要求的权限超过合作范围。迷子号拒绝开放。

`MYGO_TO_TSUKINOMORI_RESEARCH_BREAK_01`：联合项目停止。资料全部撤回。

## 八、商业与移民 P1

`MYGO_TO_TSUKINOMORI_COMMERCIAL_PROPOSE_01`：固定采购、演出结算、维修窗口，祥子，这份合作对双方都有好处。

`MYGO_TO_TSUKINOMORI_COMMERCIAL_CONSIDER_01`：流程很完整。嗯……后台休息室里的M豆颜色为什么也写进强制条款了？

`MYGO_TO_TSUKINOMORI_COMMERCIAL_ACCEPT_01`：商业协议通过。祥子，迷子号商业区已经改过了，不许直接照旧规范接管！

`MYGO_TO_TSUKINOMORI_COMMERCIAL_DECLINE_01`：条件不够好。不要以为我会少看两页！

`MYGO_TO_TSUKINOMORI_COMMERCIAL_BREAK_01`：协议终止。坏账和未交付项目分别清算。

`MYGO_TO_TSUKINOMORI_MIGRATION_PROPOSE_01`：当年想下船是她们的事，现在想回来也正常。一起建立往返程序吧。

`MYGO_TO_TSUKINOMORI_MIGRATION_CONSIDER_01`：祥祥……我懂你的意思。

`MYGO_TO_TSUKINOMORI_MIGRATION_ACCEPT_01`：协议通过。……或许你可以想点开心的事，祥祥。

`MYGO_TO_TSUKINOMORI_MIGRATION_DECLINE_01`：现在不能开放。顺遂您的意愿。

`MYGO_TO_TSUKINOMORI_MIGRATION_BREAK_01`：停止受理新申请。遂您心意。

## 九、条约、联邦与驿站 P1

### 9.1 互不侵犯

`MYGO_TO_TSUKINOMORI_NAP_PROPOSE_01`：祥子……祥祥！我们之间不可能打仗，对吧~？

`MYGO_TO_TSUKINOMORI_NAP_ACCEPT_01`：协议成立。别担心，我签字前每一页都看完了。

`MYGO_TO_TSUKINOMORI_NAP_DECLINE_01`：现在签字还没有意义。

`MYGO_TO_TSUKINOMORI_NAP_BREAK_01`：互不侵犯协议终止。祥祥……这是挑衅吗？

### 9.2 防御条约

`MYGO_TO_TSUKINOMORI_DEFENSIVE_PROPOSE_01`：我打算保护你，祥祥！哎呀，我知道这是共同防御啦。

`MYGO_TO_TSUKINOMORI_DEFENSIVE_ACCEPT_01`：共同防御成立。我们站在同一边，但各自指挥自己的舰队。

`MYGO_TO_TSUKINOMORI_DEFENSIVE_DECLINE_01`：你要求的调度权限太高。

`MYGO_TO_TSUKINOMORI_DEFENSIVE_BREAK_01`：防御义务解除。联合部署按计划撤回。祥子，别弄乱我的方案。

### 9.3 联邦

`MYGO_TO_TSUKINOMORI_FEDERATION_INVITE_01`：祥祥，和我一起建立新的联盟……新CRYCHIC？不是不是。我们的席位并排。

`MYGO_TO_TSUKINOMORI_FEDERATION_ACCEPT_01`：迷子号同意加入。祥子，我信任你。

`MYGO_TO_TSUKINOMORI_FEDERATION_DECLINE_01`：我们之间仍有太多只由一方知道答案。现在不能加入。

`MYGO_TO_TSUKINOMORI_FEDERATION_LEAVE_01`：退出程序已经提交。祥子，这次是我决定离开，不像你，我会亲自把理由说完。

### 9.4 驿站

`MYGO_TO_TSUKINOMORI_WAYSTATION_PROPOSE_01`：给我留一个迷子号固定泊位。谢谢。

`MYGO_TO_TSUKINOMORI_WAYSTATION_ACCEPT_01`：驿站选址通过。你们可以在这里补给。祥子本人不需要预约。

`MYGO_TO_TSUKINOMORI_WAYSTATION_DECLINE_01`：暂时拒绝。抱歉。

`MYGO_TO_TSUKINOMORI_WAYSTATION_BREAK_01`：驿站合同终止。设备按宽限期撤离。祥子，你和小睦可以留下……别人算了。

## 十、附庸与宗主关系 P2

`MYGO_TO_TSUKINOMORI_SUBJUGATE_PROPOSE_01`：接受迷子号的统一保护与对外调度。现在，试着相信我的指挥。

`MYGO_TO_TSUKINOMORI_SUBJUGATE_DECLINE_01`：丰川祥子，你不是迷子号的舰长。过去不是你替我签字的理由，现在也不是。

`MYGO_TO_TSUKINOMORI_BECOME_SUBJECT_ACCEPT_01`：协议通过。祥祥，听候您的差遣。

`MYGO_TO_TSUKINOMORI_ACCEPT_SUBJECT_01`：从现在起，迷子号承担保护义务。祥子，舰队调度听我的。……你可以随时指出我错在哪里。

`MYGO_TO_TSUKINOMORI_RELEASE_SUBJECT_01`：监管期限结束。祥子，下一步由你自己决定。

`MYGO_TO_TSUKINOMORI_ASK_RELEASE_01`：祥子，迷子号已经能够独立承担结果。相信你对我的评价，结束从属条款。

`MYGO_TO_TSUKINOMORI_SECRET_FEALTY_01`：祥子，帮帮我……帮帮我。

## 十一、敌对外交 P1/P2

`MYGO_TO_TSUKINOMORI_RIVAL_PROPOSE_01`：祥子，从现在起，我会正面击败你。

`MYGO_TO_TSUKINOMORI_RIVAL_END_01`：宿敌声明撤销。祥子……

`MYGO_TO_TSUKINOMORI_INSULT_01`：祥子，你从一开始就不是一个合格的领袖。你永远也没法超越我。

`MYGO_TO_TSUKINOMORI_GUARANTEE_01`：任何针对你们的入侵都会收到迷子号回应。你不是孤军奋战。从来不是。

`MYGO_TO_TSUKINOMORI_SUPPORT_INDEPENDENCE_01`：撤离坐标、补给点和接应舰队已经准备好。祥子，决定行动时，直接叫我的名字。

## 十二、特殊状态来电候选 P2

### 12.1 月之森被第三方重创

> “祥子，等我到。其他话以后再说。”

### 12.2 月之森主殖民地失守

> “迷子号会在出口接你们。我们回家。”


## 十三、暂不落地与禁写

- 不替换现有首次接触和`mygo_story.553`。
- 不让爱音因为友好关系放弃追问，也不让每次通讯都重新逼问旧事。
- 不由旁白确定祥子拒绝说明的真实动机。
- 不让爱音公开尚未确认或尚未告诉月之森的内乱、爆破栓与方舟解体细节。
- 不把权力较劲写成单纯调情；舰队、居民、合同和附庸关系都具有真实后果。
- 不把两人宣布成已经相爱、和解、结婚或命中注定。亲密感停留在具体偏袒、停顿、竞争和称呼变化中。
- 不把月之森写成祥子个人的无条件工具，也不让爱音只靠私人关系获得工业和舰队。
- 不直接反用现有`MYGO_TSUKINOMORI_*`键；那些文本的说话人是祥子。
- 不写已经删除的剧情Phase 2、地球之墓和未确定终局。

## 十四、人工复核重点

1. 友好状态下，爱音是否可以直接称“祥子”；现有称呼表允许关系变好后使用。
我去我都准备让她叫祥祥了。
2. 两人的友好问候是否需要进一步增加暧昧与竞争，还是当前烈度已经足够。
暧昧一点。
3. “席位并排”“祥子本人不需要预约”等偏袒是否符合国家外交文本的公开程度。
不够不够。
4. 移民文本对旧责任的正面冲突是否过早触及方舟解体问题。
可以了。
5. 附庸文本中的权力交换是否符合两人的性格，尤其是“舰队调度听我的”。
还不错。
6. 侮辱文本会直接刺中祥子拒绝旧事的核心，是否保留当前烈度。
我改成了更激进的，
7. 月之森演出候选是否允许爱音直接邀请祥子同台。
那个我自己另写一份。
8. 特殊状态来电继续只保留候选，触发条件另行设计。
行吧。
