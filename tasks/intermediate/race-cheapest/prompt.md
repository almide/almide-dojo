Write a function with this exact signature:

    effect fn cheapest_probe(costs: List[Int]) -> Int

Behavior:

- Race the elements of `costs` using `fan.race`'s MAPPER form: each element
  `x` evaluates `probe(x)` (provided below — include it verbatim) under the
  race meter.
- The element whose probe spends the LEAST deterministic compute wins; return
  that winning probe's RESULT value.
- Return `-1` when no element wins (for example, an empty list).

Include this helper exactly as written:

    fn probe(n: Int) -> Int = {
      var i = 0
      var acc = 0
      while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
      acc
    }

Notes:

- The mapper form is `fan.race(xs, (x) => ...)`. The mapper must return a
  `Result`: `ok(value)` competes, `err(reason)` disqualifies that element.
- `fan.race(...) ?? fallback` gives the winner or the fallback.
