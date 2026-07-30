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
    list.map(x, (i, idx) => 
      i + list.get(list.get(b, idx) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
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
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:62
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                              ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:4:85
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                     ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:85
  in call to list.map()
  hint: Fix the argument type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                     ^
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
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:4:85
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                     ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:85
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       i + list.get(list.get(b, idx) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                     ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => 
    list.map(list.zip(x._1, x._2), (y) => y._1 + y._2)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (i) => i * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-1.almd:17:67
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
17 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
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
  list.map(a, (x, i) => 
    list.map(list.zip(x, list.get(b, i) |> option.unwrap_or([])), (y) => y._1 + y._2)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (i) => i * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x._1 * x._2)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?5]
  --> /tmp/dojo-matrix-ops-2.almd:3:81
  in call to list.map()
  hint: Fix the argument type
  |
3 |     list.map(list.zip(x, list.get(b, i) |> option.unwrap_or([])), (y) => y._1 + y._2)
  |                                                                                 ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?5]
  --> /tmp/dojo-matrix-ops-2.almd:3:81
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     list.map(list.zip(x, list.get(b, i) |> option.unwrap_or([])), (y) => y._1 + y._2)
  |                                                                                 ^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row, i) => 
    list.map(list.zip(row, list.get(b, i) |> option.unwrap_or([])), (y) => y._1 + y._2)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (i) => i * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x._1 * x._2)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?5]
  --> /tmp/dojo-matrix-ops-3.almd:3:83
  in call to list.map()
  hint: Fix the argument type
  |
3 |     list.map(list.zip(row, list.get(b, i) |> option.unwrap_or([])), (y) => y._1 + y._2)
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?5]
  --> /tmp/dojo-matrix-ops-3.almd:3:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     list.map(list.zip(row, list.get(b, i) |> option.unwrap_or([])), (y) => y._1 + y._2)
  |                                                                                   ^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
