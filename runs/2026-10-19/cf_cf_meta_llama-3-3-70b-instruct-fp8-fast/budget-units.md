# budget-units

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget, count_to(n)) |> option.unwrap_or(-1)
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
  here: fan.bounded(budget, count_to(n)) |> option.unwrap_or(-1)
  hint: fan.bounded(compute.ms(100)) { work(x) } — drop the `() =>` wrapper; the braces are the region
  |
3 |   fan.bounded(budget, count_to(n)) |> option.unwrap_or(-1)
  |                     ^

1 error(s) found
FAILED: /tmp/dojo-budget-units-0.almd
Compile error for /tmp/dojo-budget-units-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget) {
    count_to(n)
  } |> option.unwrap_or(-1)
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
FAILED: /tmp/dojo-budget-units-1.almd
Compile error for /tmp/dojo-budget-units-1.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget) {
    count_to(n)
  } |> option.unwrap_or(-1)
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
FAILED: /tmp/dojo-budget-units-2.almd
Compile error for /tmp/dojo-budget-units-2.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget) {
    count_to(n)
  } |> option.unwrap_or(-1)
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
FAILED: /tmp/dojo-budget-units-3.almd
Compile error for /tmp/dojo-budget-units-3.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
