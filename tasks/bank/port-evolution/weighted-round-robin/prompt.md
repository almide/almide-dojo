Modify the program below. Return the whole file.

Requested change:

- Add `type Weighted: Balancer = { backends: List[(String, Int)] }`: requests cycle
  through the backends in list order, each backend taking `weight` CONSECUTIVE
  requests before the next one (`[("a", 2), ("b", 1)]` gives a, a, b, a, a, b, ...).
- Add `type Pool = | Even(RoundRobin) | ByWeight(Weighted)` and
  `fn load_of(p: Pool, n: Int) -> String`.

Preserve (the hidden oracle checks these):

- `RoundRobin`, `assign`, `load` and the protocol keep their behaviour.
- A backend with weight 0 (or a negative weight) never receives a request.
- When every weight is 0, or there are no backends, every request is unassigned (`-`);
  this must not crash.
