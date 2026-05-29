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
  list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.len(row_a) - 1).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m))).map(
      (i) => list.map(m, (row) => list.get(row, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(row_a) - 1).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:2:83
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.len(row_a) - 1).unwrap_or(0)))
  |                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:39
  in call to list.len()
  hint: Fix the argument type
  |
6 |     list.range(0, list.len(list.first(m))).map(
  |                                       ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:2:83
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.len(row_a) - 1).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:2:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.len(row_a) - 1).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |     list.range(0, list.len(list.first(m))).map(
  |                                       ^

5 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.len(row_a) - 1).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m))).map(
      (i) => list.map(m, (row) => list.get(row, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(row_a) - 1).unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(row
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected ')' to close function call opened at line 16:34
  --> /tmp/dojo-matrix-ops-1.almd:18:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
16 |   list.map(a, (row_a) => list.map(row
   |                                  --------------- '(' opened here
...
18 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:2:83
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.len(row_a) - 1).unwrap_or(0)))
  |                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:6:39
  in call to list.len()
  hint: Fix the argument type
  |
6 |     list.range(0, list.len(list.first(m))).map(
  |                                       ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:2:83
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.len(row_a) - 1).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:2:83
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.len(row_a) - 1).unwrap_or(0)))
  |                                                                                   ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:6:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |     list.range(0, list.len(list.first(m))).map(
  |                                       ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.first(b).len() - 1).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m))).map(
      (i) => list.map(m, (row) => list.get(row, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(row_a) - 1).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error[E002]: undefined method 'len' on option
  --> /tmp/dojo-matrix-ops-2.almd:2:76
  in method call .len()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `len` on `option`. Run `almide explain E002` for examples.
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.first(b).len() - 1).unwrap_or(0)))
  |                                                                            ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:2:87
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.first(b).len() - 1).unwrap_or(0)))
  |                                                                                       ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:6:39
  in call to list.len()
  hint: Fix the argument type
  |
6 |     list.range(0, list.len(list.first(m))).map(
  |                                       ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:2:87
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.first(b).len() - 1).unwrap_or(0)))
  |                                                                                       ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[List[Int]]) -> List[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:2:87
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.first(b).len() - 1).unwrap_or(0)))
  |                                                                                       ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:6:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |     list.range(0, list.len(list.first(m))).map(
  |                                       ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.first(b).index_of(x).unwrap_or(0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(list.first(m))).map(
      (i) => list.map(m, (row) => list.get(row, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(row_a) - 1).unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error[E002]: undefined method 'index_of' on option
  --> /tmp/dojo-matrix-ops-3.almd:2:76
  in method call .index_of()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `index_of` on `option`. Run `almide explain E002` for examples.
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.first(b).index_of(x).unwrap_or(0))))
  |                                                                            ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:2:76
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x) => x + list.get(b, list.first(b).index_of(x).unwrap_or(0))))
  |                                                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:6:39
  in call to list.len()
  hint: Fix the argument type
  |
6 |     list.range(0, list.len(list.first(m))).map(
  |                                       ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:6:39
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |     list.range(0, list.len(list.first(m))).map(
  |                                       ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
