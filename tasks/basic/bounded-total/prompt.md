Write a function with this exact signature:

    effect fn safe_total(xs: List[Int]) -> Int

Behavior:

- Sum every element of `xs` under a DETERMINISTIC compute budget of 100
  milliseconds, using `fan.bounded`.
- If the budget is exceeded, return `-1` instead.

Notes:

- A compute budget is built with `compute.ms(100)` (a bare `100` is a type
  error — budgets carry a unit and a clock).
- `fan.bounded(...) { work } ?? -1` is the idiomatic anytime shape: `Ok`
  passes through, budget exhaustion falls to the fallback.
- The body of a `fan.bounded` region is PURE — write the summing as a plain
  helper `fn` (e.g. recursion over an index) and call it inside the region.
