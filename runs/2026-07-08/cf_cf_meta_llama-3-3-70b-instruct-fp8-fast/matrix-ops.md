# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => list.map(x, (y) => y.0 + y.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => 
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
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:51
  in call to list.len()
  hint: Fix the argument type
  |
6 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-0.almd:2:60
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(list.zip(a, b), (x) => list.map(x, (y) => y.0 + y.1))
  |                                                            ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                   ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), (row_b) => 
      row_a + row_b))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m)) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:4:15
  in call to list.map()
  hint: Fix the argument type
  |
4 |       row_a + row_b))
  |               ^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:8:36
  in call to list.is_empty()
  hint: Fix the argument type
  |
8 |   else if list.is_empty(list.first(m)) then []
  |                                    ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:9:51
  in call to list.len()
  hint: Fix the argument type
  |
9 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                   ^
error[E001]: type mismatch in call to list.map(): expected List[?1] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:4:15
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       row_a + row_b))
  |               ^^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:4:15
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
4 |       row_a + row_b))
  |               ^^^^^
error[E001]: type mismatch in call to list.is_empty(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:8:36
  in call to list.is_empty()
  hint: Fix the expression type or change the expected type
  |
8 |   else if list.is_empty(list.first(m)) then []
  |                                    ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:9:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
9 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                   ^

7 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => 
    list.map(list.zip(x.0, x.1), (y) => y.0 + y.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```
