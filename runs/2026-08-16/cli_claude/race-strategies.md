# race-strategies

- **model**: `cli:claude`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn exact(n: Int) -> Int =
  let total = 0
  let i = 0
  while i < n {
    total = total + i
    i = i + 1
  }
  total

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int =
  match fan.race(compute.ms(1)) { exact(n); heuristic(n) } {
    some(v) => v,
    none => -1
  }
```

**Diagnostic:**

```
error: fan.race arms are separated by `,` or a newline, not `;`, at line 13:43
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-0.almd:13:43
  here: match fan.race(compute.ms(1)) { exact(n); heuristic(n) } {
  hint: arms run as parallel siblings — `;` is the sequencing separator and stays legal only INSIDE a block arm: { let x = f(); g(x) }
   |
13 |   match fan.race(compute.ms(1)) { exact(n); heuristic(n) } {
   |                                           ^
error[E009]: cannot reassign immutable binding 'total'
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-0.almd:5:21
  in total = ...
  here: total = total + i
  hint: Use 'var total = ...' instead of 'let total = ...' to declare a mutable variable
  try:
      // let total = ...  →  var total = ...
      var total = <initial value>
  |
2 |   let total = 0
  |   --------------------- 'total' declared here
...
5 |     total = total + i
  |                     ^
error[E009]: cannot reassign immutable binding 'i'
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-0.almd:6:13
  in i = ...
  here: i = i + 1
  hint: Use 'var i = ...' instead of 'let i = ...' to declare a mutable variable
  try:
      // let i = ...  →  var i = ...
      var i = <initial value>
  |
3 |   let i = 0
  |   ----------------- 'i' declared here
...
6 |     i = i + 1
  |             ^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?0])
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-0.almd:20:16
  in this expression with an unconstrained type
  here: assert_eq(r, ok(45))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
20 |   assert_eq(r, ok(45))
   |                ^^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?1])
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-0.almd:24:16
  in this expression with an unconstrained type
  here: assert_eq(r, ok(0))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
24 |   assert_eq(r, ok(0))
   |                ^^
error[E025]: cannot infer a concrete type for this expression (type Result[Int, ?2])
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-0.almd:28:16
  in this expression with an unconstrained type
  here: assert_eq(r, ok(12497500))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Result[Int, String] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
28 |   assert_eq(r, ok(12497500))
   |                ^^

6 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-0.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn exact(n: Int) -> Int =
  var total = 0
  var i = 0
  while i < n {
    total = total + i
    i = i + 1
  }
  total

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int =
  match fan.race(compute.ms(1)) { exact(n), heuristic(n) } {
    some(v) => v,
    none => -1
  }
```

**Diagnostic:**

```
error[E010]: non-exhaustive match: missing ok(_), err(_)
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-1.almd:13:55
  in match
  here: match fan.race(compute.ms(1)) { exact(n), heuristic(n) } {
  hint: add arms for ok(_), err(_):
  ok(x) => _
  err(e) => _
Or use `_ => todo()` to compile incrementally.
   |
13 |   match fan.race(compute.ms(1)) { exact(n), heuristic(n) } {
   |                                                       ^
error[E048]: pattern `some(..)` destructures an Option, but the subject is `Result[Int, String]`
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-1.almd:13:55
  in match pattern
  here: match fan.race(compute.ms(1)) { exact(n), heuristic(n) } {
  hint: Option and Result are separate types: an Option is matched with `some(..)` / `none`, a Result with `ok(..)` / `err(..)`. Write `ok(..)` here.
  try:
      ok(..)
   |
13 |   match fan.race(compute.ms(1)) { exact(n), heuristic(n) } {
   |                                                       ^
error[E048]: pattern `none` destructures an Option, but the subject is `Result[Int, String]`
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-1.almd:14:16
  in match pattern
  here: some(v) => v,
  hint: Option and Result are separate types: an Option is matched with `some(..)` / `none`, a Result with `ok(..)` / `err(..)`. Write `err(..)` here. A Result's failure arm carries the error value: `err(e)`.
  try:
      err(..)
   |
14 |     some(v) => v,
   |                ^

3 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-1.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-race-strategies-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn exact(n: Int) -> Int =
  var total = 0
  var i = 0
  while i < n {
    total = total + i
    i = i + 1
  }
  total

fn heuristic(n: Int) -> Int = n * (n - 1) / 2

effect fn best_effort(n: Int) -> Int =
  match fan.race(compute.ms(1)) { exact(n), heuristic(n) } {
    ok(v) => v,
    err(e) => -1
  }
```
