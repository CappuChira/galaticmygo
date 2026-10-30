# [Bug] 事件 ID 索引混淆定义与调用，导致跨文件重复误报和文件内重复漏报

## 问题描述

`findEventIds()` 使用全文正则提取所有 `id = namespace.number`，再用 `Set` 合并同一文件中的相同 ID。工作区索引随后把这些 ID 全部当作事件定义，进行跨文件重复检查。

这会造成两个方向的问题：

- **误报**：一个文件定义事件，另一个文件调用它，会被认为两个文件重复定义了该事件。
- **漏报**：同一文件真正定义两次相同事件时，两次出现被 `Set` 合并，定义索引无法发现重复。

正则还会提取注释和字符串中的 `id = ...`。因此这不是事件格式或文件命名问题，而是“文件中出现的 ID”被直接用于“定义索引”。

## 测试环境

- RStellarScribe 0.1.0
- 提交：`bb8ab3ed8597bc02d8eaed22b325787014f89798`
- Windows，Node.js v24.11.1
- 以下函数级复现已实际运行，不依赖游戏安装或特定 mod。

## 最小复现

在仓库根目录保存为 `repro-event-ids.mjs`，然后执行 `node repro-event-ids.mjs`：

```js
import { findEventIds } from './src/lib/paradox.mjs';

const samples = {
  definition: 'country_event = { id = demo.1 is_triggered_only = yes }',
  reference: 'country_event = { id = demo.2 immediate = { country_event = { id = demo.1 days = 1 } } }',
  duplicate: 'country_event = { id = demo.1 }\ncountry_event = { id = demo.1 }',
  comment: '# id = demo.99',
  string: 'log = "id = demo.88"'
};

for (const [name, source] of Object.entries(samples)) {
  console.log(JSON.stringify({ name, ids: findEventIds(source) }));
}
```

这些片段用于测试提取逻辑，不是完整可玩的事件。

实际输出：

```json
{"name":"definition","ids":["demo.1"]}
{"name":"reference","ids":["demo.2","demo.1"]}
{"name":"duplicate","ids":["demo.1"]}
{"name":"comment","ids":["demo.99"]}
{"name":"string","ids":["demo.88"]}
```

作为事件定义索引，期望结果应为：

| 输入 | 期望 |
|---|---|
| `definition` | 一次 `demo.1` 定义 |
| `reference` | 仅一次 `demo.2` 定义；嵌套 `demo.1` 是调用 |
| `duplicate` | 保留两次 `demo.1` 定义，使重复检查能够报错 |
| `comment` | 没有定义 |
| `string` | 没有定义 |

如果 `definition` 与 `reference` 分别位于两个 `events/*.txt` 文件中，当前工作区索引会将 `demo.1` 报成跨文件重复。反之，`duplicate` 在单个文件中只返回一次 ID，重复信息已丢失。

## 实际项目中的表现

在一个真实 mod 中，`events/mygo_story_events.txt` 定义 `mygo.400`，另一个事件文件通过以下合法调用安排它执行：

```txt
country_event = { id = mygo.400 days = 1 }
```

`validate_stellaris_project` 将其报告为：

```text
duplicate event key `mygo.400` also defined in events/mygo_events.txt:0
```

所谓另一处定义实际是事件调用。本机原版 `events/advisor_events.txt` 等文件也使用 `country_event = { id = ... }` 这种调用形式，不应要求 mod 改变正常事件写法来规避检查器。

## 源码定位

- [src/lib/paradox.mjs：findEventIds](https://github.com/g5Sunnystarscout/RStellarScribe/blob/bb8ab3ed8597bc02d8eaed22b325787014f89798/src/lib/paradox.mjs#L372)：先正则匹配，再逐个加入 `Set`。没有区分语法层级、注释和字符串。
- [src/lib/workspace.mjs：事件定义索引](https://github.com/g5Sunnystarscout/RStellarScribe/blob/bb8ab3ed8597bc02d8eaed22b325787014f89798/src/lib/workspace.mjs#L241)：将 `findEventIds(text)` 的每项映射成 `{ key, line: 0 }`，随后用于重复定义检查。

问题不只是正则范围过宽：即使过滤掉调用，若仍在重复检查前使用 `Set`，同一文件内重复定义的漏报依然存在。`line: 0` 也使诊断无法指向实际定义位置。

## 建议修复方向

利用现有词法分析器识别顶层事件块，只提取该块直属的 `id`，返回保留所有出现次数的定义记录，例如 `{ key, line }`。在此基础上检查文件内和跨文件重复。

如果其他调用方仍需要“出现过的唯一 ID 集合”，可以保留独立的引用收集接口，但不将该集合当作定义清单。

不建议只删除 `Set` 或把正则改为行首匹配：前者会增加调用导致的误报，后者仍不能区分多行书写的嵌套事件调用。

## 建议回归用例

- [ ] 跨文件的“定义＋调用”不报重复。
- [ ] 同一事件被多次调用不报重复。
- [ ] 同一文件内两次真实定义相同 ID，能够报错。
- [ ] 不同文件中真实定义相同 ID，能够报错。
- [ ] 注释、字符串中的 `id = ...` 不进入定义索引。
- [ ] 单行与多行的嵌套调用均被正确排除。
- [ ] 覆盖 `country_event`、`planet_event`、`fleet_event` 等事件类型。
- [ ] 诊断返回两处真实定义的文件及有效行号。
