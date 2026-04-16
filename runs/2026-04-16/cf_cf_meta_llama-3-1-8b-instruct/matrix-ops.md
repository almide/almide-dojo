# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    list.range(0, list.len(m)).map((i: Int) => list.map(m, (row: List[Int]) => list.get(row, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row: List[Int]) => list.map(row, (x: Int) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected ')' to close lambda parameters opened at line 14:33
  --> /tmp/dojo-matrix-ops-0.almd:14:50
  hint: Add ')' or check for a missing delimiter inside the lambda parameters
   |
14 |   list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)
   |                                 --------------- '(' opened here
   |
14 |   list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)
   |                                                  ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:98
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error: operator '+' requires numeric, String, or List types but got Int and List[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:98
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:98
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:2:98
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^

5 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    list.range(0, list.len(m)).map((i: Int) => list.map(m, (row: List[Int]) => list.get(row, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row: List[Int]) => list.map(row, (x: Int) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected ')' to close lambda parameters opened at line 14:33
  --> /tmp/dojo-matrix-ops-1.almd:14:50
  hint: Add ')' or check for a missing delimiter inside the lambda parameters
   |
14 |   list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)
   |                                 --------------- '(' opened here
   |
14 |   list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)
   |                                                  ^
error: Expected ')' to close parenthesized expression opened at line 17:15
  --> /tmp/dojo-matrix-ops-1.almd:17:19
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
17 |   list.map(a, (row
   |               --------------- '(' opened here
   |
17 |   list.map(a, (row
   |                   ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:2:98
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error: operator '+' requires numeric, String, or List types but got Int and List[Int]
  --> /tmp/dojo-matrix-ops-1.almd:2:98
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:2:98
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:2:98
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    list.range(0, list.len(m)).map((i: Int) => list.map(m, (row: List[Int]) => list.get(row, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row: List[Int]) => list.map(row, (x: Int) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected ')' to close lambda parameters opened at line 14:33
  --> /tmp/dojo-matrix-ops-2.almd:14:50
  hint: Add ')' or check for a missing delimiter inside the lambda parameters
   |
14 |   list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)
   |                                 --------------- '(' opened here
   |
14 |   list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)
   |                                                  ^
error: Expected ')' to close parenthesized expression opened at line 17:15
  --> /tmp/dojo-matrix-ops-2.almd:17:19
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
17 |   list.map(a, (row
   |               --------------- '(' opened here
   |
17 |   list.map(a, (row
   |                   ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:2:98
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error: operator '+' requires numeric, String, or List types but got Int and List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:2:98
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:2:98
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:2:98
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    list.range(0, list.len(m)).map((i: Int) => list.map(m, (row: List[Int]) => list.get(row, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row: List[Int]) => list.map(row, (x: Int) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected ')' to close lambda parameters opened at line 14:33
  --> /tmp/dojo-matrix-ops-3.almd:14:50
  hint: Add ')' or check for a missing delimiter inside the lambda parameters
   |
14 |   list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)
   |                                 --------------- '(' opened here
   |
14 |   list.reduce(row_a.zip(col_b), (acc: Int, (x, y): (Int, Int)) => acc + x * y)
   |                                                  ^
error: Expected ')' to close parenthesized expression opened at line 17:15
  --> /tmp/dojo-matrix-ops-3.almd:17:19
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
17 |   list.map(a, (row
   |               --------------- '(' opened here
   |
17 |   list.map(a, (row
   |                   ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:2:98
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error: operator '+' requires numeric, String, or List types but got Int and List[Int]
  --> /tmp/dojo-matrix-ops-3.almd:2:98
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:2:98
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:2:98
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                                                                                  ^^^^^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
