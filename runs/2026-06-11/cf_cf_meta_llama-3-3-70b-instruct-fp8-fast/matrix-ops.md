# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => list.map(x, (y) => y.0 + y.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(m.first(m))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'f' expects fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-0.almd:2:60
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(list.zip(a, b), (x) => list.map(x, (y) => y.0 + y.1))
  |                                                            ^
error[E004]: list.first() expects 1 argument(s) but got 2
  --> /tmp/dojo-matrix-ops-0.almd:6:40
  in call to list.first()
  hint: Check the number of arguments
  try:
      // list.first() takes 1 arg(s) — you passed 2
      list.first(<xs: List[A]>)
  |
6 |   else list.map(list.range(0, list.len(m.first(m))), (i) =>
  |                                        ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:40
  in call to list.len()
  hint: Fix the argument type
  |
6 |   else list.map(list.range(0, list.len(m.first(m))), (i) =>
  |                                        ^
error[E001]: type mismatch in call to list.map(): expected fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-0.almd:2:60
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(list.zip(a, b), (x) => list.map(x, (y) => y.0 + y.1))
  |                                                            ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:40
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |   else list.map(list.range(0, list.len(m.first(m))), (i) =>
  |                                        ^

5 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), (row_b) => 
    list.map(list.zip(row_a, row_b), (x) => x.0 + x.1)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m)) then []
  else list.map(list.range(0, list.len(list.first(m))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected name at line 15:66 (got Newline '')
  --> /tmp/dojo-matrix-ops-1.almd:15:66
   |
15 |   list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.
   |                                                                  ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:3:51
  in call to list.map()
  hint: Fix the argument type
  |
3 |     list.map(list.zip(row_a, row_b), (x) => x.0 + x.1)))
  |                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:7:36
  in call to list.is_empty()
  hint: Fix the argument type
  |
7 |   else if list.is_empty(list.first(m)) then []
  |                                    ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:8:51
  in call to list.len()
  hint: Fix the argument type
  |
8 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                   ^
error[E001]: type mismatch in call to list.map(): expected List[List[B]] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:3:51
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     list.map(list.zip(row_a, row_b), (x) => x.0 + x.1)))
  |                                                   ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[?4]]]
  --> /tmp/dojo-matrix-ops-1.almd:3:51
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
3 |     list.map(list.zip(row_a, row_b), (x) => x.0 + x.1)))
  |                                                   ^
error[E001]: type mismatch in call to list.is_empty(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:7:36
  in call to list.is_empty()
  hint: Fix the expression type or change the expected type
  |
7 |   else if list.is_empty(list.first(m)) then []
  |                                    ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:8:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
8 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                   ^

8 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), (row_b) => 
    list.map(list.zip(row_a, row_b), (x) => x.0 + x.1)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0,
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 17:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:17:1
   |
17 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(List[B]) -> List[?5]
  --> /tmp/dojo-matrix-ops-2.almd:3:51
  in call to list.map()
  hint: Fix the argument type
  |
3 |     list.map(list.zip(row_a, row_b), (x) => x.0 + x.1)))
  |                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(List[B]) -> List[?5]
  --> /tmp/dojo-matrix-ops-2.almd:3:51
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     list.map(list.zip(row_a, row_b), (x) => x.0 + x.1)))
  |                                                   ^

3 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), (row_b) => 
    list.fold(list.zip(row_a, row_b), 0, (acc, x) => acc + x.0 + x.1)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected ')' to close function call opened at line 15:21
  --> /tmp/dojo-matrix-ops-3.almd:17:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
15 |   list.fold(list.zip(row_a
   |                     --------------- '(' opened here
...
17 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(List[B]) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:3:66
  in call to list.map()
  hint: Fix the argument type
  |
3 |     list.fold(list.zip(row_a, row_b), 0, (acc, x) => acc + x.0 + x.1)))
  |                                                                  ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(List[B]) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:3:66
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     list.fold(list.zip(row_a, row_b), 0, (acc, x) => acc + x.0 + x.1)))
  |                                                                  ^

3 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
