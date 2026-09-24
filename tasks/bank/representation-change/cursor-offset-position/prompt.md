Modify the program below. Return the whole file.

Requested change:

- Represent a cursor by its position in the whole text: change `Cursor` to
  `type Cursor: Eq, Repr = { offset: Int }`, the 0-based index into the lines joined
  with `"\n"` (so every line break is one position). Add
  `fn at(doc: List[String], line: Int, col: Int) -> Cursor` converting the old
  1-based line/column form, and make `render(doc, c)` take the document too.

Preserve (the hidden oracle checks these):

- `render` still prints `line:col` (1-based); the position of a line break is the
  END of its line (`col = length + 1`), not the start of the next line.
- `char_at` is `none` at the end of every line (on the line break too), and the
  character otherwise.
- `right` and `right_by` still stop at the end of the last line, and `between` still
  returns the text in between, with `\n` for each line break crossed.
- Empty lines are real lines: in `["ab", "", "c"]` the cursor after `b` is `1:3`,
  the next step is `2:1`, then `3:1`.
