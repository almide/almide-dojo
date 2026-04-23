# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) =>
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.map(list.range(0, list.len(row_a)), (i) => list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected ')' to close function call opened at line 13:21
  --> /tmp/dojo-matrix-ops-0.almd:15:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
13 |   list.fold(list.map(list.range(0, list.len(row_a)), (i) => list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap
   |                     --------------- '(' opened here
...
15 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:2:134
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                      ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-0.almd:2:134
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                      ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:2:157
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                                             ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:2:134
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                      ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:2:157
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                                             ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(list.range(0, list.len(a)), (i) =>
    list.map(list.range(0, list.len(list.first(a) |> option.unwrap_or([]))), (j) =>
      list.get(list.get(a, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0) +
      list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) =>
    list.map(m, (row) =>
      list.get(row, i) |> option.unwrap_or(0)
    )
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.map(list
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected ')' to close function call opened at line 21:21
  --> /tmp/dojo-matrix-ops-1.almd:23:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
21 |   list.fold(list.map(list
   |                     --------------- '(' opened here
...
23 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:5:56
  in operator +
  hint: Use + with numeric types, String, or List
  |
5 |       list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                        ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:5:79
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
5 |       list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                               ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:5:79
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
5 |       list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                               ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(list.range(0, list.len(a)), (i) =>
    list.map(list.range(0, list.len(list.first(a) |> option.unwrap_or([]))), (j) =>
      (list.get(list.get(a, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)) +
      (list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0))
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) =>
    list.map(m, (row) =>
      list.get(row, i) |> option.unwrap_or(0)
    )
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected ')' to close function call opened at line 21:12
  --> /tmp/dojo-matrix-ops-2.almd:23:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
21 |   list.fold(list
   |            --------------- '(' opened here
...
23 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(list.range(0, list.len(a)), (i) =>
    list.map(list.range(0, list.len(list.first(a) |> option.unwrap_or([]))), (j) =>
      (list.get(list.get(a, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)) +
      (list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0))
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) =>
    list.map(m, (row) =>
      list.get(row, i) |> option.unwrap_or(0)
    )
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected ')' to close function call opened at line 21:12
  --> /tmp/dojo-matrix-ops-3.almd:23:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
21 |   list.fold(row
   |            --------------- '(' opened here
...
23 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
