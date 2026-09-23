# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)))
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:1:131
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   ])
   | -------------------------- fn list.get() defined here
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-0.almd:1:163
  in operator +
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Use + with numeric types, String, or List
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
14 |   ], [
   | -------------------------- fn list.len() defined here
...
4 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:8:119
  in call to list.get()
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   ])
   | -------------------------- fn list.get() defined here
...
8 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)))
  |                                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:8:119
  in operator *
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)))
  hint: Use numeric types (Int or Float)
  |
8 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)))
  |                                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:1:159
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:1:163
  in fn 'mat_add'
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                                   ^

7 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:1:131
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   ])
   | -------------------------- fn list.get() defined here
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:1:163
  in operator +
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Use + with numeric types, String, or List
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:4:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
14 |   ], [
   | -------------------------- fn list.len() defined here
...
4 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:8:119
  in call to list.get()
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   ])
   | -------------------------- fn list.get() defined here
...
8 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  |                                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:1:159
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:1:163
  in fn 'mat_add'
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                                   ^

6 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
error[E012]: duplicate function 'mat_add'
  at line 10
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   | ---------------------------------- first definition of 'mat_add' here
...
10 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 12
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 3 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ---------------------------------------- first definition of 'mat_transpose' here
...
12 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 15
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
   | ------------------------------------ first definition of 'mat_scale' here
...
15 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
   | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 17
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   | -------------------------------------- first definition of 'mat_dot_row' here
...
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 19
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   | ---------------------------------- first definition of 'mat_add' here
...
19 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 21
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 3 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ---------------------------------------- first definition of 'mat_transpose' here
...
21 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 24
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
   | ------------------------------------ first definition of 'mat_scale' here
...
24 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
   | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 26
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   | -------------------------------------- first definition of 'mat_dot_row' here
...
26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 28
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   | ---------------------------------- first definition of 'mat_add' here
...
28 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 30
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 3 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ---------------------------------------- first definition of 'mat_transpose' here
...
30 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 33
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
   | ------------------------------------ first definition of 'mat_scale' here
...
33 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
   | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 35
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   | -------------------------------------- first definition of 'mat_dot_row' here
...
35 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 37
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   | ---------------------------------- first definition of 'mat_add' here
...
37 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 39
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 3 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ---------------------------------------- first definition of 'mat_transpose' here
...
39 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 42
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
   | ------------------------------------ first definition of 'mat_scale' here
...
42 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
   | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 44
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   | -------------------------------------- first definition of 'mat_dot_row' here
...
44 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 46
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   | ---------------------------------- first definition of 'mat_add' here
...
46 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 48
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 3 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ---------------------------------------- first definition of 'mat_transpose' here
...
48 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 51
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
   | ------------------------------------ first definition of 'mat_scale' here
...
51 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(m, (row) => list.map(row, (x) => x * s))
   | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 53
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   | -------------------------------------- first definition of 'mat_dot_row' here
...
53 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   | ^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:1:131
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:1:163
  in operator +
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Use + with numeric types, String, or List
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:4:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
4 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:8:119
  in call to list.get()
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
8 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  |                                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:10:131
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
10 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:10:163
  in operator +
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Use + with numeric types, String, or List
   |
10 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:13:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
13 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:17:119
  in call to list.get()
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:19:131
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
19 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:19:163
  in operator +
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Use + with numeric types, String, or List
   |
19 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:22:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
22 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:26:119
  in call to list.get()
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:28:131
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
28 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:28:163
  in operator +
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Use + with numeric types, String, or List
   |
28 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:31:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
31 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:35:119
  in call to list.get()
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
35 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:37:131
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
37 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:37:163
  in operator +
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Use + with numeric types, String, or List
   |
37 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:40:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
40 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:44:119
  in call to list.get()
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
44 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:46:131
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
46 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:46:163
  in operator +
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Use + with numeric types, String, or List
   |
46 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:49:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
49 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:53:119
  in call to list.get()
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
53 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:1:159
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:1:163
  in fn 'mat_add'
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                                   ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:10:159
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
10 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:10:163
  in fn 'mat_add'
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
10 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                                   ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:19:159
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
19 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:19:163
  in fn 'mat_add'
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
19 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                                   ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:28:159
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
28 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:28:163
  in fn 'mat_add'
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
28 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                                   ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:37:159
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
37 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:37:163
  in fn 'mat_add'
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
37 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                                   ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:46:159
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
46 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:46:163
  in fn 'mat_add'
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
   |
46 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
   |                                                                                                                                                                   ^

56 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => list.get(row, col_idx) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:1:131
  in call to list.get()
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   ])
   | -------------------------- fn list.get() defined here
...
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:1:163
  in operator +
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Use + with numeric types, String, or List
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:4:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
14 |   ], [
   | -------------------------- fn list.len() defined here
...
4 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:8:119
  in call to list.get()
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   ])
   | -------------------------- fn list.get() defined here
...
8 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  |                                                                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:1:159
  in ?? fallback
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:1:163
  in fn 'mat_add'
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  hint: Fix the expression type or change the expected type
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(a, (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x))
  |                                                                                                                                                                   ^

6 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
