# deadline-guard

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn within_deadline(n: Int) -> Int = {
  fan.timeout(duration.s(2)) {
    n_squared_plus_one(n)
  } ?? 0
}

fn n_squared_plus_one(n: Int) -> Int = n * n + 1
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
    n_squared_plus_one(n)
  } ?? 0
}

fn n_squared_plus_one(n: Int) -> Int = n * n + 1
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
    n_squared_plus_one(n)
  } ?? 0
}

fn n_squared_plus_one(n: Int) -> Int = n * n + 1
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
    n_squared_plus_one(n)
  } ?? 0
}

fn n_squared_plus_one(n: Int) -> Int = n * n + 1
```

**Diagnostic:**

```
FAILED: /tmp/dojo-deadline-guard-3.almd
Compile error for /tmp/dojo-deadline-guard-3.almd:
fan.bounded / fan.race / fan.timeout tests run on the WASM test leg (the native test harness has no deterministic meter). This file fell back to the native harness, so its wasm render declined — fix that wall (run with ALMIDE_WALL_REASON=1 to see it)

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
