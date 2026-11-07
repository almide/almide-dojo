# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => (list.map(x, (y, i) => y + (list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) ?? [])), (i) => list.map(m, (x) => list.get(x, i) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error: Missing ',' between function arguments at line 4:1
  --> /tmp/dojo-matrix-ops-0.almd:4:1
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Add a comma after the previous element. Example: f(a, b, c)
  |
4 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  | ^

1 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
  parse error: Missing ',' between function arguments at line 4:1
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) ?? [])), (i) => list.map(m, (x) => list.get(x, i) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:2:45
  in call to list.map()
  here: list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  |                                             ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[Int], Int) -> List[?7]
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  in call to list.map()
  here: list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  |               ^
error[E025]: cannot infer a concrete type for this expression (type List[?7])
  --> /tmp/dojo-matrix-ops-1.almd:2:29
  in this expression with an unconstrained type
  here: list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(row_a, (x, i) => x + (list.get(list.get(b, list.index_of(a, row_a) ?? 0) ?? [], i) ?? 0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) ?? [])), (i) => list.map(m, (x) => list.get(x, i) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:2:42
  in call to list.map()
  here: list.map(a, (row_a) => list.map(row_a, (x, i) => x + (list.get(list.get(b, list.index_of(a, row_a) ?? 0) ?? [], i) ?? 0)))
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x, i) => x + (list.get(list.get(b, list.index_of(a, row_a) ?? 0) ?? [], i) ?? 0)))
  |                                          ^

1 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) ?? [])), (i) => list.map(m, (x) => list.get(x, i) ?? 0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:2:45
  in call to list.map()
  here: list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  |                                             ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[Int], Int) -> List[?7]
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  in call to list.map()
  here: list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  |               ^
error[E025]: cannot infer a concrete type for this expression (type List[?7])
  --> /tmp/dojo-matrix-ops-3.almd:2:29
  in this expression with an unconstrained type
  here: list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + (list.get(list.get(b, i) ?? [], j) ?? 0)))
  |                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
