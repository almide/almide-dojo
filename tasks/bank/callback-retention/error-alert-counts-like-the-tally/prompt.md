Modify the program below. Return the whole file.

Requested change:

- Add `fn alert_rule(lines: List[String]) -> (Int) -> String` returning a closure
  that, given a threshold, answers `alert: <n> errors` when the number of ERROR
  lines is at least the threshold and `ok: <n> errors` otherwise.

Preserve (the hidden oracle checks these):

- `level_of`, `tally` and `summary` keep their exact behaviour.
- ERROR lines are counted exactly as `tally` counts them: the level is
  case-insensitive and may have leading spaces; "ERRORS" or "ERROR:" is not
  an ERROR level.
- The threshold comparison is "at least" (n >= threshold); any threshold,
  including 0 or negative, is accepted.
- The closure captures only the error count, never `lines`.
