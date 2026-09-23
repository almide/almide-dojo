Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A non-zero digit may appear at most once in each row and at most once in
  each column. Add the case `Duplicate(Int, Int, Int)` to `GridErr`; `load`
  must fail with `Duplicate(row, col, digit)` naming the cell that repeats a
  digit already seen EARLIER in its row (to its left) or in its column (above it).
- When there are several, report the first such cell scanning the grid row
  by row, left to right.

Preserve (the hidden oracle checks these on untouched inputs):

- `0` is an empty cell and may repeat freely.
- Shape errors come first: the height check, then every row is parsed in order
  (`Ragged`, `BadCell` as today); only a grid with no shape error is checked for
  duplicates. Existing error payloads are unchanged.
- A row duplicate and a column duplicate are treated alike: whichever
  repeating cell comes first in row-major order is the one reported.
