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
      x + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) 
        |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
                (col) => 
                  list.map(m, (row) => 
                    list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:79
  in call to list.get()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i)
  |                                                                               ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-0.almd:4:79
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       x + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i)
  |                                                                               ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:5:29
  in call to list.map()
  hint: Fix the argument type
  |
5 |         |> option.unwrap_or(0)))
  |                             ^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-0.almd:18:67
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
18 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
   |                                                                   ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:79
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i)
  |                                                                               ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:5:29
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |         |> option.unwrap_or(0)))
  |                             ^

6 error(s) found
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
      x + list.get(list.get(b, i) |> option.unwrap_or([]), j) 
        |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
                (col) => 
                  list.map(m, (row) => 
                    list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 21:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:21:1
   |
21 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:4:60
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j)
  |                                                            ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:5:29
  in call to list.map()
  hint: Fix the argument type
  |
5 |         |> option.unwrap_or(0)))
  |                             ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-1.almd:5:29
  in call to list.map()
  hint: Fix the argument type
  |
5 |         |> option.unwrap_or(0)))
  |                             ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:5:29
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |         |> option.unwrap_or(0)))
  |                             ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-1.almd:5:29
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |         |> option.unwrap_or(0)))
  |                             ^

6 error(s) found
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
      x + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) 
        |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
                (col) => 
                  list.map(m, (row) => 
                    list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected ')' to close function call opened at line 19:12
  --> /tmp/dojo-matrix-ops-2.almd:21:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
19 |   list.fold(list.zip(row_a, col_b), 0
   |            --------------- '(' opened here
...
21 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:104
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       x + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i)
  |                                                                                                        ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:5:29
  in call to list.map()
  hint: Fix the argument type
  |
5 |         |> option.unwrap_or(0)))
  |                             ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:5:29
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |         |> option.unwrap_or(0)))
  |                             ^

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
      x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
                (col) => 
                  list.map(m, (row) => 
                    list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc +
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 20:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-3.almd:20:1
   |
20 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:60
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                            ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
