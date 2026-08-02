Write these functions:

    fn parse_port(n: Int) -> Result[Int, String]
    effect fn first_valid_port(candidates: List[Int]) -> Int

Behavior:

- `parse_port(n)`: `ok(n)` when `1024 <= n` and `n <= 65535`, else
  `err("out of range")`.
- `first_valid_port(candidates)`: try the candidates IN LIST ORDER with the
  `fan.any` mapper form and return the FIRST valid port; return `-1` when
  none is valid (or the list is empty).

Notes:

- The mapper form is `fan.any(xs, (x) => f(x))` — it applies the callback in
  list order, an element's `err` disqualifies that element only, and later
  elements are never evaluated once an `ok` is found.
- `fan.any(...)` returns `Result[Int, String]`; use `?? -1` for the fallback.
