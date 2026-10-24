# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => {
      list.map(m, (row) => {
        list.get(row, col) |> option.unwrap_or(0)
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:6:21
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |     )
   | -------------------------- fn list.get() defined here
...
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                     ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-0.almd:6:53
  in operator +
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Use + with numeric types, String, or List
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:15:26
  in call to list.len()
  here: let ncols = list.len(list.first(m))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |     let ncols = list.len(list.first(m))
   | -------------------------- fn list.len() defined here
   |
15 |     let ncols = list.len(list.first(m))
   |                          ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:34:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |     )
   | -------------------------- fn list.get() defined here
...
34 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:6:49
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:6:53
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^

6 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  }) |> list.map
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.map(list.range(0, ncols), (col) => {
      list.map(m, (row) => {
        list.get(row, col) |> option.unwrap_or(0)
      })
    }) |> list.map
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:6:21
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |     ) |> list.map
   | -------------------------- fn list.get() defined here
...
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                     ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:6:53
  in operator +
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Use + with numeric types, String, or List
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-1.almd:6:53
  in call to list.map()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:15:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   | -------------------------- fn list.len() defined here
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-1.almd:15:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-1.almd:20:33
  in call to list.map()
  here: list.get(row, col) ?? 0
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
   |
20 |           list.get(row, col) ?? 0
   |                                 ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:34:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |     ) |> list.map
   | -------------------------- fn list.get() defined here
...
34 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:6:49
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                 ^

8 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    }) |> list.map
  }) |> list.map
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.map(list.range(0, ncols), (col) => {
      list.map(m, (row) => {
        list.get(row, col) |> option.unwrap_or(0)
      }) |> list.map
    }) |> list.map
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0)))
}
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:6:21
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |     ) |> list.map
   | -------------------------- fn list.get() defined here
...
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                     ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:6:53
  in operator +
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Use + with numeric types, String, or List
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-2.almd:6:53
  in call to list.map()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-2.almd:6:53
  in call to list.map()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:15:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   | -------------------------- fn list.len() defined here
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:15:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-2.almd:20:33
  in call to list.map()
  here: list.get(row, col) ?? 0
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
   |
20 |           list.get(row, col) ?? 0
   |                                 ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-2.almd:20:33
  in call to list.map()
  here: list.get(row, col) ?? 0
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
   |
20 |           list.get(row, col) ?? 0
   |                                 ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:34:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(row_a, x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |     ) |> list.map
   | -------------------------- fn list.get() defined here
...
34 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(row_a, x)) ?? 0))
   |                                                              ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:6:49
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                 ^
error[E025]: cannot infer a concrete type for this expression (type List[List[?4]])
  --> /tmp/dojo-matrix-ops-2.almd:2:11
  in this expression with an unconstrained type
  here: list.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |   list.map(
  |           ^
error[E025]: cannot infer a concrete type for this expression (type List[List[?12]])
  --> /tmp/dojo-matrix-ops-2.almd:16:13
  in this expression with an unconstrained type
  here: list.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |     list.map(
   |             ^

12 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    }) |> list.map
  }) |> list.map
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.map(list.range(0, ncols), (col) => {
      list.map(m, (row) => {
        list.get(row, col) |> option.unwrap_or(0)
      }) |> list.map
    }) |> list.map
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0)))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      let idx = list.index_of(a, row_a)
      if idx.is_some() then {
        let row_b = list.get(b, idx.unwrap())
        list.map(row_b, (y) => x + y)
      } else {
        list.map(row_a, (y) => x + y)
      }
    }) |> list.map
  }) |> list.map
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.map(list.range(0, ncols), (col) => {
      list.map(m, (row) => {
        list.get(row, col) |> option.unwrap_or(0)
      }) |> list.map
    }) |> list.map
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0)))
}
```

**Diagnostic:**

```
error[E012]: duplicate function 'mat_add'
  at line 37
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------- first definition of 'mat_add' here
...
37 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 57
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
12 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------------- first definition of 'mat_transpose' here
...
57 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 72
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
27 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ------------------------------------ first definition of 'mat_scale' here
...
72 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 78
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
33 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   | -------------------------------------- first definition of 'mat_dot_row' here
...
78 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:6:21
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |     ) |> list.map
   | -------------------------- fn list.get() defined here
...
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                     ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:6:53
  in operator +
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Use + with numeric types, String, or List
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-3.almd:6:53
  in call to list.map()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-3.almd:6:53
  in call to list.map()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:15:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   | -------------------------- fn list.len() defined here
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:15:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-3.almd:20:33
  in call to list.map()
  here: list.get(row, col) ?? 0
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
   |
20 |           list.get(row, col) ?? 0
   |                                 ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-3.almd:20:33
  in call to list.map()
  here: list.get(row, col) ?? 0
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
   |
20 |           list.get(row, col) ?? 0
   |                                 ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:34:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(row_a, x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |     ) |> list.map
   | -------------------------- fn list.get() defined here
...
34 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(row_a, x)) ?? 0))
   |                                                              ^^^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-matrix-ops-3.almd:46:37
  in method call .unwrap()
  here: let row_b = list.get(b, idx.unwrap())
  hint: Almide doesn't use method-call syntax. Write `option.unwrap_or(x)` (or `x |> option.unwrap_or`). Method syntax `x.unwrap()` is not supported.
  try:
      option.unwrap_or(idx)
   |
46 |             let row_b = list.get(b, idx.unwrap())
   |                                     ^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:47:22
  in call to list.map()
  here: list.map(row_b, (y) => x + y)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
132 |       [2, 5],
    | -------------------------- fn list.map() defined here
...
47 |             list.map(row_b, (y) => x + y)
   |                      ^^^^^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-3.almd:49:40
  in call to list.map()
  here: list.map(row_a, (y) => x + y)
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
   |
49 |             list.map(row_a, (y) => x + y)
   |                                        ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-3.almd:49:40
  in call to list.map()
  here: list.map(row_a, (y) => x + y)
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
   |
49 |             list.map(row_a, (y) => x + y)
   |                                        ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:60:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   | -------------------------- fn list.len() defined here
...
60 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:60:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
60 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-3.almd:65:33
  in call to list.map()
  here: list.get(row, col) ?? 0
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
   |
65 |           list.get(row, col) ?? 0
   |                                 ^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-3.almd:65:33
  in call to list.map()
  here: list.get(row, col) ?? 0
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
   |
65 |           list.get(row, col) ?? 0
   |                                 ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:79:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(row_a, x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |     ) |> list.map
   | -------------------------- fn list.get() defined here
...
79 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(row_a, x)) ?? 0))
   |                                                              ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:6:49
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                 ^
error[E025]: cannot infer a concrete type for this expression (type List[List[?4]])
  --> /tmp/dojo-matrix-ops-3.almd:2:11
  in this expression with an unconstrained type
  here: list.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
2 |   list.map(
  |           ^
error[E025]: cannot infer a concrete type for this expression (type List[List[?12]])
  --> /tmp/dojo-matrix-ops-3.almd:16:13
  in this expression with an unconstrained type
  here: list.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |     list.map(
   |             ^
error[E025]: cannot infer a concrete type for this expression (type List[List[?29]])
  --> /tmp/dojo-matrix-ops-3.almd:38:11
  in this expression with an unconstrained type
  here: list.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
38 |   list.map(
   |           ^
error[E025]: cannot infer a concrete type for this expression (type List[List[?37]])
  --> /tmp/dojo-matrix-ops-3.almd:61:13
  in this expression with an unconstrained type
  here: list.map(
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[List[Int]] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
61 |     list.map(
   |             ^

27 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
