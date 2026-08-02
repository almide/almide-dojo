# budget-units

- **model**: `cli:claude`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
import compute
import fan

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  match fan.bounded(budget, () => count_to(n)) {
    some(v) => v,
    none => -1
  }
}
```

**Diagnostic:**

```
'compute' is auto-available — it is a built-in surface, not a module
  hint: Remove the `import compute` line; compute.ms(...) is always in scope
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-0.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-0.almd

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
import fan

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  match fan.bounded(budget, () => count_to(n)) {
    some(v) => v,
    none => -1
  }
}
```

**Diagnostic:**

```
error: 'fan' is auto-available — it is a built-in surface, not a module, at line 1:8
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-1.almd:1:8
  here: import fan
  hint: Remove the `import fan` line; fan.bounded / fan.race / fan.timeout are always in scope
  |
1 | import fan
  |        ^
error: fan.bounded takes a BLOCK, not a thunk argument, at line 12:27
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-1.almd:12:27
  here: match fan.bounded(budget, () => count_to(n)) {
  hint: fan.bounded(compute.ms(100)) { work(x) } — drop the `() =>` wrapper; the braces are the region
   |
12 |   match fan.bounded(budget, () => count_to(n)) {
   |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 16:1 (got RBrace '}')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-1.almd:16:1
  here: }
   |
16 | }
   | ^

3 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-1.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-1.almd

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  let result = fan.bounded(budget) { count_to(n) }
  match result {
    some(v) => v,
    none => -1
  }
}
```

**Diagnostic:**

```
error[E010]: non-exhaustive match: missing _
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-2.almd:11:9
  in match
  here: match result {
  hint: match on Int requires a catch-all '_' pattern
   |
11 |   match result {
   |         ^^^^^^
error: pattern `some(..)` cannot match Int — the subject is not an Option
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-2.almd:11:9
  in match pattern
  here: match result {
  hint: the value is already a plain Int. If it comes from an effect-fn call, auto-`?` has unwrapped it — use the value directly, or `?? <default>` on the producing call for a fallback
   |
11 |   match result {
   |         ^^^^^^
error: pattern `none` cannot match Int — the subject is not an Option
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-2.almd:12:16
  in match pattern
  here: some(v) => v,
  hint: the value is already a plain Int. If it comes from an effect-fn call, auto-`?` has unwrapped it — use the value directly, or `?? <default>` on the producing call for a fallback
   |
12 |     some(v) => v,
   |                ^

3 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-2.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-budget-units-2.almd

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}

effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  fan.bounded(budget) { count_to(n) } ?? -1
}
```
