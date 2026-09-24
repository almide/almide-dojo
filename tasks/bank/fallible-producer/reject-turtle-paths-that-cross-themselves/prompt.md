Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- The turtle may not enter a cell it has already been on. `walk` (and so
  `summary`) fails with `path crosses itself at (<x>,<y>) on command <i>` for
  the first cell it enters a second time.

Preserve (the hidden oracle checks these on untouched inputs):

- Every cell the turtle passes counts, not only where moves end: the start
  cell (0,0), and each cell along a move. Turning on the spot does not enter a
  cell. Going straight back over the path is a crossing too.
- "First" is in walking order: within a move, the cells are entered one by one,
  and the first repeated one is reported, with the number of the command that
  entered it.
- The whole program is read first: a bad command anywhere is reported before
  any crossing, with its existing text.
- `summary` output is unchanged for paths that do not cross.
