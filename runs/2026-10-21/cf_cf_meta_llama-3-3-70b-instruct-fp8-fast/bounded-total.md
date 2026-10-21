# bounded-total

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  fan.bounded(compute.ms(100)) { 
    fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
      if i >= list.len(xs) then acc 
      else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
    sum_list(xs, 0, 0) 
  } ?? -1
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-bounded-total-0.almd:3:5
  in nested fn
  here: fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int =
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
3 |     fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int =
  |     ^^

1 error(s) found
FAILED: /tmp/dojo-bounded-total-0.almd
Compile error for /tmp/dojo-bounded-total-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  fan.bounded(compute.ms(100)) { 
    sum_list(xs, 0, 0) 
  } ?? -1

fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
  if i >= list.len(xs) then acc 
  else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-bounded-total-1.almd
Compile error for /tmp/dojo-bounded-total-1.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  fan.bounded(compute.ms(100)) { 
    sum_list(xs, 0, 0) 
  } ?? -1

fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
  if i >= list.len(xs) then acc 
  else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-bounded-total-2.almd
Compile error for /tmp/dojo-bounded-total-2.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn safe_total(xs: List[Int]) -> Int = 
  fan.bounded(compute.ms(100)) { 
    sum_list(xs, 0, 0) 
  } ?? -1

fn sum_list(xs: List[Int], acc: Int, i: Int) -> Int = 
  if i >= list.len(xs) then acc 
  else sum_list(xs, acc + list.get_or(xs, i, 0), i + 1)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-bounded-total-3.almd
Compile error for /tmp/dojo-bounded-total-3.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
