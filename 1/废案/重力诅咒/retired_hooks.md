# 已拆除接线

以下接线已于 2026-07-29 从现役代码中拆除，仅供历史追踪。

## 开局创建

原位于 `events/mygo_events.txt` 的 `mygo.1`：

```txt
start_situation = { type = situation_mygo_gravity_curse }
```

## 信标完成后倒退进度

原位于 `common/scripted_effects/00_mygo_effects.txt` 的 `mygo_collect_stardust_beacon`：

```txt
every_situation = {
    limit = { is_situation_type = situation_mygo_gravity_curse }
    add_situation_progress = -24
}
```

`mygo_collect_stardust_beacon` 的 POI 清理、信标计数和 Unity 奖励仍是正式玩法，继续保留。

## Phase 2 清理

原位于 `events/mygo_events.txt` 的 `mygo.120`：

```txt
every_situation = {
    limit = { is_situation_type = situation_mygo_gravity_curse }
    destroy_situation = this
}
```

`mygo.120` 的 Phase 旗标切换、信标事件链结束和地球之墓生成仍是正式玩法，继续保留。

## 进度完成循环

Situation 原先在进度达到 100 时触发 `mygo.90`，该事件把进度重置到 20。Situation 定义和事件已分别归档为 `.disabled` 文件。
