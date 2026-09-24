Modify the program below. Return the whole file.

Requested change:

- Add `fn usage(lines: List[String]) -> String` returning `<user>=<minutes>`
  for every user with at least one completed session, sorted by user name and
  comma-separated (`""` when there are none), or the `parse_log` error.

A session starts at a user's "in" and ends at their next "out".

Preserve (the hidden oracle checks these):

- `parse_event`, `parse_log` and `users` keep their exact behaviour.
- A second "in" while the user is already in does NOT restart the session:
  the session still runs from the FIRST "in".
- An "out" without an open session is ignored; a session still open at the
  end of the log is not counted.
- The table of open sessions is a temporary of `usage`: return only the string.
