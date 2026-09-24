Modify the program below. Return the whole file.

Requested change:

- Store the cells flat, row after row: change `Grid` to
  `type Grid: Eq, Repr = { width: Int, cells: List[Int] }` (cell (r, c) is
  `cells[r * width + c]`). `grid(rows)` keeps its signature and flattens; the grid of
  no rows has width 0 and no cells.
- `height` and `width` read the new fields.

Preserve (the hidden oracle checks these):

- `get(g, r, c)` is `none` whenever r or c is outside the grid: a column equal to or
  past the width does NOT wrap into the next row, and a negative column does not
  reach back into the previous row.
- `neighbour_sum`, `peaks` and `column` keep their results, including on the edges
  and corners, and on a single-column grid.
