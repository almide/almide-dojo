# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E013`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => (list.map(x, (y, i) => 
    y + (list.get(b, list.index_of(a, x) |> option.unwrap_or(0)) 
      |> option.unwrap_or([]) 
      |> (z) => list.get(z, i) |> option.unwrap_or(0)))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
    (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:5:5
  in call to list.map()
  here: (y, i) => y + (list.get(b, list.index_of(a, x) ?? 0) ?? [] |> (z) => list.get(z, i) ?? 0),
  hint: Fix the argument type
    |
132 | }
    | -------------------------- fn list.map() defined here
...
5 |     (y, i) => y + (list.get(b, list.index_of(a, x) ?? 0) ?? [] |> (z) => list.get(z, i) ?? 0),
  |     ^

1 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x, i) => list.map(x, (y, j) => 
    y + (list.get(b, i) |> option.unwrap_or([]) |> (z) => list.get(z, j) |> option.unwrap_or(0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
    (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

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
  here: (x, i) => list.map(x, (y, j) => y + (list.get(b, i) ?? [] |> (z) => list.get(z, j) ?? 0)),
  hint: Fix the argument type
...
3 |   (x, i) => list.map(x, (y, j) => y + (list.get(b, i) ?? [] |> (z) => list.get(z, j) ?? 0)),
  |                         ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[Int], Int) -> List[?12]
  --> /tmp/dojo-matrix-ops-1.almd:3:3
  in call to list.map()
  here: (x, i) => list.map(x, (y, j) => y + (list.get(b, i) ?? [] |> (z) => list.get(z, j) ?? 0)),
  hint: Fix the argument type
...
3 |   (x, i) => list.map(x, (y, j) => y + (list.get(b, i) ?? [] |> (z) => list.get(z, j) ?? 0)),
  |   ^
error[E025]: cannot infer a concrete type for this expression (type List[?12])
  --> /tmp/dojo-matrix-ops-1.almd:3:13
  in this expression with an unconstrained type
  here: (x, i) => list.map(x, (y, j) => y + (list.get(b, i) ?? [] |> (z) => list.get(z, j) ?? 0)),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (x, i) => list.map(x, (y, j) => y + (list.get(b, i) ?? [] |> (z) => list.get(z, j) ?? 0)),
  |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => list.map(x, (y) => 
    y + (list.get(b, list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]) |> (z) => list.get(z, list.index_of(x, y) |> option.unwrap_or(0)) |> option.unwrap_or(0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
    (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-matrix-ops-2.almd
  test: mat_add zeros
  at:   /tmp/dojo-matrix-ops-2.almd:56
  hint: item 0 differs
  diff: -expected +found
    - [1, 2]
    - [3, 4]
    + [1, 1]
    + [1, 1]

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
    (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E013]: no field '_1' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-3.almd:3:31
  in field access ._1
  here: (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2),
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
3 |   (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2),
  |                               ^^^^
error[E013]: no field '_2' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-3.almd:3:40
  in field access ._2
  here: (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2),
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
3 |   (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2),
  |                                        ^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?2, ?3)])
  --> /tmp/dojo-matrix-ops-3.almd:3:22
  in this expression with an unconstrained type
  here: (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2),
  |                      ^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[Unknown])
  --> /tmp/dojo-matrix-ops-3.almd:3:13
  in this expression with an unconstrained type
  here: (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2),
  |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[List[Unknown]])
  --> /tmp/dojo-matrix-ops-3.almd:1:81
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  |                                                                                 ^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
