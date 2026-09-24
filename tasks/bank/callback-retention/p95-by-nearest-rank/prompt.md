Modify the program below. Return the whole file.

Requested change:

- Add `fn p95_label(ms: List[Int]) -> (String) -> String` returning a closure
  that, given an endpoint name, answers `<name> p95=<v>ms`, or
  `<name> p95=n/a` when there are no latencies.

The 95th percentile uses the NEAREST-RANK definition: the value at rank
`ceil(0.95 * n)` (1-based) in ascending order.

Preserve (the hidden oracle checks these):

- `sorted`, `median`, `slow_count` and `summary` keep their exact behaviour.
- Nearest rank exactly: for 20 values it is the 19th smallest, for 10 values
  the 10th, for 1 value that value.
- The closure captures only the percentile value, never `ms` or a sorted copy.
