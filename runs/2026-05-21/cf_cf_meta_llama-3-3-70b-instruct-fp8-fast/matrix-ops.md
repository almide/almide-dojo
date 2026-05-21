# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(
        list.zip(a, b),
        (x) => list.map(
            x,
            (y) => y.0 + y.1
        )
    )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    if list.is_empty(m) then [] 
    else list.map(
        list.range(0, list.len(m.0)),
        (i) => list.map(
            m,
            (row) => list.get(row, i) |> option.unwrap_or(0)
        )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(
        m,
        (row) => list.map(
            row,
            (x) => x * s
        )
    )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(
        list.zip(row_a, col_b),
        0,
        (acc, x) => acc + x.0 * x.1
    )
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'f' expects fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-0.almd:6:26
  in call to list.map()
  hint: Fix the argument type
  |
6 |             (y) => y.0 + y.1
  |                          ^
error[E001]: type mismatch in call to list.map(): expected fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-0.almd:6:26
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
6 |             (y) => y.0 + y.1
  |                          ^

2 error(s) found
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
        (x, i) => list.map(
            list.zip(x, list.get(b, i) |> option.unwrap_or([])),
            (y) => y.0 + y.1
        )
    )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    if list.is_empty(m) then [] 
    else list.map(
        list.range(0, list.len(m.0)),
        (i) => list.map(
            m,
            (row) => list.get(row, i) |> option.unwrap_or(0)
        )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(
        m,
        (row) => list.map(
            row,
            (x) => x * s
        )
    )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(
        list.zip(row_a, col_b),
        0,
        (acc, x) => acc + x.0 * x.1
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected ')' to close function call opened at line 30:14
  --> /tmp/dojo-matrix-ops-1.almd:35:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     list.fold(
   |              --------------- '(' opened here
...
35 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?5]
  --> /tmp/dojo-matrix-ops-1.almd:6:26
  in call to list.map()
  hint: Fix the argument type
  |
6 |             (y) => y.0 + y.1
  |                          ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?5]
  --> /tmp/dojo-matrix-ops-1.almd:6:26
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
6 |             (y) => y.0 + y.1
  |                          ^

3 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(
        list.zip(a, b),
        (rows) => list.map(
            list.zip(rows.0, rows.1),
            (cells) => cells.0 + cells.1
        )
    )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    if list.is_empty(m) then [] 
    else list.map(
        list.range(0, list.len(list.first(m) |> option.unwrap_or([]))),
        (i) => list.map(
            m,
            (row) => list.get(row, i) |> option.unwrap_or(0)
        )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(
        m,
        (row) => list.map(
            row,
            (x) => x * s
        )
    )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(
        list.zip(row_a, col_b),
        0,
        (acc, x) => acc + x.0 * x.1
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected ')' to close function call opened at line 30:14
  --> /tmp/dojo-matrix-ops-2.almd:35:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     list.fold(
   |              --------------- '(' opened here
...
35 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
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
    list.map(
        list.zip(a, b),
        (rows) => list.map(
            list.zip(rows.0, rows.1),
            (cells) => cells.0 + cells.1
        )
    )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    if list.is_empty(m) then [] 
    else list.map(
        list.range(0, list.len(list.first(m) |> option.unwrap_or([]))),
        (i) => list.map(
            m,
            (row) => list.get(row, i) |> option.unwrap_or(0)
        )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(
        m,
        (row) => list.map(
            row,
            (x) => x * s
        )
    )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(
        list.zip(row_a, col_b),
        0,
        (acc, x) => acc + x.0 * x.1
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected ')' to close function call opened at line 30:14
  --> /tmp/dojo-matrix-ops-3.almd:35:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     list.fold(
   |              --------------- '(' opened here
...
35 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^

1 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
