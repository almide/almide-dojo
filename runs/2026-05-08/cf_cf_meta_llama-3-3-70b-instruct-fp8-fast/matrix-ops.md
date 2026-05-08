# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:105
  in call to list.get_or()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                         ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:134
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                      ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:2:157
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                             ^
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-0.almd:13:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
13 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^
error[E001]: type mismatch in call to list.get_or(): expected List[Int] but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:105
  in call to list.get_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                         ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:2:157
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get_or(list.index_of(a, x), 0, 0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                             ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a, i) => 
    list.map(row_a, (x, j) => 
      x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:4:60
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                            ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-1.almd:15:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
15 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-1.almd:4:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                   ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x, i) => 
      x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error[E004]: list.get() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-2.almd:4:86
  in call to list.get()
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 1
      list.get(<xs: List[A]>, <i: Int>)
  |
4 |       x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                      ^
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:86
  in call to list.get()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                      ^
error[E004]: list.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-2.almd:4:115
  in call to list.get()
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 3
      list.get(<xs: List[A]>, <i: Int>)
  |
4 |       x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                   ^
error[E005]: argument 'i' expects Int but got List[?4]
  --> /tmp/dojo-matrix-ops-2.almd:4:115
  in call to list.get()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                   ^
error[E004]: list.get() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-2.almd:4:138
  in call to list.get()
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 1
      list.get(<xs: List[A]>, <i: Int>)
  |
4 |       x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                          ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:138
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                          ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(?1, ?2) -> ?1
  --> /tmp/dojo-matrix-ops-2.almd:4:138
  in call to list.map()
  hint: Fix the argument type
  |
4 |       x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                          ^
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-2.almd:15:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
15 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:86
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                      ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:138
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                          ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(?1, ?2) -> ?1
  --> /tmp/dojo-matrix-ops-2.almd:4:138
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       x + list.get(list.get(b, list.get(list.index_of(a, row_a) |> option.unwrap_or(-1)) |> option.unwrap_or([]), i) |> option.unwrap_or(0))))
  |                                                                                                                                          ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (rows) => 
    list.map(list.zip(rows._1, rows._2), (x) => x._1 + x._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then []
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-3.almd:14:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
14 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^

1 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
