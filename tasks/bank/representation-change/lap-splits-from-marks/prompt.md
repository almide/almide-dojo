Modify the program below. Return the whole file.

Requested change:

- Record lap durations instead of clock readings: change `Session` to
  `type Session: Eq, Repr = { laps: List[Int] }` (tenths of a second per lap) and make
  `session(laps)` take the durations. Add `fn marks(s: Session) -> List[Int]`, the clock
  reading at the end of each lap.
- Every other function keeps its signature and result.

Preserve (the hidden oracle checks these):

- `table` still shows, for lap n, the CLOCK READING at the end of that lap (the running
  total) and then the lap's own duration: laps 653, 657 print
  `L1 1:05.3 (+1:05.3)` and `L2 2:11.0 (+1:05.7)`.
- `total` is the sum; `fastest` is the shortest lap, the first one on a tie, none for
  no laps.
