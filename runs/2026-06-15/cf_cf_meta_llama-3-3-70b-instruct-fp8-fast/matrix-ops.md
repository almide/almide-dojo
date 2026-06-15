# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (x) => 
    list.map(x, (i, idx) => 
      i + list.get(list.get(b, idx) |> option.unwrap_or([]), idx) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (col_idx) => 
    list.map(m, (row) => 
      list.get(row, col_idx) |> option.unwrap_or(0)
    )
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:62
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), idx) |> option.unwrap_or(0)
  |                                                              ^^^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:87
  in call to list.map()
  hint: Fix the argument type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), idx) |> option.unwrap_or(0)
  |                                                                                       ^
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-0.almd:22:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
22 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:87
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), idx) |> option.unwrap_or(0)
  |                                                                                       ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a, idx) => 
    list.map(row_a, (i) => 
      i + list.get(list.get(b, idx) |> option.unwrap_or([]), list.get(list.get(a, idx) |> option.unwrap_or([]), list.index_of(row_a, i) |> option.unwrap_or(0)) |> option.unwrap_or(0)) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] 
  else 
    list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 24:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:24:1
   |
24 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:4:181
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), list.get(list.get(a, idx) |> option.unwrap_or([]), list.index_of(row_a, i) |> option.unwrap_or(0)) |> option.unwrap_or(0)) |> option.unwrap_or(0)
  |                                                                                                                                                                                     ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[Option[Int]], Int) -> List[Int]
  --> /tmp/dojo-matrix-ops-1.almd:4:205
  in call to list.map()
  hint: Fix the argument type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), list.get(list.get(a, idx) |> option.unwrap_or([]), list.index_of(row_a, i) |> option.unwrap_or(0)) |> option.unwrap_or(0)) |> option.unwrap_or(0)
  |                                                                                                                                                                                                             ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[Option[Int]], Int) -> List[Int]
  --> /tmp/dojo-matrix-ops-1.almd:4:205
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), list.get(list.get(a, idx) |> option.unwrap_or([]), list.index_of(row_a, i) |> option.unwrap_or(0)) |> option.unwrap_or(0)) |> option.unwrap_or(0)
  |                                                                                                                                                                                                             ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a, idx) => 
    list.map(row_a, (i, i_idx) => 
      i + list.get(list.get(b, idx) |> option.unwrap_or([]), i_idx) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] 
  else 
    list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, (acc, x, idx) => 
    acc + x * list.get(col_b, idx)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected ')' to close function call opened at line 23:12
  --> /tmp/dojo-matrix-ops-2.almd:26:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
23 |   list.fold(row_a, 0, (acc, x, idx) =>
   |            --------------- '(' opened here
...
26 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:62
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), i_idx) |> option.unwrap_or(0)
  |                                                              ^^^^^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:4:89
  in call to list.map()
  hint: Fix the argument type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), i_idx) |> option.unwrap_or(0)
  |                                                                                         ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-2.almd:4:89
  in call to list.map()
  hint: Fix the argument type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), i_idx) |> option.unwrap_or(0)
  |                                                                                         ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:4:89
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), i_idx) |> option.unwrap_or(0)
  |                                                                                         ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-2.almd:4:89
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), i_idx) |> option.unwrap_or(0)
  |                                                                                         ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-3.almd:3:71
  in call to mat_add()
  hint: Check the function name
  |
3 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
  |                                                                       ^
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-3.almd:4:49
  in call to mat_add()
  hint: Check the function name
  |
4 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
  |                                                 ^
error[E002]: undefined function 'mat_add'
  --> /tmp/dojo-matrix-ops-3.almd:5:73
  in call to mat_add()
  hint: Check the function name
  |
5 | test "mat_add zeros" { assert_eq(mat_add([[0, 0], [0, 0]], [[1, 2], [3, 4]]), [[1, 2], [3, 4]]) }
  |                                                                         ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-3.almd:6:71
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
6 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
  |                                                                       ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-3.almd:7:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
7 | test "mat_transpose 1x1" { assert_eq(mat_transpose([[5]]), [[5]]) }
  |                                                      ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-3.almd:8:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
  try:
      // mat_transpose(...)  →  matrix.transpose(...)
      matrix.transpose(...)
  |
8 | test "mat_transpose empty" { assert_eq(mat_transpose([]), []) }
  |                                                      ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-3.almd:9:62
  in call to mat_scale()
  hint: Check the function name
  |
9 | test "mat_scale 2x2" { assert_eq(mat_scale([[1, 2], [3, 4]], 3), [[3, 6], [9, 12]]) }
  |                                                              ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-3.almd:10:63
  in call to mat_scale()
  hint: Check the function name
   |
10 | test "mat_scale by 0" { assert_eq(mat_scale([[1, 2], [3, 4]], 0), [[0, 0], [0, 0]]) }
   |                                                               ^
error[E002]: undefined function 'mat_scale'
  --> /tmp/dojo-matrix-ops-3.almd:11:55
  in call to mat_scale()
  hint: Check the function name
   |
11 | test "mat_scale by 1" { assert_eq(mat_scale([[5, 6]], 1), [[5, 6]]) }
   |                                                       ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:12:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
12 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:13:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
13 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:14:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
14 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
