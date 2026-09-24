Modify the program below. Return the whole file.

Requested change:

- Add `type Imperial: Units = {}` for `in` (25.4 mm), `ft` (304.8 mm) and `yd` (914.4 mm).
  Each quantity is converted exactly and then ROUNDED to the nearest whole millimetre,
  halves away from zero (7 in = 177.8 mm -> 178; -7 in -> -178; 5 in = 127 mm exactly).
  Other units are unknown.
- Add `type Either: Units = { metric: Metric, imperial: Imperial }` that uses the metric
  answer when there is one and the imperial one otherwise, and
  `type System = | Si(Metric) | Us(Imperial) | Any(Either)` with
  `fn describe_in(s: System, parts: List[(Int, String)]) -> String`.

Preserve (the hidden oracle checks these):

- `Metric`, `total_mm`, `describe` and the protocol keep their behaviour.
- Rounding is per quantity, to the NEAREST millimetre (not truncated), and symmetric for
  negative corrections.
- An unknown unit anywhere makes the whole description `unknown unit`.
