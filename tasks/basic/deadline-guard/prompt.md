Write a function with this exact signature:

    effect fn within_deadline(n: Int) -> Int

Behavior:

- Compute `n * n + 1` under a WALL-CLOCK deadline of 2 seconds, using
  `fan.timeout`.
- If the deadline fires first, return `0` instead.

Notes:

- A wall-clock deadline is built with `duration.s(2)` — `fan.timeout` takes
  `Duration`, never `Compute` (those are two different clocks that do not mix).
- `fan.timeout(...) { work } ?? 0` is the idiomatic shape.
- The region body is PURE — put the arithmetic in a plain helper `fn`.
