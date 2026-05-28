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
  if list.is_empty(a)
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
error: Expected Then at line 19:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:19:1
  hint: `test "..."` is a top-level form. Got here mid-declaration — either the previous fn/type/impl is missing a closing `}`, or the test block is in a context (e.g. harness-submitted code) that doesn't accept one. Remove the test block or close the prior declaration.
   |
19 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
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
  if list.is_empty(a)
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
error: Expected Then at line 19:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:19:1
  hint: `test "..."` is a top-level form. Got here mid-declaration — either the previous fn/type/impl is missing a closing `}`, or the test block is in a context (e.g. harness-submitted code) that doesn't accept one. Remove the test block or close the prior declaration.
   |
19 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
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
  if list.is_empty(a)
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
error: Expected Then at line 19:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-3.almd:19:1
  hint: `test "..."` is a top-level form. Got here mid-declaration — either the previous fn/type/impl is missing a closing `}`, or the test block is in a context (e.g. harness-submitted code) that doesn't accept one. Remove the test block or close the prior declaration.
   |
19 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
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
