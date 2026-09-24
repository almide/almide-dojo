Modify the program below. Return the whole file.

Requested change:

- Add `fn best_streak(days: List[Int]) -> String` returning `streak=<n>`: the
  longest run of CONSECUTIVE days with at least one login.

Preserve (the hidden oracle checks these):

- `active_days`, `first_day` and `logins` keep their exact behaviour.
- Several logins on one day count as that one day: they neither break nor
  lengthen a streak. Input order does not matter. No logins: `streak=0`.
- The sorted day list is a temporary of `best_streak`: return only the string.
