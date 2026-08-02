# race-strategies

- **model**: `cli:claude`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
import fan
import compute

fn exact(n: Int) -> Int =
  list.fold(list.range(0, n), 0, (acc, i) => acc + i)

fn heuristic(n: Int) -> Int =
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int =
  match fan.race(compute.ms(1)) { exact(n); heuristic(n) } {
    some(v) => v,
    none => -1
  }
```

**Diagnostic:**

```
error: Expected identifier at line 1:8 (got Fan 'fan')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-race-strategies-0.almd:1:8
  here: import fan
  |
1 | import fan
  |        ^
error[E010]: non-exhaustive match: missing ok(_), err(_)
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-race-strategies-0.almd:11:55
  in match
  here: match fan.race(compute.ms(1)) { exact(n); heuristic(n) } {
  hint: add arms for ok(_), err(_):
  ok(x) => _
  err(e) => _
Or use `_ => todo()` to compile incrementally.
   |
11 |   match fan.race(compute.ms(1)) { exact(n); heuristic(n) } {
   |                                                       ^

2 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-race-strategies-0.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-race-strategies-0.almd

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
import compute

fn exact(n: Int) -> Int =
  list.fold(list.range(0, n), 0, (acc, i) => acc + i)

fn heuristic(n: Int) -> Int =
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int =
  match fan.race(compute.ms(1)) { exact(n); heuristic(n) } {
    ok(v) => v,
    err(_) => -1
  }
```

**Diagnostic:**

```
module 'compute' not found
  searched: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T/compute.almd, /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T/compute/mod.almd, /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T/compute/src/mod.almd, /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T/compute/src/lib.almd
  hint: Create compute.almd in the same directory, or add to [dependencies] in almide.toml
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-race-strategies-1.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-race-strategies-1.almd

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn exact(n: Int) -> Int =
  list.fold(list.range(0, n), 0, (acc, i) => acc + i)

fn heuristic(n: Int) -> Int =
  n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int =
  match fan.race(compute.ms(1)) { exact(n); heuristic(n) } {
    ok(v) => v,
    err(_) => -1
  }
```
