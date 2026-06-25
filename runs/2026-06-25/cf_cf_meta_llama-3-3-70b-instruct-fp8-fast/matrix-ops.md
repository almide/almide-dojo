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
    y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected ')' to close function call opened at line 14:12
  --> /tmp/dojo-matrix-ops-0.almd:16:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
14 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x
   |            --------------- '(' opened here
...
16 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E004]: list.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-0.almd:3:136
  in call to list.get()
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 3
      list.get(<xs: List[A]>, <i: Int>)
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                        ^
error[E004]: list.get() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-0.almd:3:159
  in call to list.get()
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 1
      list.get(<xs: List[A]>, <i: Int>)
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                                               ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:3:159
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                                               ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(?1, ?2) -> ?1
  --> /tmp/dojo-matrix-ops-0.almd:3:159
  in call to list.map()
  hint: Fix the argument type
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                                               ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Int but got List[?3]
  --> /tmp/dojo-matrix-ops-0.almd:3:131
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                   ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:3:159
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                                               ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(?1, ?2) -> ?1
  --> /tmp/dojo-matrix-ops-0.almd:3:159
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.index_of(a, x) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                                               ^

8 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-1.almd:13:67
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
13 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
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
  list.map(a, (x) => list.map(list.zip(x, list.first(b) |> option.unwrap_or([])), (y) => y._1 + y._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-2.almd:13:67
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
13 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
   |                                                                   ^

1 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => list.map(list.zip(x, list.get(b, list.index_of(a, x) |> option.unwrap_or(0) |> option.unwrap_or(0))), (y) => y._1 + y._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair._1 * pair._2)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:2:118
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(list.zip(x, list.get(b, list.index_of(a, x) |> option.unwrap_or(0) |> option.unwrap_or(0))), (y) => y._1 + y._2))
  |                                                                                                                      ^
error[E005]: argument 'ys' expects List[B] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:2:118
  in call to list.zip()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(list.zip(x, list.get(b, list.index_of(a, x) |> option.unwrap_or(0) |> option.unwrap_or(0))), (y) => y._1 + y._2))
  |                                                                                                                      ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:2:118
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(list.zip(x, list.get(b, list.index_of(a, x) |> option.unwrap_or(0) |> option.unwrap_or(0))), (y) => y._1 + y._2))
  |                                                                                                                      ^
error[E001]: type mismatch in call to list.zip(): expected List[B] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:2:118
  in call to list.zip()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(list.zip(x, list.get(b, list.index_of(a, x) |> option.unwrap_or(0) |> option.unwrap_or(0))), (y) => y._1 + y._2))
  |                                                                                                                      ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
