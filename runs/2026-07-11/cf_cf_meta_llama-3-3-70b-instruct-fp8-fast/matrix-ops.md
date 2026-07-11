# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => list.map(x, (y, i) => 
    y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:3:99
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |     y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                   ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:3:122
  in call to list.map()
  hint: Fix the argument type
  |
3 |     y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                          ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:3:122
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                          ^

3 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a, i) => 
    list.map(row_a, (y, j) => 
      y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:4:60
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                            ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^

5 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (y, j) => 
      y + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:106
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       y + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                          ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:4:129
  in call to list.map()
  hint: Fix the argument type
  |
4 |       y + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                                 ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:4:129
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       y + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                                 ^

3 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a, i) => 
    list.map(row_a, (y, j) => 
      y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:60
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                            ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-3.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       y + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^

5 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
