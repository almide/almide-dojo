Modify the program below. Return the whole file.

Requested change:

- Make the history a fixed ring buffer: change `History` to
  `type History: Eq, Repr = { cap: Int, slots: List[String], start: Int, len: Int }`, where
  `slots` always has `cap` entries (unused ones are ""), `start` is the slot of the
  OLDEST entry and `len` the number of entries. `push` overwrites a single slot
  instead of rebuilding the list.
- Every function keeps its signature and result.

Preserve (the hidden oracle checks these):

- When the history is full, `push` replaces the OLDEST entry, and the next oldest
  becomes the oldest: after pushing a, b, c, d into a history of capacity 3,
  `render` is `b,c,d` and `recent(h, 1)` is `["d"]`, however many times it wraps.
- `size` never exceeds `cap`; `recent(h, n)` with `n` above the size lists them all.
- `contains` only sees current entries: an overwritten command is gone, and the
  empty string is never an entry unless it was pushed.
