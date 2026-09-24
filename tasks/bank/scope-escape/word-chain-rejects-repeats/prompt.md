Modify the program below. Return the whole file.

Requested change:

- Add `fn referee(words: List[String]) -> String` returning `valid`, or
  `move <n>: <reason>` for the first illegal move (n counts from 1; reason
  `no link` or `repeat`).

Preserve (the hidden oracle checks these):

- `first_letter`, `last_letter` and `links` keep their exact behaviour.
- A repeated word is illegal even when it links correctly; repeats are
  detected case-insensitively. When a move breaks both rules, report
  `no link`.
- The set of played words is a temporary of `referee`: return only the string.
