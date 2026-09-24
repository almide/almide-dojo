Modify the program below. Return the whole file.

Requested change:

- Add `fn recent_badge(ts: List[Int]) -> (String) -> String` returning a
  closure that, given an endpoint, answers `<endpoint>: recent <avg>ms`, the
  average of the LAST THREE times (rounded down), or `<endpoint>: no data`.

Preserve (the hidden oracle checks these):

- `slowest` and `samples` keep their exact behaviour.
- With fewer than three times, average the ones there are (one time of 90 is
  90, not 30).
- The closure captures only the average, never `ts`.
