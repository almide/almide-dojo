Modify the program below. Return the whole file.

Requested change:

- Unpack the result: introduce `type Score: Eq, Repr = { correct: Int, seconds: Int }`
  and change `Team.points: Int` to `Team.score: Score` (seconds may now be any
  non-negative number, 1000 or more included). `team(name, correct, seconds)` keeps
  its signature.
- A standings line now reads `1. red 3/50s` (correct answers, then seconds).

Preserve (the hidden oracle checks these):

- Better means MORE correct answers, and on equal correct answers FEWER seconds.
- Equal scores share a rank (competition ranking: `1, 2, 2, 4`), and `standings`
  lists equal scores in list order.
- `winners` lists every team sharing first place, in list order.
- A slow team never overtakes a team with more correct answers, however long it
  took (`2` correct in `1500s` still beats `1` correct in `10s`).
