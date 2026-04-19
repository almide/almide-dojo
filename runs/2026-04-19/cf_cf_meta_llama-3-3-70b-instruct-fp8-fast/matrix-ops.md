# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row) => 
    list.map(row, (val, i) => 
      val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (col) => 
    list.map(m, (row) => list.get(row, col) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (val) => val * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:81
  in call to list.get()
  hint: Fix the argument type
  |
4 |       val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                 ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-0.almd:4:81
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                 ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:104
  in call to list.map()
  hint: Fix the argument type
  |
4 |       val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                                        ^
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-0.almd:18:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
18 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:81
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |       val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                 ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:104
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                                        ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => 
    list.map(list.zip(pair.0, pair.1), (pair) => pair.0 + pair.1)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (col) => 
    list.map(m, (row) => list.get(row, col) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (val) => val * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-1.almd:17:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
17 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^

1 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(list.zip(row_a, list.get(b, list.len(a) - list.len(a) + list.index_of(a, row_a) |> option.unwrap_or(0)), (pair) => pair.0 + pair.1)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (col) => 
    list.map(m, (row) => list.get(row, col) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (val) => val * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Missing ',' between function arguments at line 6:1
  --> /tmp/dojo-matrix-ops-2.almd:6:1
  hint: Add a comma after the previous element. Example: f(a, b, c)
  |
6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  | ^
error: Expected expression at line 17:41 (got Newline '')
  --> /tmp/dojo-matrix-ops-2.almd:17:41
   |
17 |   list.fold(list.zip(row_a, col_b), 0, (
   |                                         ^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(list.zip(row_a, list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), (pair) => pair.0 + pair.1)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (col) => 
    list.map(m, (row) => list.get(row, col) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (val) => val * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Missing ',' between function arguments at line 6:1
  --> /tmp/dojo-matrix-ops-3.almd:6:1
  hint: Add a comma after the previous element. Example: f(a, b, c)
  |
6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  | ^
error: Expected ')' to close function call opened at line 17:12
  --> /tmp/dojo-matrix-ops-3.almd:19:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0
   |            --------------- '(' opened here
...
19 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
