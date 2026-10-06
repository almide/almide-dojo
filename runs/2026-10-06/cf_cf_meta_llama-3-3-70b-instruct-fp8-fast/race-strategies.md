# race-strategies

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  let mut sum = 0
  while sum < n * (n - 1) / 2 {
    sum = sum + n
  }
  sum

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { exact(n); heuristic(n) } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
error: 'let mut' is not valid in Almide at line 4:7
  --> /tmp/dojo-race-strategies-0.almd:4:7
  here: let mut sum = 0
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
4 |   let mut sum = 0
  |       ^
error: fan.race arms are separated by `,` or a newline, not `;`, at line 14:37
  --> /tmp/dojo-race-strategies-0.almd:14:37
  here: fan.race(compute.ms(1)) { exact(n); heuristic(n) }
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
14 |   fan.race(compute.ms(1)) { exact(n); heuristic(n) }
   |                                     ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-race-strategies-0.almd:5:9
  in variable sum
  here: while sum < n * (n - 1) / 2 {
  hint: Check the variable name
  |
5 |   while sum < n * (n - 1) / 2 {
  |         ^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-race-strategies-0.almd:6:11
  in variable sum
  here: sum = sum + n
  hint: Check the variable name
  |
6 |     sum = sum + n
  |           ^^^
error[E003]: cannot assign to undefined binding 'sum'
  --> /tmp/dojo-race-strategies-0.almd:6:17
  in sum = ...
  here: sum = sum + n
  hint: No `let`/`var` named 'sum' is in scope to assign to. Declare it first: `var sum = ...`
  |
6 |     sum = sum + n
  |                 ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-race-strategies-0.almd:8:3
  in variable sum
  here: sum
  hint: Check the variable name
  |
8 |   sum
  |   ^^^

6 error(s) found
FAILED: /tmp/dojo-race-strategies-0.almd
Compile error for /tmp/dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  var sum = 0
  var i = 0
  while i < n {
    sum = sum + i
    i = i + 1
  }
  sum

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { 
    exact(n), 
    heuristic(n) 
  } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-race-strategies-1.almd
Compile error for /tmp/dojo-race-strategies-1.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  var sum = 0
  var i = 0
  while i < n {
    sum = sum + i
    i = i + 1
  }
  sum

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { 
    (exact(n)), 
    (heuristic(n)) 
  } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-race-strategies-2.almd
Compile error for /tmp/dojo-race-strategies-2.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
import fan

fn exact(n: Int) -> Int = 
  var sum = 0
  var i = 0
  while i < n {
    sum = sum + i
    i = i + 1
  }
  sum

fn heuristic(n: Int) -> Int = 
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int = 
  fan.race(compute.ms(1)) { 
    exact(n), 
    heuristic(n) 
  } 
  |> option.unwrap_or(-1)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-race-strategies-3.almd
Compile error for /tmp/dojo-race-strategies-3.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
