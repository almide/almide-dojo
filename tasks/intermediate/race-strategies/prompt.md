Write these functions:

    fn exact(n: Int) -> Int
    fn heuristic(n: Int) -> Int
    effect fn best_effort(n: Int) -> Int

Behavior:

- `exact(n)`: sum 0..n the SLOW way — a `while` loop accumulating `i` from
  0 to n-1 (this costs about n compute units).
- `heuristic(n)`: the closed form `n * (n - 1) / 2` (constant cost).
- `best_effort(n)`: race the two strategies with `fan.race` under a
  deterministic compute budget of 1 millisecond; return `-1` if no strategy
  finishes in budget.

Notes:

- `fan.race(compute.ms(1)) { exact(n); heuristic(n) }` — the winner is the
  arm that spends the LEAST deterministic compute (ties go to source order),
  and arms over budget are excluded. Both arms compute the same value here,
  so the race is about cost, not correctness.
- Race arms are PURE single expressions.
