Modify the program below. Return the whole file.

Requested change:

- Add `fn audit(xs: List[Int]) -> (String) -> String` returning a closure
  that, given a meter name, answers `<name>: ok` when the readings never go
  down, or `<name>: drop at <i>` where `i` is the index of the FIRST reading
  that is lower than the one before it.

Preserve (the hidden oracle checks these):

- `pairs`, `drops` and `is_monotone` keep their exact behaviour.
- Equal consecutive readings are NOT a drop.
- The closure captures only the index (or that there is none), never `xs`.
