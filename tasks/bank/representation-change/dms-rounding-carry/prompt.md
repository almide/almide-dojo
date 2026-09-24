Modify the program below. Return the whole file.

Requested change:

- Bearings are now measured to the milli-arc-second: change `Bearing.arcsec: Int` to
  `Bearing.mas: Int` (1000 per arc-second). `bearing(label, mas)` and
  `turn(b, delta_mas)` take milli-arc-seconds.
- `dms` still prints whole seconds: the bearing is ROUNDED to the nearest whole
  arc-second (exactly half rounds away from zero) before it is split into degrees,
  minutes and seconds.

Preserve (the hidden oracle checks these):

- Rounding carries: `12d30m59.6s` prints `12d31m00s`, `12d59m59.5s` prints `13d00m00s`,
  and a bearing just below a whole second prints that second (`5.4996s` prints `0d00m05s`).
- The sign stays in front of the degrees and applies to the rounded value: `-0.4s`
  rounds to zero and prints `0d00m00s` (no minus), `-0.5s` prints `-0d00m01s`.
- Minutes and seconds keep two digits; `table` orders by the exact angle and keeps
  list order for equal angles.
