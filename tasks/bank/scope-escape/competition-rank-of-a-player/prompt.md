Modify the program below. Return the whole file.

Requested change:

- Add `fn rank_of(scores: List[Score], player: String) -> String` returning
  `rank=<r> of <n>` (n = number of players), or `unranked` when the player
  is not in the table.

Preserve (the hidden oracle checks these):

- `ordered` and `leaderboard` keep their exact behaviour (display positions
  stay 1, 2, 3, ... even for ties).
- `rank_of` uses STANDARD COMPETITION ranking: a player's rank is 1 plus the
  number of players with strictly more points, so equal points share a rank
  (1, 2, 2, 4), whatever their names.
- Any sorted copy is a temporary of `rank_of`: return only the string.
