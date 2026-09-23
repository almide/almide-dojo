Modify the program below. Return the whole file.

Requested change:

- Add an override layer `type Overrides: Flags = { base: Defaults, forced: Map[String, Bool] }`.
  A flag present in `forced` answers the forced value; any other flag answers
  exactly what `base` answers.
- Add `type Source = | Plain(Defaults) | Forced(Overrides)` and
  `fn report_with(s: Source, names: List[String]) -> String` and
  `fn enabled_with(s: Source, name: String) -> Bool` that run the generic
  `report` / `enabled` with the selected adapter.

Preserve (the hidden oracle checks these):

- `Defaults`, `enabled`, `report` and the protocol keep their exact behaviour
  (a name in both default lists is on).
- A forced `false` wins over a default `on`, and a forced `true` over a default `off`.
- A flag unknown to both layers stays unknown: `report` prints `unset` for it
  through `Overrides` too (it must not become `off`), while `enabled` still treats
  it as off.
