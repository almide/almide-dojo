# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_) - 1) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.get(m, 0) |> option.unwrap_or([]) |> list.len(_)), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected ')' to close function call opened at line 12:12
  --> /tmp/dojo-matrix-ops-0.almd:14:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
12 |   list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x
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
6 |   else list.map(list.range(0, list.get(m, 0) |> option.unwrap_or([]) |> list.len(_)), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))
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
  list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected ')' to close function call opened at line 13:12
  --> /tmp/dojo-matrix-ops-1.almd:15:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
13 |   list.fold(list.zip(row_a, col_b), 0, (acc, x)
   |            --------------- '(' opened here
...
15 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E004]: list.len() expects 1 argument(s) but got 2
  --> /tmp/dojo-matrix-ops-1.almd:2:128
  in call to list.len()
  hint: Check the number of arguments
  try:
      // list.len() takes 1 arg(s) — you passed 2
      list.len(<xs: List[A]>)
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:2:157
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                             ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:2:180
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                                                    ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:2:180
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get(a, 0) |> option.unwrap_or([]) |> list.len(_)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                                                    ^

5 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => list.map(list.zip(x.0, x.1), (y) => y.0 + y.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```
