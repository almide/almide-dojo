# budget-units

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget, count_to(n)) ?? -1
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```

**Diagnostic:**

```
error: fan.bounded takes a BLOCK, not a thunk argument, at line 3:21
  --> /tmp/dojo-budget-units-0.almd:3:21
  here: fan.bounded(budget, count_to(n)) ?? -1
  hint: fan.bounded(compute.ms(100)) { work(x) } — drop the `() =>` wrapper; the braces are the region
  |
3 |   fan.bounded(budget, count_to(n)) ?? -1
  |                     ^
error[E001]: type mismatch in fn 'run_with_budget': expected Int but got Unit
  --> /tmp/dojo-budget-units-0.almd:2:44
  in fn 'run_with_budget'
  here: let budget = compute.ms(ms) + compute.us(us)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let budget = compute.ms(ms) + compute.us(us)
  |                                            ^^

2 error(s) found
FAILED: /tmp/dojo-budget-units-0.almd
  parse error: fan.bounded takes a BLOCK, not a thunk argument, at line 3:21
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-budget-units-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget) {
    count_to(n)
  } ?? -1
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```
