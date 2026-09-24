Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A row with FEWER cells than the header's width is no longer fatal:
  `read_table` pads it on the right with zeros up to the width and appends the
  note `row <r> padded from <k> to <n>` (for example `row 2 padded from 2 to 3`).
- `parse_row` is unchanged: it still returns `WrongWidth(r, k, n)` for such a row.

Preserve (the hidden oracle checks these on untouched inputs):

- A row with MORE cells than the width is still fatal, `WrongWidth(r, k, n)`,
  although it is the same error case.
- The cells that are there are still parsed: a bad cell in a short row is
  `BadCell` as before.
- Header errors (`NoHeader`) stay fatal. Rows keep their numbering (blank lines
  are skipped and not counted); notes are in row order.
