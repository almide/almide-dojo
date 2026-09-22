# deadline-guard

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    let result = square_plus_one(n)
    result
  } ?? 0
}

fn square_plus_one(n: Int) -> Int = n * n + 1
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-0.almd
Compile error for /tmp/dojo-deadline-guard-0.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    let result = square_plus_one(n)
    result
  } ?? 0
}

fn square_plus_one(n: Int) -> Int = {
  let square = int.to_float(n) * int.to_float(n)
  let one = int.to_float(1)
  let result = float.to_int(square + one)
  result
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-1.almd
Compile error for /tmp/dojo-deadline-guard-1.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    let result = square_plus_one(n)
    result
  } ?? 0
}

fn square_plus_one(n: Int) -> Int = {
  n * n + 1
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-2.almd
Compile error for /tmp/dojo-deadline-guard-2.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    let result = square_plus_one(n)
    result
  } ?? 0
}

fn square_plus_one(n: Int) -> Int = {
  n * n + 1
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-3.almd
Compile error for /tmp/dojo-deadline-guard-3.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
