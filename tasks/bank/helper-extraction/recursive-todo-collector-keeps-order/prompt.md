Modify the program below. Return the whole file.

Requested change:

- Replace the fold in `todos` with a recursive helper
  `fn collect(lines: List[String], i: Int, acc: List[String]) -> List[String]`
  that walks the lines by index from `i`, and make `todos` call it.

Preserve (the hidden oracle checks these):

- `todos` and `todo_report` stay the same functions of their input: the
  TODOs come out in SOURCE ORDER.
- `collect(lines, i, acc)` returns `acc` followed by the TODOs of the lines
  from index `i` on.
- A pure refactor: collecting allocates no more than the fold did.
