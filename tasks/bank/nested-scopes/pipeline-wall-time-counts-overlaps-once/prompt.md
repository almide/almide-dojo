Modify the program below. Return the whole file.

Requested change:

- Add `fn wall_times(ps: List[String]) -> List[Int]` returning, for each
  pipeline in order, its wall-clock time: from the earliest stage start to
  the latest stage end (0 without stages).

Preserve (the hidden oracle checks these):

- `stages`, `cpu_time` and `slowest_stage` keep their exact behaviour.
- Wall time is NOT the sum of stage durations: parallel stages overlap and
  count once (that sum is `cpu_time`).
- Each pipeline's stage list is a temporary of that pipeline's step.
