Modify the program below. Return the whole file.

Requested change:

- Add `fn mode_reporter(rolls: List[Int]) -> (String) -> String` returning a
  closure that, given a label, answers `<label>: mode <v> x<n>` for the most
  frequent value, or `<label>: no rolls`.

Preserve (the hidden oracle checks these):

- `counts`, `distinct_values` and `seen` keep their exact behaviour.
- When several values share the highest count, the mode is the SMALLEST of
  them (not the one rolled first). Negative values compare as numbers.
- The closure captures only the mode and its count, never `rolls`.
