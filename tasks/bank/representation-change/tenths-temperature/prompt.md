Modify the program below. Return the whole file.

Requested change:

- Readings now carry tenths of a degree. Introduce `type Temp: Eq, Repr = { tenths: Int }`
  and change `Reading.value: Int` to `Reading.temp: Temp`.
- `reading(sensor, tenths)` keeps its name and arity; its second argument is now tenths.
- `render` prints exactly one decimal: `reading("a", 125)` renders as `a:12.5`,
  `reading("a", 120)` as `a:12.0`.

Preserve (the hidden oracle checks these):

- `hottest` still picks the highest reading and the FIRST one on a tie.
- Rendering is correct for every sign: `-0.5` and `-12.5` render with the minus
  in front and a single digit after the point. Integer `/` and `%` truncate toward
  zero in Almide, so `-5 / 10` is `0` and `-5 % 10` is `-5`.
- The signatures of `reading`, `render`, `hottest` do not change.
