# deadline-guard

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn square_plus_one(n: Int) -> Int = n * n + 1

effect fn within_deadline(n: Int) -> Int =
  fan.timeout(duration.s(2)) { square_plus_one(n) } ?? 0
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
import fan
import duration

fn square_plus_one(n: Int) -> Int = n * n + 1

effect fn within_deadline(n: Int) -> Int =
  fan.timeout(duration.s(2)) { square_plus_one(n) } ?? 0
```

**Diagnostic:**

```
error: 'fan' is auto-available — it is a built-in surface, not a module, at line 1:8
  --> /tmp/dojo-deadline-guard-1.almd:1:8
  here: import fan
  hint: Remove the `import fan` line; fan.bounded / fan.race / fan.timeout are always in scope
  |
1 | import fan
  |        ^

1 error(s) found
FAILED: /tmp/dojo-deadline-guard-1.almd
Compile error for /tmp/dojo-deadline-guard-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn square_plus_one(n: Int) -> Int = n * n + 1

effect fn within_deadline(n: Int) -> Int =
  fan.timeout(duration.s(2)) { square_plus_one(n) } ?? 0
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
import fan
import duration

fn square_plus_one(n: Int) -> Int = n * n + 1

effect fn within_deadline(n: Int) -> Int =
  fan.timeout(duration.s(2)) { square_plus_one(n) } ?? 0
```

**Diagnostic:**

```
error: 'fan' is auto-available — it is a built-in surface, not a module, at line 1:8
  --> /tmp/dojo-deadline-guard-3.almd:1:8
  here: import fan
  hint: Remove the `import fan` line; fan.bounded / fan.race / fan.timeout are always in scope
  |
1 | import fan
  |        ^

1 error(s) found
FAILED: /tmp/dojo-deadline-guard-3.almd
Compile error for /tmp/dojo-deadline-guard-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
