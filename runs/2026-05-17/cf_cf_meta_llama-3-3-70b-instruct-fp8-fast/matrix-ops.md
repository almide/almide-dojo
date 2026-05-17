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
    list.map(row, (x, i) => 
      x + list.get(list.get(b, list.get_or(list.range(0, list.len(a)), list.index_of(a, row), 0)), i) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => 
    list.map(m, (row) => 
      list.get(row, i) |> option.unwrap_or(0)
    )
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected ')' to close function call opened at line 22:12
  --> /tmp/dojo-matrix-ops-0.almd:24:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
22 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc
   |            --------------- '(' opened here
...
24 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:95
  in call to list.get_or()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, list.get_or(list.range(0, list.len(a)), list.index_of(a, row), 0)), i) |> option.unwrap_or(0)
  |                                                                                               ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:100
  in call to list.get()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, list.get_or(list.range(0, list.len(a)), list.index_of(a, row), 0)), i) |> option.unwrap_or(0)
  |                                                                                                    ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-0.almd:4:100
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       x + list.get(list.get(b, list.get_or(list.range(0, list.len(a)), list.index_of(a, row), 0)), i) |> option.unwrap_or(0)
  |                                                                                                    ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:123
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, list.get_or(list.range(0, list.len(a)), list.index_of(a, row), 0)), i) |> option.unwrap_or(0)
  |                                                                                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:10:51
  in call to list.len()
  hint: Fix the argument type
   |
10 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
   |                                                   ^
error[E001]: type mismatch in call to list.get_or(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:95
  in call to list.get_or()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, list.get_or(list.range(0, list.len(a)), list.index_of(a, row), 0)), i) |> option.unwrap_or(0)
  |                                                                                               ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:100
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, list.get_or(list.range(0, list.len(a)), list.index_of(a, row), 0)), i) |> option.unwrap_or(0)
  |                                                                                                    ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:123
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, list.get_or(list.range(0, list.len(a)), list.index_of(a, row), 0)), i) |> option.unwrap_or(0)
  |                                                                                                                           ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:10:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
10 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
   |                                                   ^

10 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row, i) => 
    list.map(row, (x, j) => 
      x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m)) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => 
    list.map(m, (row) => 
      list.get(row, i) |> option.unwrap_or(0)
    )
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x *
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 25:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:25:1
   |
25 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:4:60
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                            ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:10:36
  in call to list.is_empty()
  hint: Fix the argument type
   |
10 |   else if list.is_empty(list.first(m)) then []
   |                                    ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:11:51
  in call to list.len()
  hint: Fix the argument type
   |
11 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
   |                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                   ^
error[E001]: type mismatch in call to list.is_empty(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:10:36
  in call to list.is_empty()
  hint: Fix the expression type or change the expected type
   |
10 |   else if list.is_empty(list.first(m)) then []
   |                                    ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:11:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
11 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
   |                                                   ^

10 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row) => 
    list.map(row, (x, i) => 
      x + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (row) => 
      list.get(row, i) |> option.unwrap_or(0)
    )
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected ')' to close function call opened at line 23:12
  --> /tmp/dojo-matrix-ops-2.almd:25:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
23 |   list.fold(list.zip
   |            --------------- '(' opened here
...
25 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:104
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       x + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                                        ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:4:127
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                                                               ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:4:127
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                                                               ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row, i) => 
    list.map(row, (x, j) => 
      x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (row) => 
      list.get(row, i) |> option.unwrap_or(0)
    )
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 23:41 (got Newline '')
  --> /tmp/dojo-matrix-ops-3.almd:23:41
   |
23 |   list.fold(list.zip(row_a, col_b), 0, (
   |                                         ^
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:60
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                            ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                   ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
