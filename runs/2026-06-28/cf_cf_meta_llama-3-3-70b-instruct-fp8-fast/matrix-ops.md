# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip_with(a, b, (x, y) => x + y))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip_with(row_a, col_b, (x, y) => x * y), 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-0.almd:2:46
  in call to list.map()
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
  |
2 |   list.map(list.zip_with(a, b, (x, y) => x + y))
  |                                              ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:51
  in call to list.len()
  hint: Fix the argument type
  |
6 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                   ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                   ^

3 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => 
    list.map(pair, (x) => x.0 + x.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m)) then []
  else list.map(list.range(0, list.len(list.first(m))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip_with(row_a, col_b, (x, y) => x * y), 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E005]: argument 'f' expects fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-1.almd:3:33
  in call to list.map()
  hint: Fix the argument type
  |
3 |     list.map(pair, (x) => x.0 + x.1))
  |                                 ^
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
error[E001]: type mismatch in call to list.map(): expected fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-1.almd:3:33
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     list.map(pair, (x) => x.0 + x.1))
  |                                 ^
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

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => 
    list.map(pair, (x) => x.0 + x.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip_with(row_a, col_b, (x, y) => x * y), 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error[E005]: argument 'f' expects fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-2.almd:3:33
  in call to list.map()
  hint: Fix the argument type
  |
3 |     list.map(pair, (x) => x.0 + x.1))
  |                                 ^
error[E001]: type mismatch in call to list.map(): expected fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-2.almd:3:33
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     list.map(pair, (x) => x.0 + x.1))
  |                                 ^

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
    list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0) |> (x) => x), (row_b) => 
      list.map(list.zip_with(row_a, row_b, (x, y) => (x, y)), (pair) => pair.0 + pair.1)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 17:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-3.almd:17:1
   |
17 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:4:82
  in call to list.map()
  hint: Fix the argument type
  |
4 |       list.map(list.zip_with(row_a, row_b, (x, y) => (x, y)), (pair) => pair.0 + pair.1)))
  |                                                                                  ^^^^
error[E001]: type mismatch in call to list.map(): expected List[List[?5]] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:4:82
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       list.map(list.zip_with(row_a, row_b, (x, y) => (x, y)), (pair) => pair.0 + pair.1)))
  |                                                                                  ^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[?7]]]
  --> /tmp/dojo-matrix-ops-3.almd:4:82
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
4 |       list.map(list.zip_with(row_a, row_b, (x, y) => (x, y)), (pair) => pair.0 + pair.1)))
  |                                                                                  ^^^^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
