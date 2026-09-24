Modify the program below. Return the whole file.

Requested change:

- Store positions as numbers: introduce `type Ref: Eq, Repr = { col: Int, row: Int }`
  (both 1-based; column A is 1, Z is 26, AA is 27) and change `Cell.at: String` to
  `Cell.at: Ref`. `cell(at, value)` keeps taking the A1 text and converts it.
- Add `fn move(c: Cell, dcol: Int, drow: Int) -> Cell?`: the cell shifted by the
  given offsets, or `none` when the column or the row would fall below 1.

Preserve (the hidden oracle checks these):

- `render` still prints the A1 text: `Z1=..`, `AA1=..`, `AZ7=..`, `BA7=..`, `ZZ2=..`,
  `AAA2=..` (column letters are bijective base 26: there is no zero digit).
- `rect_sum` keeps taking corner references as A1 text and stays inclusive.
- `ordered` stays row by row, then by column NUMBER (`B2` before `AA2`), and keeps
  list order for equal positions.
