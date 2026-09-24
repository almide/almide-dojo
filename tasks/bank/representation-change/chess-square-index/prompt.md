Modify the program below. Return the whole file.

Requested change:

- Store a square as one number: change `Sq` to `type Sq: Eq, Repr = { index: Int }`
  with `index = rank * 8 + file` (a1 = 0, b1 = 1, h1 = 7, a2 = 8, h8 = 63). `sq(name)`
  and `name(s)` keep their signatures.
- Every move generator keeps its signature and result.

Preserve (the hidden oracle checks these):

- Moves never wrap around the edge of the board: from `h4` a knight cannot land on
  the a- or b-file, and a king on `a5` has no square on the h-file. Only squares
  really reachable on an 8x8 board are listed.
- Moves are listed in the same step order as before.
- `distance` keeps counting king steps.
