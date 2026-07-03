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
  list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_) - 1) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.get(m, 0) |> option.unwrap_or([]) |> list.len(_) - 1), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected ')' to close function call opened at line 12:12
  --> /tmp/dojo-matrix-ops-0.almd:14:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
12 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc
   |            --------------- '(' opened here
...
14 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E004]: list.len() expects 1 argument(s) but got 2
  --> /tmp/dojo-matrix-ops-0.almd:2:120
  in call to list.len()
  hint: Check the number of arguments
  try:
      // list.len() takes 1 arg(s) — you passed 2
      list.len(<xs: List[A]>)
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_) - 1) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                        ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:153
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_) - 1) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                         ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:2:176
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_) - 1) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                                                ^
error[E004]: list.len() expects 1 argument(s) but got 2
  --> /tmp/dojo-matrix-ops-0.almd:6:82
  in call to list.len()
  hint: Check the number of arguments
  try:
      // list.len() takes 1 arg(s) — you passed 2
      list.len(<xs: List[A]>)
  |
6 |   else list.map(list.range(0, list.get(m, 0) |> option.unwrap_or([]) |> list.len(_) - 1), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))
  |                                                                                  ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:2:176
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_) - 1) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                                                ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(row_a, (val_a, i) => val_a + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([])) - 1), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected ')' to close function call opened at line 13:12
  --> /tmp/dojo-matrix-ops-1.almd:15:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
13 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b))
   |            --------------- '(' opened here
...
15 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:2:134
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (val_a, i) => val_a + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                      ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-1.almd:2:134
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a) => list.map(row_a, (val_a, i) => val_a + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                      ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:2:157
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (val_a, i) => val_a + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                                             ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:2:134
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (val_a, i) => val_a + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                      ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:2:157
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (val_a, i) => val_a + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                                             ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a, i) => list.map(row_a, (val_a, j) => val_a + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([])) - 1), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a *
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 15:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:15:1
   |
15 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:2:116
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (val_a, j) => val_a + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                    ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:2:139
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (val_a, j) => val_a + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                                           ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-2.almd:2:139
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (val_a, j) => val_a + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                                           ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:2:139
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (val_a, j) => val_a + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                                           ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-2.almd:2:139
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a, i) => list.map(row_a, (val_a, j) => val_a + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))
  |                                                                                                                                           ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([])) - 1), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-3.almd:13:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
13 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^

1 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
