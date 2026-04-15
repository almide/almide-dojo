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
  if m == [] then [] else
    list.range(0, list.get(m, 0).len()).map((col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
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
error[E002]: undefined method 'len' on option
  --> /tmp/dojo-matrix-ops-0.almd:6:31
  in method call .len()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `len` on `option`. Run `almide explain E002` for examples.
  |
6 |     list.range(0, list.get(m, 0).len()).map((col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))
  |                               ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-0.almd:12:81
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-0.almd:12:81
  in call to list.reduce()
  hint: Check the number of arguments
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-0.almd:12:81
  in call to list.reduce()
  hint: Fix the argument type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
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
  --> /tmp/dojo-matrix-ops-0.almd:12:81
  in call to list.reduce()
  hint: Fix the expression type or change the expected type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:12:81
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^

10 error(s) found
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
  if m == [] then [] else
    list.range(0, list.get(m, 0).len()).map((col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
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
error[E002]: undefined method 'len' on option
  --> /tmp/dojo-matrix-ops-1.almd:6:31
  in method call .len()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `len` on `option`. Run `almide explain E002` for examples.
  |
6 |     list.range(0, list.get(m, 0).len()).map((col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))
  |                               ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-1.almd:12:81
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-1.almd:12:81
  in call to list.reduce()
  hint: Check the number of arguments
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-1.almd:12:81
  in call to list.reduce()
  hint: Fix the argument type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
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
  --> /tmp/dojo-matrix-ops-1.almd:12:81
  in call to list.reduce()
  hint: Fix the expression type or change the expected type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:12:81
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^

10 error(s) found
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
  if m == [] then [] else
    list.range(0, list.get(m, 0).len()).map((col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
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
error[E002]: undefined method 'len' on option
  --> /tmp/dojo-matrix-ops-2.almd:6:31
  in method call .len()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `len` on `option`. Run `almide explain E002` for examples.
  |
6 |     list.range(0, list.get(m, 0).len()).map((col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))
  |                               ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-2.almd:12:81
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-2.almd:12:81
  in call to list.reduce()
  hint: Check the number of arguments
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-2.almd:12:81
  in call to list.reduce()
  hint: Fix the argument type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
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
  --> /tmp/dojo-matrix-ops-2.almd:12:81
  in call to list.reduce()
  hint: Fix the expression type or change the expected type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:12:81
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^

10 error(s) found
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
  if m == [] then [] else
    list.range(0, list.get(m, 0).len()).map((col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
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
error[E002]: undefined method 'len' on option
  --> /tmp/dojo-matrix-ops-3.almd:6:31
  in method call .len()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `len` on `option`. Run `almide explain E002` for examples.
  |
6 |     list.range(0, list.get(m, 0).len()).map((col_idx) => list.map(m, (row) => list.get(row, col_idx).unwrap_or(0)))
  |                               ^
error[E002]: undefined function 'list.index'
  --> /tmp/dojo-matrix-ops-3.almd:12:81
  in call to list.index()
  hint: No function 'index' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E004]: list.reduce() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-3.almd:12:81
  in call to list.reduce()
  hint: Check the number of arguments
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got Int
  --> /tmp/dojo-matrix-ops-3.almd:12:81
  in call to list.reduce()
  hint: Fix the argument type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
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
  --> /tmp/dojo-matrix-ops-3.almd:12:81
  in call to list.reduce()
  hint: Fix the expression type or change the expected type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:12:81
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
12 |   list.reduce(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index(row_a, x)).unwrap_or(0))
   |                                                                                 ^

10 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
