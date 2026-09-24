Modify the program below. Return the whole file.

Requested change:

- Add `fn refused(accounts: List[String]) -> List[Int]` returning, for each
  account in order, how many of its password changes would have been refused
  (the first password is never a change).

Preserve (the hidden oracle checks these):

- `history` and `changes` keep their exact behaviour.
- Only the THREE passwords immediately before a change are checked: a
  password last used four changes ago is allowed again. A refused change is
  still counted in the history (the list is what was attempted).
- Each account's history is a temporary of that account's step.
