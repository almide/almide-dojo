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
  list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:117
  in call to list.get_or()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:2:124
  in call to list.get_or()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:2:129
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                                 ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-0.almd:2:129
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                                 ^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-0.almd:2:153
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 1
      option.unwrap_or(<o: Option[A]>, <default: A>)
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                                                         ^
error[E005]: argument 'o' expects Option[A] but got List[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:153
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                                                         ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(?1, Int) -> ?5
  --> /tmp/dojo-matrix-ops-0.almd:2:157
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                                                             ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:51
  in call to list.len()
  hint: Fix the argument type
  |
6 |   else list.map(list.range(0, list.len(list.first(m))), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))
  |                                                   ^
error[E001]: type mismatch in call to list.get_or(): expected List[Int] but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:117
  in call to list.get_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                     ^
error[E001]: type mismatch in call to list.get_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:2:124
  in call to list.get_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                            ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:2:129
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                                 ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[A] but got List[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:153
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                                                         ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(?1, Int) -> ?5
  --> /tmp/dojo-matrix-ops-0.almd:2:157
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.get_or(list.index_of(a, x), 0, 0), 0, 0)), i) |> option.unwrap_or([0])[i]))
  |                                                                                                                                                             ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |   else list.map(list.range(0, list.len(list.first(m))), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))
  |                                                   ^

14 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(pair.0, pair.1), (pair) => pair.0 + pair.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:6:51
  in call to list.len()
  hint: Fix the argument type
  |
6 |   else list.map(list.range(0, list.len(list.first(m))), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))
  |                                                   ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:6:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |   else list.map(list.range(0, list.len(list.first(m))), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))
  |                                                   ^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), (row_b) => list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:2:159
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), (row_b) => list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)))
  |                                                                                                                                                               ^^^^
error[E001]: type mismatch in call to list.map(): expected List[List[B]] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:2:159
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), (row_b) => list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)))
  |                                                                                                                                                               ^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[?4]]]
  --> /tmp/dojo-matrix-ops-2.almd:2:159
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), (row_b) => list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)))
  |                                                                                                                                                               ^^^^

3 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:2:108
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                            ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:2:131
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-3.almd:2:131
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:2:131
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-3.almd:2:131
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                                   ^

5 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
