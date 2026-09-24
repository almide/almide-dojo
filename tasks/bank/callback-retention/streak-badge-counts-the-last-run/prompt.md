Modify the program below. Return the whole file.

Requested change:

- Add `fn streak_badge(days: List[Bool]) -> (String) -> String` returning a
  closure that, given a name, answers
  `<name>: best <b>, current <c>` where `b` is the longest run of consecutive
  done days and `c` is the run of done days at the END of the log.

Preserve (the hidden oracle checks these):

- `done_days` and `completion` keep their exact behaviour.
- A run that reaches the last day counts for `best` too. A log that ends with
  a missed day has current 0. No days: `best 0, current 0`.
- The closure captures only the two numbers, never `days`.
