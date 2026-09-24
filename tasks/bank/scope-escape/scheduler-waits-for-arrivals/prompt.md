Modify the program below. Return the whole file.

Requested change:

- Add `fn run_order(ss: List[String]) -> String` returning `order=<a>,<b>,...`
  for a single worker, or the `parse_jobs` error.

The clock starts at 0. At each step the worker runs, for one time unit, the
most urgent job that has ALREADY ARRIVED (arrival <= now); ties go to the
earlier arrival, then to the earlier position in the input. If no job has
arrived, the clock jumps to the next arrival.

Preserve (the hidden oracle checks these):

- `parse_job`, `parse_jobs` and `by_urgency` keep their exact behaviour.
- A job never runs before its arrival, however urgent it is.
- The waiting queue is a temporary of `run_order`: return only the string.
