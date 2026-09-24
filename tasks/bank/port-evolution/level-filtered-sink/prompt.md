Modify the program below. Return the whole file.

Requested change:

- Add a decorator `type AtLeast: Sink = { inner: Console, min: Level }` that passes an
  event to `inner` only when its level is at least `min` in severity order
  Debug < Info < Warn < Error, and writes nothing otherwise.
- Add `type Output = | Everything(Console) | Filtered(AtLeast)` and
  `fn emit_with(o: Output, events: List[(Level, String)]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `Console`, `emit_all`, `level_name` and the protocol keep their behaviour.
- Severity order is Debug < Info < Warn < Error — NOT the alphabetical order of the
  names: with `min = Warn`, `Error` events are written.
- `min` itself is included; event order is kept.
