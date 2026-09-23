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
  --> /tmp/dojo-matrix-ops-0.almd:1:105
  in call to list.map()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => (list.map(x, (y, i) => y + (list.get(b, list.index_of(a, x) ?? 0) ?? [] |> (z) => list.get(z, i) ?? 0))))
  hint: Fix the argument type
    |
105 | test "mat_dot_row empty" {
    | -------------------------- fn list.map() defined here
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => (list.map(x, (y, i) => y + (list.get(b, list.index_of(a, x) ?? 0) ?? [] |> (z) => list.get(z, i) ?? 0))))
  |                                                                                                         ^

1 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

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
  --> /tmp/dojo-matrix-ops-1.almd:1:126
  in field access ._1
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))
  |                                                                                                                              ^^^^
error[E013]: no field '_2' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-1.almd:1:135
  in field access ._2
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))
  |                                                                                                                                       ^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?1, ?2)])
  --> /tmp/dojo-matrix-ops-1.almd:1:117
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))
  |                                                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[Unknown])
  --> /tmp/dojo-matrix-ops-1.almd:1:108
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))
  |                                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[List[Unknown]])
  --> /tmp/dojo-matrix-ops-1.almd:1:73
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))
  |                                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) |> option.unwrap_or([]), list.last(pair) |> option.unwrap_or([])), (pair) => pair._1 + pair._2))

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
error[E005]: argument 'xs' expects List[A] but got (List[Int], List[Int])
  --> /tmp/dojo-matrix-ops-2.almd:1:137
  in call to list.first()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Fix the argument type
   |
85 |     [0, 0]
   | ---------------------------- fn list.first() defined here
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                                         ^^^^
error[E005]: argument 'xs' expects List[A] but got (List[Int], List[Int])
  --> /tmp/dojo-matrix-ops-2.almd:1:160
  in call to list.last()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Fix the argument type
   |
73 |   ], 3), [
   | --------------------------- fn list.last() defined here
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                                                                ^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-matrix-ops-2.almd:1:146
  in empty list `[]` with no element-type context
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                                                  ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-matrix-ops-2.almd:1:169
  in empty list `[]` with no element-type context
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                                                                         ^
error[E025]: cannot infer a concrete type for this expression (type Option[List[?2]])
  --> /tmp/dojo-matrix-ops-2.almd:1:126
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                              ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[List[?4]])
  --> /tmp/dojo-matrix-ops-2.almd:1:150
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?2, ?4)])
  --> /tmp/dojo-matrix-ops-2.almd:1:117
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[Unknown])
  --> /tmp/dojo-matrix-ops-2.almd:1:108
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[List[Unknown]])
  --> /tmp/dojo-matrix-ops-2.almd:1:73
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) |> option.unwrap_or([]), list.last(pair) |> option.unwrap_or([])), (pair) => pair._1 + pair._2))

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
error[E005]: argument 'xs' expects List[A] but got (List[Int], List[Int])
  --> /tmp/dojo-matrix-ops-3.almd:1:137
  in call to list.first()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Fix the argument type
   |
85 |     [0, 0]
   | ---------------------------- fn list.first() defined here
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                                         ^^^^
error[E005]: argument 'xs' expects List[A] but got (List[Int], List[Int])
  --> /tmp/dojo-matrix-ops-3.almd:1:160
  in call to list.last()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Fix the argument type
   |
73 |   ], 3), [
   | --------------------------- fn list.last() defined here
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                                                                ^^^^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-matrix-ops-3.almd:1:146
  in empty list `[]` with no element-type context
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                                                  ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-matrix-ops-3.almd:1:169
  in empty list `[]` with no element-type context
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                                                                         ^
error[E025]: cannot infer a concrete type for this expression (type Option[List[?2]])
  --> /tmp/dojo-matrix-ops-3.almd:1:126
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                              ^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[List[?4]])
  --> /tmp/dojo-matrix-ops-3.almd:1:150
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                                                      ^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?2, ?4)])
  --> /tmp/dojo-matrix-ops-3.almd:1:117
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[Unknown])
  --> /tmp/dojo-matrix-ops-3.almd:1:108
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[List[Unknown]])
  --> /tmp/dojo-matrix-ops-3.almd:1:73
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(list.first(pair) ?? [], list.last(pair) ?? []), (pair) => pair._1 + pair._2))
  |                                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

9 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
