Modify the program below. Return the whole file.

Requested change:

- Add `fn avg_badge(xs: List[Int]) -> (String) -> String` returning a closure
  that, given a label, answers `<label>: avg <a>` where `a` is the mean
  rounded to the NEAREST integer, halves rounded AWAY FROM ZERO (2.5 is 3,
  -2.5 is -3, -2.4 is -2), or `<label>: avg n/a` with no deltas.

Preserve (the hidden oracle checks these):

- `net`, `warming` and `describe` keep their exact behaviour.
- Rounding is symmetric around zero: the mean of [-2, -3] is -3, of [-1, -2,
  -2] (-1.67) is -2, of [-1, 0] (-0.5) is -1.
- The closure captures only the rounded mean, never `xs`.
