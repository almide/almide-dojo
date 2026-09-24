Modify the program below. Return the whole file.

Requested change:

- Add `fn winners(ts: List[String]) -> List[String]` returning, for each
  tournament in order, `<player> <points>` for the player with the most points
  (points written "3", "2.5", "0.5"; ties go to the first player in
  `players` order), or `-` for a tournament without games.

Preserve (the hidden oracle checks these):

- `games`, `players` and `decisive` keep their exact behaviour.
- A draw gives HALF a point to each player; a win 1, a loss 0.
- Each tournament's score table is a temporary of that tournament's step.
