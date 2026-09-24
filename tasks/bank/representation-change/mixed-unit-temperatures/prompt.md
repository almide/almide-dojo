Modify the program below. Return the whole file.

Requested change:

- Some thermostats report Fahrenheit. Introduce
  `type Temp: Eq, Repr = | C(Int) | F(Int)` (tenths of a degree in that scale) and change
  `Reading.tenths: Int` to `Reading.temp: Temp`; `reading(room, temp)` takes a `Temp`.
- `render` prints each reading in its OWN scale: `C(215)` is `21.5C`, `F(705)` is `70.5F`.
- `too_cold(rs, limit)` keeps its signature: `limit` is still tenths of a degree Celsius.

Preserve (the hidden oracle checks these):

- Comparisons across scales are EXACT (F = C * 9 / 5 + 32): `F(700)` (21.11C) is
  warmer than `C(211)`, `F(2120)` equals `C(1000)`, `F(-400)` equals `C(-400)`.
  Do not round a Fahrenheit value to tenths of a Celsius degree before comparing.
- `warmest` keeps the FIRST listed room when two readings are exactly equal, and
  `none` for an empty list.
- `too_cold` is strict and keeps list order; negative values render with their
  minus (`-0.5C`, `-40.0F`).
