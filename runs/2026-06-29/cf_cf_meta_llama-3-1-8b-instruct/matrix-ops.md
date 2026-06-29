# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(
    a,
    (row_a) =>
      list.map(
        row_a,
        (x) =>
          list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
      )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m)))
      |> list.map(
        (col_idx) =>
          list.map(
            m,
            (row) =>
              list.get(row, col_idx) |> option.unwrap_or(0)
          )
      )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(
    m,
    (row) =>
      list.map(
        row,
        (x) => x * s
      )
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(
    row_a,
    0,
    (acc, x) => acc + x * list.get(col_b, list.index_of
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected ')' to close function call opened at line 38:35
  --> /tmp/dojo-matrix-ops-0.almd:40:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
38 |     (acc, x) => acc + x * list.get(col_b, list.index_of
   |                                   --------------- '(' opened here
...
40 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:8:44
  in call to list.get()
  hint: Fix the argument type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:14:39
  in call to list.len()
  hint: Fix the argument type
   |
14 |     list.range(0, list.len(list.first(m)))
   |                                       ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:8:44
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                            ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:8:68
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:8:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                         ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:14:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
14 |     list.range(0, list.len(list.first(m)))
   |                                       ^

7 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(
    a,
    (row_a) =>
      list.map(
        row_a,
        (x) =>
          list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
      )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m)))
      |> list.map(
        (col_idx) =>
          list.map(
            m,
            (row) =>
              list.get(row, col_idx) |> option.unwrap_or(0)
          )
      )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(
    m,
    (row) =>
      list.map(
        row,
        (x) => x * s
      )
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(
    row_a,
    0,
    (acc, x) => acc + x * list.get(col_b, list.index_of
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected ')' to close function call opened at line 38:35
  --> /tmp/dojo-matrix-ops-1.almd:40:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
38 |     (acc, x) => acc + x * list.get(col_b, list.index_of
   |                                   --------------- '(' opened here
...
40 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:8:44
  in call to list.get()
  hint: Fix the argument type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:14:39
  in call to list.len()
  hint: Fix the argument type
   |
14 |     list.range(0, list.len(list.first(m)))
   |                                       ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:8:44
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                            ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:8:68
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:8:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                         ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:14:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
14 |     list.range(0, list.len(list.first(m)))
   |                                       ^

7 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(
    a,
    (row_a) =>
      list.map(
        row_a,
        (x) =>
          list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
      )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m)))
      |> list.map(
        (col_idx) =>
          list.map(
            m,
            (row) =>
              list.get(row, col_idx) |> option.unwrap_or(0)
          )
      )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(
    m,
    (row) =>
      list.map(
        row,
        (x) => x * s
      )
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(
    row_a,
    0,
    (acc, x) => acc + x * list.get(col_b, list.index_of
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected ')' to close function call opened at line 38:35
  --> /tmp/dojo-matrix-ops-2.almd:40:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
38 |     (acc, x) => acc + x * list.get(col_b, list.index_of
   |                                   --------------- '(' opened here
...
40 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:8:44
  in call to list.get()
  hint: Fix the argument type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:14:39
  in call to list.len()
  hint: Fix the argument type
   |
14 |     list.range(0, list.len(list.first(m)))
   |                                       ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:8:44
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                            ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:8:68
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:8:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                         ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:14:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
14 |     list.range(0, list.len(list.first(m)))
   |                                       ^

7 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(
    a,
    (row_a) =>
      list.map(
        row_a,
        (x) =>
          list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
      )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m)))
      |> list.map(
        (col_idx) =>
          list.map(
            m,
            (row) =>
              list.get(row, col_idx) |> option.unwrap_or(0)
          )
      )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(
    m,
    (row) =>
      list.map(
        row,
        (x) => x * s
      )
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(
    row_a,
    0,
    (acc, x) => acc + x * list.get(col_b, list.index_of
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected ')' to close function call opened at line 38:35
  --> /tmp/dojo-matrix-ops-3.almd:40:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
38 |     (acc, x) => acc + x * list.get(col_b, list.index_of
   |                                   --------------- '(' opened here
...
40 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:8:44
  in call to list.get()
  hint: Fix the argument type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:14:39
  in call to list.len()
  hint: Fix the argument type
   |
14 |     list.range(0, list.len(list.first(m)))
   |                                       ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:8:44
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                            ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:8:68
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:8:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
8 |           list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                         ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:14:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
14 |     list.range(0, list.len(list.first(m)))
   |                                       ^

7 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
