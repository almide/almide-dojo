# deadline-guard

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
import fan
import duration

fn square_plus_one(n: Int) -> Int = n * n + 1

effect fn within_deadline(n: Int) -> Int =
  fan.timeout(duration.s(2)) { square_plus_one(n) } ?? 0
```

**Diagnostic:**

```
error: Expected identifier at line 1:8 (got Fan 'fan')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-deadline-guard-0.almd:1:8
  here: import fan
  |
1 | import fan
  |        ^

1 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-deadline-guard-0.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-deadline-guard-0.almd

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn square_plus_one(n: Int) -> Int = n * n + 1

effect fn within_deadline(n: Int) -> Int =
  fan.timeout(duration.s(2)) { square_plus_one(n) } ?? 0
```
