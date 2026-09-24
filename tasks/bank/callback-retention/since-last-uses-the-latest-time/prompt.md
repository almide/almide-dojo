Modify the program below. Return the whole file.

Requested change:

- Add `fn since_last(ts: List[Int]) -> (Int) -> String` returning a closure
  that, given the current time, answers `<n>s ago` for the most recent event,
  or `never` when there are no events.

Preserve (the hidden oracle checks these):

- `in_window`, `first_seen` and `describe` keep their exact behaviour.
- The most recent event is the one with the LATEST timestamp, not the last
  one delivered.
- The closure captures only that timestamp, never `ts`.
