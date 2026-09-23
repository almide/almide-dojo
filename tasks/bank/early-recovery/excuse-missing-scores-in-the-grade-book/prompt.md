Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A missing score (`-` or an empty cell) is excused instead of fatal: the
  student is loaded, the excused score is left out of `scores` and counted in
  `excused`, and `report` shows `(<k> excused)` after the average
  (for example `ann 80 (1 excused)`).
- `parse_score` is unchanged and still returns `row <n>: missing score`.

Preserve (the hidden oracle checks these on untouched inputs):

- The average is taken over the scores that were actually given; an excused
  score is not a zero. A student whose scores are all excused has the average
  `n/a`.
- Every other error still propagates with its exact text and row
  (`bad score <s>`, `score out of range <s>`, `expected <k> scores, got <m>`),
  also in a row that has excused scores; the first failing row wins.
- 0 and 100 are valid scores. Rounding stays "rounded down".
