Modify the program below. Return the whole file.

Requested change:

- Add `fn first_conflict(grid: List[String]) -> String` returning `ok`, or the
  FIRST invalid unit in this order: rows 1-4 (`row <n>`), then columns 1-4
  (`col <n>`), then boxes 1-4 (`box <n>`, numbered left to right, top to
  bottom).

Preserve (the hidden oracle checks these):

- `cell`, `repeats`, `row_cells` and `filled` keep their exact behaviour.
- The reporting order is fixed: ANY row conflict is reported before any column
  conflict, and any column conflict before any box conflict.
- The unit lists are temporaries of `first_conflict`: return only the string.
