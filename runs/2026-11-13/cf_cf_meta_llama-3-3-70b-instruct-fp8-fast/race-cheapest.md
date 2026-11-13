# race-cheapest

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fn probe(n: Int) -> Int = {
    var i = 0
    var acc = 0
    while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
    acc
  }

  fan.race(costs, (x) => ok(probe(x))) ?? -1
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-race-cheapest-0.almd:2:3
  in nested fn
  here: fn probe(n: Int) -> Int = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
2 |   fn probe(n: Int) -> Int = {
  |   ^^
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-cheapest-0.almd:9:3
  in fan.race
  here: fan.race(costs, (x) => ok(probe(x))) ?? -1
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
  |
9 |   fan.race(costs, (x) => ok(probe(x))) ?? -1
  |   ^^^

2 error(s) found
FAILED: /tmp/dojo-race-cheapest-0.almd
  parse error: `fn` cannot be declared inside a function body
  parse error: fan.race was renamed to fan.min, and the clock argument is required
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-cheapest-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}

effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.min(compute.ms(5), costs, (x) => ok(probe(x))) ?? -1
}
```
