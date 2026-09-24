Modify the program below. Return the whole file.

Requested change:

- Add `fn gap_alarm(ts: List[Int]) -> (Int) -> String` returning a closure
  that, given a limit, answers `gap <g> over` when the largest wait between
  two consecutive buses exceeds the limit, else `gap <g> ok`.

Preserve (the hidden oracle checks these):

- `earliest`, `latest` and `span` keep their exact behaviour.
- "Consecutive" means consecutive in TIME order, whatever order they were
  logged in. Fewer than two buses: the gap is 0.
- Over means strictly greater than the limit.
- The closure captures only the largest gap, never `ts` or a sorted copy.
