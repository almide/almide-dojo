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
  let winner = fan.race(costs, (x) => ok(probe(x))) ?? none
  match winner {
    some(v) => v
    none => -1
  }
}

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error[E027]: fan.race was renamed to fan.min, and the clock argument is required
  --> /tmp/dojo-race-cheapest-0.almd:2:16
  in fan.race
  here: let winner = fan.race(costs, (x) => ok(probe(x))) ?? none
  hint: `fan.min(compute.ms(5)) { a(), b() }` picks the branch that spends the LEAST deterministic computation within the budget (ties go to source order); a dynamic list is `fan.min(compute.ms(5), xs, (x) => ok(f(x)))`. The clock says what "least" is measured on. For the first candidate that SUCCEEDS in source order, write `a() ?? b()`.
  |
2 |   let winner = fan.race(costs, (x) => ok(probe(x))) ?? none
  |                ^^^
error: pattern `some(..)` cannot match Int — the subject is not an Option
  --> /tmp/dojo-race-cheapest-0.almd:3:9
  in match pattern
  here: match winner {
  hint: the value is already a plain Int. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |   match winner {
  |         ^^^^^^
error: pattern `none` cannot match Int — the subject is not an Option
  --> /tmp/dojo-race-cheapest-0.almd:4:16
  in match pattern
  here: some(v) => v
  hint: the value is already a plain Int. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
4 |     some(v) => v
  |                ^
error[E001]: type mismatch in ?? fallback: expected Int but got Option[?6]
  --> /tmp/dojo-race-cheapest-0.almd:2:56
  in ?? fallback
  here: let winner = fan.race(costs, (x) => ok(probe(x))) ?? none
  hint: Fix the expression type or change the expected type
  |
2 |   let winner = fan.race(costs, (x) => ok(probe(x))) ?? none
  |                                                        ^^^^

4 error(s) found
FAILED: /tmp/dojo-race-cheapest-0.almd
  parse error: fan.race was renamed to fan.min, and the clock argument is required
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-race-cheapest-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
effect fn cheapest_probe(costs: List[Int]) -> Int = {
  fan.min(compute.ms(5), costs, (x) => ok(probe(x))) ?? -1
}

fn probe(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = (acc + i * 7) % 999983; i = i + 1 }
  acc
}
```
