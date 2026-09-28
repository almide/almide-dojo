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
  list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:3:45
  in call to list.get()
  here: (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) ?? 0), i) ?? 0),
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | test "mat_add 2x2" {
   | -------------------------- fn list.get() defined here
...
3 |   (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) ?? 0), i) ?? 0),
  |                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:3:22
  in call to list.map()
  here: (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) ?? 0), i) ?? 0),
  hint: Fix the argument type
...
3 |   (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) ?? 0), i) ?? 0),
  |                      ^

2 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:3:25
  in call to list.map()
  here: (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  hint: Fix the argument type
...
3 |   (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  |                         ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[Int], Int) -> List[?7]
  --> /tmp/dojo-matrix-ops-1.almd:3:3
  in call to list.map()
  here: (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  hint: Fix the argument type
...
3 |   (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  |   ^
error[E025]: cannot infer a concrete type for this expression (type List[?7])
  --> /tmp/dojo-matrix-ops-1.almd:3:13
  in this expression with an unconstrained type
  here: (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:3:22
  in call to list.map()
  here: (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) ?? -1) ?? [], i) ?? 0),
  hint: Fix the argument type
...
3 |   (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) ?? -1) ?? [], i) ?? 0),
  |                      ^

1 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:3:25
  in call to list.map()
  here: (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  hint: Fix the argument type
...
3 |   (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  |                         ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[Int], Int) -> List[?7]
  --> /tmp/dojo-matrix-ops-3.almd:3:3
  in call to list.map()
  here: (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  hint: Fix the argument type
...
3 |   (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  |   ^
error[E025]: cannot infer a concrete type for this expression (type List[?7])
  --> /tmp/dojo-matrix-ops-3.almd:3:13
  in this expression with an unconstrained type
  here: (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (x, i) => list.map(x, (y, j) => y + list.get(list.get(b, i) ?? [], j) ?? 0),
  |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
