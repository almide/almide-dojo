Modify the program below. Return the whole file.

Requested change:

- Add `fn outcomes(boards: List[String]) -> List[String]` returning, for each
  board in order, `X` or `O` for a player holding a full line, else `draw`
  for a full board, else `open`.

Preserve (the hidden oracle checks these):

- `cells`, `moves` and `full` keep their exact behaviour.
- The eight lines are the three rows, the three columns AND the two
  diagonals. (Boards never have two winners.)
- Each board's cell list is a temporary of that board's step.
