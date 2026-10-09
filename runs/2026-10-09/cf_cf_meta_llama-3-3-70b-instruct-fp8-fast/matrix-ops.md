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
  list.map(a, (x) => list.map(x, (y, i) => 
    y + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_) - 1) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.get(m, 0) |> option.unwrap_or([]) |> list.len(_)), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E046]: placeholder `_` is not valid in a call argument (argument 1 of list.len())
  --> /tmp/dojo-matrix-ops-0.almd:5:73
  in call argument
  here: (y, i) => y + list.get(list.get(b, list.get(a, 0) ?? [] |> list.len(_) - 1) ?? [], i) ?? 0,
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => list.len(x, /* the other arguments */)
  |
5 |     (y, i) => y + list.get(list.get(b, list.get(a, 0) ?? [] |> list.len(_) - 1) ?? [], i) ?? 0,
  |                                                                         ^
error[E004]: list.len() expects 1 argument(s) but got 2
  --> /tmp/dojo-matrix-ops-0.almd:5:73
  in call to list.len()
  here: (y, i) => y + list.get(list.get(b, list.get(a, 0) ?? [] |> list.len(_) - 1) ?? [], i) ?? 0,
  hint: Check the number of arguments
  try:
      // list.len() takes 1 arg(s) — you passed 2
      list.len(<xs: List[A]>)
  |
5 |     (y, i) => y + list.get(list.get(b, list.get(a, 0) ?? [] |> list.len(_) - 1) ?? [], i) ?? 0,
  |                                                                         ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:5:5
  in call to list.map()
  here: (y, i) => y + list.get(list.get(b, list.get(a, 0) ?? [] |> list.len(_) - 1) ?? [], i) ?? 0,
  hint: Fix the argument type
    |
132 | }
    | -------------------------- fn list.map() defined here
...
5 |     (y, i) => y + list.get(list.get(b, list.get(a, 0) ?? [] |> list.len(_) - 1) ?? [], i) ?? 0,
  |     ^
error[E046]: placeholder `_` is not valid in a call argument (argument 1 of list.len())
  --> /tmp/dojo-matrix-ops-0.almd:11:50
  in call argument
  here: list.range(0, list.get(m, 0) ?? [] |> list.len(_)),
  hint: `_` here is a hole with no value — it does NOT partially apply the call. Name the missing value with a lambda instead.
  try:
      (x) => list.len(x, /* the other arguments */)
   |
11 |   list.range(0, list.get(m, 0) ?? [] |> list.len(_)),
   |                                                  ^
error[E004]: list.len() expects 1 argument(s) but got 2
  --> /tmp/dojo-matrix-ops-0.almd:11:50
  in call to list.len()
  here: list.range(0, list.get(m, 0) ?? [] |> list.len(_)),
  hint: Check the number of arguments
  try:
      // list.len() takes 1 arg(s) — you passed 2
      list.len(<xs: List[A]>)
   |
11 |   list.range(0, list.get(m, 0) ?? [] |> list.len(_)),
   |                                                  ^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E013]: no field '_1' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-1.almd:3:28
  in field access ._1
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |                            ^
error[E013]: no field '_2' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-1.almd:3:34
  in field access ._2
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |                                  ^
error[E025]: cannot infer a concrete type for this expression (type List[(?2, ?3)])
  --> /tmp/dojo-matrix-ops-1.almd:3:19
  in this expression with an unconstrained type
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |                   ^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[Unknown])
  --> /tmp/dojo-matrix-ops-1.almd:3:10
  in this expression with an unconstrained type
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[List[Unknown]])
  --> /tmp/dojo-matrix-ops-1.almd:1:81
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  |                                                                                 ^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E013]: no field '_1' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-2.almd:3:28
  in field access ._1
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |                            ^
error[E013]: no field '_2' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-2.almd:3:34
  in field access ._2
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |                                  ^
error[E025]: cannot infer a concrete type for this expression (type List[(?2, ?3)])
  --> /tmp/dojo-matrix-ops-2.almd:3:19
  in this expression with an unconstrained type
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |                   ^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[Unknown])
  --> /tmp/dojo-matrix-ops-2.almd:3:10
  in this expression with an unconstrained type
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[List[Unknown]])
  --> /tmp/dojo-matrix-ops-2.almd:1:81
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  |                                                                                 ^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E013]: no field '_1' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-3.almd:3:28
  in field access ._1
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |                            ^
error[E013]: no field '_2' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-3.almd:3:34
  in field access ._2
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |                                  ^
error[E025]: cannot infer a concrete type for this expression (type List[(?2, ?3)])
  --> /tmp/dojo-matrix-ops-3.almd:3:19
  in this expression with an unconstrained type
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |                   ^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[Unknown])
  --> /tmp/dojo-matrix-ops-3.almd:3:10
  in this expression with an unconstrained type
  here: (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2),
  |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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
