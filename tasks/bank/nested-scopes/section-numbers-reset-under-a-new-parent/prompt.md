Modify the program below. Return the whole file.

Requested change:

- Add `fn last_numbers(docs: List[String]) -> List[String]` returning, for
  each document in order, the section number of its LAST heading (`""` for a
  document without headings).

Preserve (the hidden oracle checks these):

- `levels`, `chapters` and `well_formed` keep their exact behaviour.
- The level-2 counter restarts at every level-1 heading ("1", "1.1", "1.2",
  "2", "2.1"); a level-2 heading before any level-1 is numbered "0.<n>".
- Every document is numbered on its own; its counters are temporaries of that
  document's step.
