Modify the program below. Do not change any signature. Return the whole file.

Requested change:

- A board that cannot happen in a real game is invalid: `status` must fail
  with `impossible position`. A position is possible only when:
  X has made as many moves as O or one more; not both players have a line;
  if X has a line, X has exactly one move more than O; if O has a line, both
  have made the same number of moves.

Preserve (the hidden oracle checks these on untouched inputs):

- One player may have two lines at once (a fork completed by the last move).
- The empty board and full draws stay valid.
- The 9-cell and bad-cell checks come first with their existing messages;
  results for possible positions are unchanged.
