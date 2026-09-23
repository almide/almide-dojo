Modify the program below. Return the whole file.

Requested change:

- Add `fn announcer(entries: List[Entry]) -> (String) -> String` returning a
  closure that, given a greeting, produces `<greeting>, <name> leads with <points>`
  for the current leader, or `<greeting>, no scores` when there are no entries.

Preserve (the hidden oracle checks these):

- `totals` and `standings` keep their exact behaviour.
- The leader is the player with the highest TOTAL over all their entries (the
  same ranking `standings` uses); ties go to the alphabetically first name.
- The leader is decided when `announcer` is called. The closure captures only
  the leader's name and points, never `entries`; the greeting is whatever the
  caller passes, each time.
