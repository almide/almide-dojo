# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(b, (row_b) => row_a + row_b))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m))) |> (i) =>
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:39
  in call to list.len()
  hint: Fix the argument type
  |
6 |     list.range(0, list.len(list.first(m))) |> (i) =>
  |                                       ^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-0.almd:13:67
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
13 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
   |                                                                   ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:2:57
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(b, (row_b) => row_a + row_b))
  |                                                         ^^^^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |     list.range(0, list.len(list.first(m))) |> (i) =>
  |                                       ^
error[E001]: type mismatch in pipe call: expected fn(Int) -> List[Int] but got fn(List[Int]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:7:65
  in pipe call
  hint: Fix the expression type or change the expected type
  |
7 |       list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
  |                                                                 ^

5 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(b, (row_b) => row_a + row_b))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m))) |> (i) =>
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)) |> list.map(list.to_list)

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:6:39
  in call to list.len()
  hint: Fix the argument type
  |
6 |     list.range(0, list.len(list.first(m))) |> (i) =>
  |                                       ^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-matrix-ops-1.almd:7:81
  in variable list
  hint: Check the variable name
  |
7 |       list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)) |> list.map(list.to_list)
  |                                                                                 ^^^^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-1.almd:13:67
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
13 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
   |                                                                   ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:2:57
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(b, (row_b) => row_a + row_b))
  |                                                         ^^^^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:6:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |     list.range(0, list.len(list.first(m))) |> (i) =>
  |                                       ^
error[E001]: type mismatch in pipe call: expected fn(Int) -> List[?7] but got fn(List[Int]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:7:81
  in pipe call
  hint: Fix the expression type or change the expected type
  |
7 |       list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)) |> list.map(list.to_list)
  |                                                                                 ^^^^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(b, (row_b) => row_a + row_b))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m))) |> (i) =>
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)) |> list.map(list.to_list)

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:6:39
  in call to list.len()
  hint: Fix the argument type
  |
6 |     list.range(0, list.len(list.first(m))) |> (i) =>
  |                                       ^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-matrix-ops-2.almd:7:81
  in variable list
  hint: Check the variable name
  |
7 |       list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)) |> list.map(list.to_list)
  |                                                                                 ^^^^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-2.almd:13:67
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
13 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
   |                                                                   ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:2:57
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(b, (row_b) => row_a + row_b))
  |                                                         ^^^^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:6:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |     list.range(0, list.len(list.first(m))) |> (i) =>
  |                                       ^
error[E001]: type mismatch in pipe call: expected fn(Int) -> List[?7] but got fn(List[Int]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:7:81
  in pipe call
  hint: Fix the expression type or change the expected type
  |
7 |       list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)) |> list.map(list.to_list)
  |                                                                                 ^^^^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(b, (row_b) => row_a + row_b))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m))) |> (i) =>
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)) |> list.map(list.to_list)

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:6:39
  in call to list.len()
  hint: Fix the argument type
  |
6 |     list.range(0, list.len(list.first(m))) |> (i) =>
  |                                       ^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-matrix-ops-3.almd:7:81
  in variable list
  hint: Check the variable name
  |
7 |       list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)) |> list.map(list.to_list)
  |                                                                                 ^^^^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-3.almd:13:67
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
13 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
   |                                                                   ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:2:57
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(b, (row_b) => row_a + row_b))
  |                                                         ^^^^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:6:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |     list.range(0, list.len(list.first(m))) |> (i) =>
  |                                       ^
error[E001]: type mismatch in pipe call: expected fn(Int) -> List[?7] but got fn(List[Int]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:7:81
  in pipe call
  hint: Fix the expression type or change the expected type
  |
7 |       list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)) |> list.map(list.to_list)
  |                                                                                 ^^^^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
