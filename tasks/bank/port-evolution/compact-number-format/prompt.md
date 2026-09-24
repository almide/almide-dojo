Modify the program below. Return the whole file.

Requested change:

- Add `type Compact: NumberFormat = {}`: a number whose size is below 1000 is shown
  as is; otherwise it is shown with ONE decimal and a suffix `k` (thousands), `M`
  (millions) or `G` (billions): 1234 is `1.2k`, 1250 is `1.3k` (halves round away
  from zero), -1500 is `-1.5k`, 2500000 is `2.5M`. Use the smallest suffix whose
  ROUNDED value is below 1000.0 (`G` for anything larger).
- Add `type Style = | Full(Digits) | Short(Compact)` and
  `fn dashboard_as(s: Style, metrics: List[(String, Int)], hidden: List[String]) -> List[String]`.

Preserve (the hidden oracle checks these):

- `Digits`, `dashboard` and the protocol keep their behaviour.
- Rounding carries into the next suffix: 999950 is `1.0M` (not `1000.0k`), while
  999949 is `999.9k`; 999 is `999` and 1000 is `1.0k`.
- The sign is kept for negative numbers of every size (`-999`, `-1.0M`).
