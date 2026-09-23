Modify the program below. Return the whole file.

Requested change:

- Replace the string state with a variant:
  `type State: Eq, Repr = | Todo | Doing | Done | Blocked(Int)` and change
  `Task.state: String` to `Task.state: State`. `parse_task` builds the variant.
- The line format and every rendered output stay exactly as they are: `render`
  still shows `[todo]`, `[doing]`, `[done]` or `[blocked:7]`.

Preserve (the hidden oracle checks these):

- `parse_task` accepts exactly what it accepts today and rejects the rest with the
  same messages, checked in the same order (`bad line: ...`, then `bad id: ...`,
  then `bad state: ...`). A blocker id is one or more digits: `blocked:`,
  `blocked:-3`, `blocked:+3` and `blocked: 3` are `bad state: <state>`, while
  `blocked:12` is fine.
- `blockers` lists each blocking id once, in first-seen order.
- `complete(ts, id)` marks `id` done and returns ONLY the tasks blocked by that id
  to `Todo`; tasks blocked by another id are untouched.
- `summary` keeps its format and counts.
