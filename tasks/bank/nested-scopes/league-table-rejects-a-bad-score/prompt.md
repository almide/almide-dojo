Modify the program below. Return the whole file.

Requested change:

- Add `fn league(teams: List[(String, String)]) -> List[String]` returning one
  line per team, in order: `<team>: <points> pts, gd <d>` where `d` is goals
  for minus goals against written with a sign (`+3`, `-2`, `0`), or
  `<team>: invalid (<message>)` when one of that team's results does not parse
  (the first bad one).

Preserve (the hidden oracle checks these):

- `parse_score`, `parse_results`, `points` and `team_points` keep their exact
  behaviour.
- A bad result INVALIDATES that team's line (it is not skipped); every other
  team is still scored.
- Each team's parsed scores are a temporary of that team's step.
