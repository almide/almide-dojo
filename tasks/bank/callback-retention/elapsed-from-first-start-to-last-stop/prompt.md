Modify the program below. Return the whole file.

Requested change:

- Add `fn uptime(log: List[String]) -> (String) -> String` returning a closure
  that, given a unit (`s` or `min`), answers the time from the FIRST START to
  the LAST STOP in that unit (`<n>s` or `<n>min`, minutes rounded down), or
  `n/a` when there is no START, no STOP, or the last STOP is before the first
  START.

Preserve (the hidden oracle checks these):

- `parse` and `starts` keep their exact behaviour.
- The span runs from the EARLIEST START to the LATEST STOP, across restarts.
- The closure captures only the span, never `log`.
