Write a function with this exact signature:

    effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int

Behavior:

- Build ONE deterministic compute budget that is the SUM of `ms` milliseconds
  and `us` microseconds.
- Run `count_to(n)` (provided below — include it verbatim in your answer)
  under that budget with `fan.bounded`; return `-1` on exhaustion.

Include this helper exactly as written:

    fn count_to(n: Int) -> Int = {
      var i = 0
      var acc = 0
      while i < n { acc = acc + i; i = i + 1 }
      acc
    }

Notes:

- Time constructors: `compute.ms(x)`, `compute.us(x)`. Budgets ADD with `+`
  (`Compute + Compute` is saturating). A bare Int never mixes into a time.
