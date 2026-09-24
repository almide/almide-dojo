Modify the program below. Return the whole file.

Requested change:

- Store the free seats as ranges: change `Row` to
  `type Row: Eq, Repr = { size: Int, free: List[(Int, Int)] }`, where `free` lists
  `(start, length)` runs of free seats in increasing order. The list is kept
  CANONICAL: runs never overlap, never touch (two adjacent runs are one run), and
  have length >= 1. `empty_row(size)` has one run `(0, size)` (none when size is 0).
- Every function keeps its signature and result.

Preserve (the hidden oracle checks these):

- After any sequence of `book` and `release` the row is canonical: releasing seats
  next to free seats joins the runs, so two rows with the same free seats are EQUAL,
  and `first_block` finds a block that spans what used to be separate runs.
- `book` and `release` accept ranges that are partly booked / partly free already.
- `render`, `free_count`, `is_free` and `first_block` keep their answers (the lowest
  start wins; `none` when no block is long enough).
