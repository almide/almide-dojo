# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E013`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:1:176
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   ])
   | -------------------------- fn list.get() defined here
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  |                                                                                                                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E004]: list.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-0.almd:1:224
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 3
      list.get(<xs: List[A]>, <i: Int>)
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  |                                                                                                                                                                                                                                ^
error[E004]: list.get() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-0.almd:1:230
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 1
      list.get(<xs: List[A]>, <i: Int>)
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  |                                                                                                                                                                                                                                      ^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:1:230
  in operator +
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  hint: Use + with numeric types, String, or List
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  |                                                                                                                                                                                                                                      ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, ?2) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:1:104
  in call to list.map()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  hint: Fix the argument type
    |
105 | test "mat_dot_row empty" {
    | -------------------------- fn list.map() defined here
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  |                                                                                                        ^
error[E001]: type mismatch in ?? fallback: expected Int but got List[?3]
  --> /tmp/dojo-matrix-ops-0.almd:1:220
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  hint: Fix the expression type or change the expected type
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  |                                                                                                                                                                                                                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:1:230
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  hint: Fix the expression type or change the expected type
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  |                                                                                                                                                                                                                                      ^
error[E018]: cannot infer the element type of empty list `[]`
  --> /tmp/dojo-matrix-ops-0.almd:1:220
  in empty list `[]` with no element-type context
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  hint: empty list `[]`'s element type cannot be inferred here. An empty collection carries no element to infer from — bind it with an explicit element type, e.g. `let xs: List[Int] = []`, or annotate the literal inline: `list.len([]: List[Int])`. (Almide follows Rust/Swift: an undecidable empty collection is an error even if its elements are never read; it is never silently defaulted.)
  try:
      let xs: List[Int] = []
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0)) ?? [], i) ?? 0)))
  |                                                                                                                                                                                                                            ^

8 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

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
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                                              ^^^^
error[E013]: no field '_2' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-1.almd:1:135
  in field access ._2
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                                                       ^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?1, ?2)])
  --> /tmp/dojo-matrix-ops-1.almd:1:117
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[Unknown])
  --> /tmp/dojo-matrix-ops-1.almd:1:108
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[List[Unknown]])
  --> /tmp/dojo-matrix-ops-1.almd:1:73
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E013]: no field '_1' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-2.almd:1:126
  in field access ._1
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                                              ^^^^
error[E013]: no field '_2' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-2.almd:1:135
  in field access ._2
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                                                       ^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?1, ?2)])
  --> /tmp/dojo-matrix-ops-2.almd:1:117
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[Unknown])
  --> /tmp/dojo-matrix-ops-2.almd:1:108
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[List[Unknown]])
  --> /tmp/dojo-matrix-ops-2.almd:1:73
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E013]: no field '_1' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-3.almd:1:126
  in field access ._1
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                                              ^^^^
error[E013]: no field '_2' on (List[Int], List[Int]) — the type has no fields
  --> /tmp/dojo-matrix-ops-3.almd:1:135
  in field access ._2
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Almide values outside records have no fields. Use the type's stdlib module functions instead.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                                                       ^^^^
error[E025]: cannot infer a concrete type for this expression (type List[(?1, ?2)])
  --> /tmp/dojo-matrix-ops-3.almd:1:117
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[(Int, Int)] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[Unknown])
  --> /tmp/dojo-matrix-ops-3.almd:1:108
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type List[List[Unknown]])
  --> /tmp/dojo-matrix-ops-3.almd:1:73
  in this expression with an unconstrained type
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (xy) => xy._1 + xy._2))
  |                                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
