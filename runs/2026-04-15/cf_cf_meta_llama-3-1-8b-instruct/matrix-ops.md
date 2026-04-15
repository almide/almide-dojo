# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    let ncols = list.length(list.head(m))
    list.map(list.range(0, ncols), (col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:8:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let ncols = list.length(list.head(m))
  |     ^^^
error: 'let' is not an expression in Almide at line 8:5
  --> /tmp/dojo-matrix-ops-0.almd:8:5
  |
8 |     let ncols = list.length(list.head(m))
  |     ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-0.almd:2:83
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:2:83
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-0.almd:15:81
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-0.almd:15:81
  in call to list.reduce()
  hint: Check the number of arguments
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-0.almd:15:81
  in call to list.reduce()
  hint: Fix the argument type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-0.almd:20:71
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
20 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
   |                                                                       ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-0.almd:21:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
21 | test "mat_transpose 1x1" { assert_eq(mat_transpose([[5]]), [[5]]) }
   |                                                      ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-0.almd:22:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
22 | test "mat_transpose empty" { assert_eq(mat_transpose([]), []) }
   |                                                      ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:2:83
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:2:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.reduce(): expected fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-0.almd:15:81
  in call to list.reduce()
  hint: Fix the expression type or change the expected type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:15:81
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^

14 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    let ncols = list.length(list.head(m))
    list.map(list.range(0, ncols), (col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))

test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:8:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let ncols = list.length(list.head(m))
  |     ^^^
error: 'let' is not an expression in Almide at line 8:5
  --> /tmp/dojo-matrix-ops-1.almd:8:5
  |
8 |     let ncols = list.length(list.head(m))
  |     ^
error: Expected ']' to close list literal opened at line 17:59
  --> /tmp/dojo-matrix-ops-1.almd:19:1
  hint: Add ']' or check for a missing delimiter inside the list literal
   |
17 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5
   |                                                           --------------- '[' opened here
...
19 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: Expected ']' to close list literal opened at line 17:59 at line 19:1
  --> /tmp/dojo-matrix-ops-1.almd:17:59
   |
17 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5
   |                                                           ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-1.almd:2:83
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:2:83
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-1.almd:15:81
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-1.almd:15:81
  in call to list.reduce()
  hint: Check the number of arguments
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-1.almd:15:81
  in call to list.reduce()
  hint: Fix the argument type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-1.almd:22:71
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
22 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
   |                                                                       ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-1.almd:23:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
23 | test "mat_transpose 1x1" { assert_eq(mat_transpose([[5]]), [[5]]) }
   |                                                      ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-1.almd:24:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
24 | test "mat_transpose empty" { assert_eq(mat_transpose([]), []) }
   |                                                      ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:2:83
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:2:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.reduce(): expected fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-1.almd:15:81
  in call to list.reduce()
  hint: Fix the expression type or change the expected type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:15:81
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^

16 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    let ncols = list.length(list.head(m))
    list.map(list.range(0, ncols), (col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))

test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:8:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let ncols = list.length(list.head(m))
  |     ^^^
error: 'let' is not an expression in Almide at line 8:5
  --> /tmp/dojo-matrix-ops-2.almd:8:5
  |
8 |     let ncols = list.length(list.head(m))
  |     ^
error: Expected ']' to close list literal opened at line 17:59
  --> /tmp/dojo-matrix-ops-2.almd:19:1
  hint: Add ']' or check for a missing delimiter inside the list literal
   |
17 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5
   |                                                           --------------- '[' opened here
...
19 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: Expected ']' to close list literal opened at line 17:59 at line 19:1
  --> /tmp/dojo-matrix-ops-2.almd:17:59
   |
17 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5
   |                                                           ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-2.almd:2:83
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:2:83
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-2.almd:15:81
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-2.almd:15:81
  in call to list.reduce()
  hint: Check the number of arguments
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-2.almd:15:81
  in call to list.reduce()
  hint: Fix the argument type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-2.almd:22:71
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
22 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
   |                                                                       ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-2.almd:23:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
23 | test "mat_transpose 1x1" { assert_eq(mat_transpose([[5]]), [[5]]) }
   |                                                      ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-2.almd:24:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
24 | test "mat_transpose empty" { assert_eq(mat_transpose([]), []) }
   |                                                      ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:2:83
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:2:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.reduce(): expected fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-2.almd:15:81
  in call to list.reduce()
  hint: Fix the expression type or change the expected type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:15:81
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^

16 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    let ncols = list.length(list.head(m))
    list.map(list.range(0, ncols), (col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))

test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:8:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let ncols = list.length(list.head(m))
  |     ^^^
error: 'let' is not an expression in Almide at line 8:5
  --> /tmp/dojo-matrix-ops-3.almd:8:5
  |
8 |     let ncols = list.length(list.head(m))
  |     ^
error: Expected ']' to close list literal opened at line 17:59
  --> /tmp/dojo-matrix-ops-3.almd:19:1
  hint: Add ']' or check for a missing delimiter inside the list literal
   |
17 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5
   |                                                           --------------- '[' opened here
...
19 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: Expected ']' to close list literal opened at line 17:59 at line 19:1
  --> /tmp/dojo-matrix-ops-3.almd:17:59
   |
17 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5
   |                                                           ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-3.almd:2:83
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:2:83
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-3.almd:15:81
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-3.almd:15:81
  in call to list.reduce()
  hint: Check the number of arguments
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-3.almd:15:81
  in call to list.reduce()
  hint: Fix the argument type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-3.almd:22:71
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
22 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
   |                                                                       ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-3.almd:23:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
23 | test "mat_transpose 1x1" { assert_eq(mat_transpose([[5]]), [[5]]) }
   |                                                      ^
error[E002]: undefined function 'mat_transpose'
  --> /tmp/dojo-matrix-ops-3.almd:24:54
  in call to mat_transpose()
  hint: Did you mean `matrix.transpose`?
   |
24 | test "mat_transpose empty" { assert_eq(mat_transpose([]), []) }
   |                                                      ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:2:83
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:2:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.index(row_a, x)).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.reduce(): expected fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-3.almd:15:81
  in call to list.reduce()
  hint: Fix the expression type or change the expected type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:15:81
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
15 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^

16 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
