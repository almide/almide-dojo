Modify the program below. Return the whole file.

Requested change:

- Add `fn extremes(xs: List[Int]) -> (String) -> String` returning a closure
  that, given a station name, answers `<station>: <lo>..<hi>` (both written
  with `tenths`), or `<station>: no data` when there is no real reading.

Preserve (the hidden oracle checks these):

- `MISSING`, `present` and `tenths` keep their exact behaviour.
- The -9999 marker is never a reading: it is neither the minimum nor the
  maximum, and a station with only markers has no data.
- The closure captures only the two extremes, never `xs`.
