Modify the program below. Return the whole file.

Requested change:

- Add `fn change_badge(xs: List[String]) -> (String) -> String` returning a
  closure that, given a light's name, answers `<name>: <n> changes`, where a
  change is a second whose state differs from the second before it.

Preserve (the hidden oracle checks these):

- `distinct_states` and `seconds_in` keep their exact behaviour.
- Going back to an earlier state is a change too: red, green, red is 2
  changes (not "2 states - 1").
- The closure captures only the number, never `xs`.
