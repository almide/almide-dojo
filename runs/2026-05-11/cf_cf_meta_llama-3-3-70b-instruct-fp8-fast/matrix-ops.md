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
  list.map(a, (x) => 
    list.map(x, (i) => 
      i + list.get(list.first(b) |> option.unwrap_or([]), list.index_of(a |> list.first |> option.unwrap_or([]), i) |> option.unwrap_or(0)) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (i) => i * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected ')' to close function call opened at line 18:12
  --> /tmp/dojo-matrix-ops-0.almd:20:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
18 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc
   |            --------------- '(' opened here
...
20 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:137
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       i + list.get(list.first(b) |> option.unwrap_or([]), list.index_of(a |> list.first |> option.unwrap_or([]), i) |> option.unwrap_or(0)) |> option.unwrap_or(0)
  |                                                                                                                                         ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:4:161
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
4 |       i + list.get(list.first(b) |> option.unwrap_or([]), list.index_of(a |> list.first |> option.unwrap_or([]), i) |> option.unwrap_or(0)) |> option.unwrap_or(0)
  |                                                                                                                                                                 ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:4:161
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
4 |       i + list.get(list.first(b) |> option.unwrap_or([]), list.index_of(a |> list.first |> option.unwrap_or([]), i) |> option.unwrap_or(0)) |> option.unwrap_or(0)
  |                                                                                                                                                                 ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pairs) => 
    list.map(pairs, (pair) => 
      pair.0 + pair.1
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (i) => i * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E005]: argument 'f' expects fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-1.almd:4:16
  in call to list.map()
  hint: Fix the argument type
  |
4 |       pair.0 + pair.1
  |                ^^^^
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-1.almd:18:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
18 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-1.almd:4:16
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       pair.0 + pair.1
  |                ^^^^

3 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(b, (row_b) => 
      list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)
    ) |> list.first
  ) |> list.first

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (i) => i * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Option[Option[List[?5]]]
  --> /tmp/dojo-matrix-ops-2.almd:4:59
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
4 |       list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)
  |                                                           ^^^^

1 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(list.first(b), (row_b) => 
      list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)
    ) |> list.first
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (i) => i * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:4:59
  in call to list.map()
  hint: Fix the argument type
  |
4 |       list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)
  |                                                           ^^^^
error[E001]: type mismatch in call to list.map(): expected List[List[B]] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:4:59
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)
  |                                                           ^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[Option[List[?5]]]
  --> /tmp/dojo-matrix-ops-3.almd:4:59
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
4 |       list.map(list.zip(row_a, row_b), (pair) => pair.0 + pair.1)
  |                                                           ^^^^

3 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
