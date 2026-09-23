Modify the program below. Return the whole file.

Requested change:

- Add `fn eval_all(lines: List[String]) -> List[String]` that evaluates every
  line with `eval` and returns `=<value>` for a line that evaluates and
  `!<error>` for a line that fails, in order.

Preserve (the hidden oracle checks these):

- `eval`, `step` and `apply_op` keep their exact behaviour and messages.
- A failing line does not stop the batch: every later line is still evaluated.
- A line that is empty or only spaces is SKIPPED (it produces no entry at all).
- Each line's stack and tokens are temporaries of that line's step; the batch
  keeps only the result strings.
