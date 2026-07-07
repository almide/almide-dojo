# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    if list.is_empty(m) then []
    else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
        list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:107
  in call to list.get_or()
  hint: Fix the argument type
  |
2 |     list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                           ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:136
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |     list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                        ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:2:159
  in call to list.map()
  hint: Fix the argument type
  |
2 |     list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                               ^
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-0.almd:13:69
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
13 |     list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                     ^
error[E001]: type mismatch in call to list.get_or(): expected List[Int] but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:107
  in call to list.get_or()
  hint: Fix the expression type or change the expected type
  |
2 |     list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                           ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:2:159
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |     list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                               ^

6 error(s) found
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
    else if list.is_empty(list.first(m) |> option.unwrap_or([])) then []
    else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
        list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-1.almd:14:69
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
14 |     list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                     ^

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
        list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0) |> (x) => x), (row_b) => 
            list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    if list.is_empty(m) then []
    else if list.is_empty(list.first(m) |> option.unwrap_or([])) then []
    else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
        list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b),
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 18:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:18:1
   |
18 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:4:65
  in call to list.map()
  hint: Fix the argument type
  |
4 |             list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)))
  |                                                                 ^^^^
error[E001]: type mismatch in call to list.map(): expected List[List[B]] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:4:65
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |             list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)))
  |                                                                 ^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[?6]]]
  --> /tmp/dojo-matrix-ops-2.almd:4:65
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
4 |             list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)))
  |                                                                 ^^^^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(list.zip(a, b), (pair) => 
        list.map(list.zip(pair.0, pair.1), (pair) => pair.0 + pair.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    if list.is_empty(m) then []
    else if list.is_empty(list.first(m) |> option.unwrap_or([])) then []
    else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
        list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```
