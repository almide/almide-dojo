Modify the program below. Return the whole file.

Requested change:

- Add `fn winners(matches: List[String]) -> List[String]` returning `A` or `B`
  for each match in order: the player who won MORE SETS (`-` when equal).

Preserve (the hidden oracle checks these):

- `sets` and `games` keep their exact behaviour.
- The match goes to whoever wins more sets, even if the other player won more
  games in total ("6-0 5-7 5-7" is B).
- Each match's set list is a temporary of that match's step.
