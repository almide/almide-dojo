# budget-units

- **model**: `cli:claude`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  match fan.bounded(budget, () => count_to(n)) {
    some(v) => v,
    none => -1
  }
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
error: fan.bounded takes a BLOCK, not a thunk argument, at line 3:27
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-budget-units-0.almd:3:27
  here: match fan.bounded(budget, () => count_to(n)) {
  hint: fan.bounded(compute.ms(100)) { work(x) } — drop the `() =>` wrapper; the braces are the region
  |
3 |   match fan.bounded(budget, () => count_to(n)) {
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:1 (got RBrace '}')
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-budget-units-0.almd:7:1
  here: }
  |
7 | }
  | ^

2 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-budget-units-0.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-budget-units-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  match fan.bounded(budget) { count_to(n) } {
    some(v) => v,
    none => -1
  }
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
error[E010]: non-exhaustive match: missing ok(_), err(_)
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-budget-units-1.almd:3:40
  in match
  here: match fan.bounded(budget) { count_to(n) } {
  hint: add arms for ok(_), err(_):
  ok(x) => _
  err(e) => _
Or use `_ => todo()` to compile incrementally.
  |
3 |   match fan.bounded(budget) { count_to(n) } {
  |                                        ^
error[E048]: pattern `some(..)` destructures an Option, but the subject is `Result[Int, String]`
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-budget-units-1.almd:3:40
  in match pattern
  here: match fan.bounded(budget) { count_to(n) } {
  hint: Option and Result are separate types: an Option is matched with `some(..)` / `none`, a Result with `ok(..)` / `err(..)`. Write `ok(..)` here.
  try:
      ok(..)
  |
3 |   match fan.bounded(budget) { count_to(n) } {
  |                                        ^
error[E048]: pattern `none` destructures an Option, but the subject is `Result[Int, String]`
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-budget-units-1.almd:4:16
  in match pattern
  here: some(v) => v,
  hint: Option and Result are separate types: an Option is matched with `some(..)` / `none`, a Result with `ok(..)` / `err(..)`. Write `err(..)` here. A Result's failure arm carries the error value: `err(e)`.
  try:
      err(..)
  |
4 |     some(v) => v,
  |                ^

3 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-budget-units-1.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-budget-units-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
effect fn run_with_budget(ms: Int, us: Int, n: Int) -> Int = {
  let budget = compute.ms(ms) + compute.us(us)
  match fan.bounded(budget) { count_to(n) } {
    ok(v) => v,
    err(e) => -1
  }
}

fn count_to(n: Int) -> Int = {
  var i = 0
  var acc = 0
  while i < n { acc = acc + i; i = i + 1 }
  acc
}
```
