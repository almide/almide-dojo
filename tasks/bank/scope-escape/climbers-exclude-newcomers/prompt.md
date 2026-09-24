Modify the program below. Return the whole file.

Requested change:

- Add `fn climbers(before: List[String], after: List[String]) -> String`
  returning the players whose rank IMPROVED (a smaller number) between the two
  snapshots, in their new rank order, joined by `,` (`none` when nobody did).

Preserve (the hidden oracle checks these):

- `rank_in`, `newcomers` and `dropped` keep their exact behaviour.
- Only players present in BOTH snapshots can climb: a newcomer is not a
  climber, however high they enter.
- The rank tables are temporaries of `climbers`: return only the string.
