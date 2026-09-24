Modify the program below. Return the whole file.

Requested change:

- Add `fn error_rates(logs: List[(String, String)]) -> List[String]` returning
  `<name>: <pct>` for each named log in order (using `tally` and `pct`),
  followed by a last line `all: <pct>` for all the logs together.

Preserve (the hidden oracle checks these):

- `classify`, `tally` and `pct` keep their exact behaviour (integer percent,
  rounded down; `n/a` when nothing is counted).
- The `all` line is the rate over the combined counts — total errors over
  total counted lines — NOT the average of the per-log percentages.
- Each log's lines are a temporary of that log's step; only two running
  totals are carried across logs.
