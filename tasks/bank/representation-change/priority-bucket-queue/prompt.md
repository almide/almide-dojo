Modify the program below. Return the whole file.

Requested change:

- Keep one bucket per priority: change `Queue` to
  `type Queue: Eq, Repr = { buckets: Map[Int, List[String]] }` (each list in arrival
  order). A priority with no jobs left has NO bucket, so two queues holding the same
  jobs are equal.
- Every function keeps its signature and result.

Preserve (the hidden oracle checks these):

- `pop` takes the highest priority and, within it, the job that arrived first.
- Once a priority's last job is popped, lower priorities are served next; `drain`
  returns every job, `size` counts them, and a fully drained queue equals `queue()`.
- Negative priorities are ordinary priorities (below 0).
