Modify the program below. Return the whole file.

Requested change:

- Add `fn tagger(xs: List[Int]) -> (String) -> String` returning a closure that,
  given a prefix, answers `<prefix>-<check>` where `check` is the weighted sum
  modulo 97, written with two digits (`05`).

Preserve (the hidden oracle checks these):

- `weighted` and `describe` keep their exact behaviour.
- The check is always in 0..96, also when the weighted sum is negative
  (a sum of -1 has check 96), and always two digits.
- The closure captures only the check, never `xs`.
