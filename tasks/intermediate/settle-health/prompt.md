Write these functions:

    fn check_net(code: Int) -> Result[Int, String]
    fn check_disk(free: Int) -> Result[Int, String]
    effect fn health(code: Int, free: Int) -> String

Behavior:

- `check_net(code)`: `ok(code)` when `code == 200`, else `err("net down")`.
- `check_disk(free)`: `ok(free)` when `free > 10`, else `err("disk full")`.
- `health(code, free)`: run BOTH checks with a `fan.settle` block (every
  check settles into its own Result — an Err never aborts the block), then
  report:
    - both ok                -> `"healthy"`
    - net err, disk ok       -> `"net degraded"`
    - net ok, disk err       -> `"disk degraded"`
    - both err               -> `"down"`

Notes:

- `fan.settle { a(); b() }` returns a TUPLE of per-arm Results in arm order:
  destructure it with `let (net, disk) = ...`.
- Match the pair with a tuple pattern:
  `match (net, disk) { (ok(_), ok(_)) => ..., (err(_), ok(_)) => ..., ... }`.
