Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- Panels must not overlap. `layout` (and so `summary`) fails with
  `panel <b> overlaps panel <a>` when two panels share at least one cell.

Preserve (the hidden oracle checks these on untouched inputs):

- Two panels overlap exactly when they share a cell, however they are placed
  (one inside the other, crossing, or at the same place). Panels that only
  touch along an edge or at a corner do not overlap.
- `<b>` is the first panel in line order that overlaps an earlier panel, and
  `<a>` the first earlier panel it overlaps.
- Every line is parsed and checked with the existing checks first (the first bad
  line wins); overlaps are checked after all lines are read.
- `summary` output is unchanged.
