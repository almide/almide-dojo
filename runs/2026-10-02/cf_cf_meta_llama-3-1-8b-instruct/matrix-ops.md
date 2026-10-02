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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:3:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       [1, 2],
   | -------------------------- fn list.get() defined here
...
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-0.almd:3:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:7:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
7 | else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
  |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:17:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       [1, 2],
   | -------------------------- fn list.get() defined here
...
17 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
   |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:3:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:3:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  |                                                                                 ^

6 error(s) found
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
error[E012]: duplicate function 'mat_add'
  at line 20
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ---------------------------------- first definition of 'mat_add' here
...
20 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 25
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ---------------------------------------- first definition of 'mat_transpose' here
...
25 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 28
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
   | ------------------------------------ first definition of 'mat_scale' here
...
28 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 33
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | -------------------------------------- first definition of 'mat_dot_row' here
...
33 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | ^
error[E012]: duplicate function 'mat_add'
  at line 39
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ---------------------------------- first definition of 'mat_add' here
...
39 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 44
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ---------------------------------------- first definition of 'mat_transpose' here
...
44 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 47
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
   | ------------------------------------ first definition of 'mat_scale' here
...
47 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 52
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | -------------------------------------- first definition of 'mat_dot_row' here
...
52 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | ^
error[E012]: duplicate function 'mat_add'
  at line 58
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ---------------------------------- first definition of 'mat_add' here
...
58 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 63
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ---------------------------------------- first definition of 'mat_transpose' here
...
63 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 66
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
   | ------------------------------------ first definition of 'mat_scale' here
...
66 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 71
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | -------------------------------------- first definition of 'mat_dot_row' here
...
71 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:3:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:3:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:7:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
7 | else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
  |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:17:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
17 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
   |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:22:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:22:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:26:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
26 | else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:36:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
36 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
   |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:41:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:41:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:45:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
45 | else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:55:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
55 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
   |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:60:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:60:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:64:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
64 | else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:74:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
74 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
   |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:3:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:3:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:22:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:22:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:41:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:41:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:60:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:60:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                                 ^

36 error(s) found
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row
```

**Diagnostic:**

```
error: Expected ')' to close function call opened at line 322:12
  --> /tmp/dojo-matrix-ops-2.almd:324:1
  here: test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
  hint: Add ')' or check for a missing delimiter inside the function call
    |
322 |   list.fold(row
    |            --------------- '(' opened here
 ...
324 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
    | ^^^^
error: Expected ')' to close function call opened at line 322:12 at line 324:1
  --> /tmp/dojo-matrix-ops-2.almd:322:12
  here: list.fold(row
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
322 |   list.fold(row
    |            ^
error[E012]: duplicate function 'mat_add'
  at line 20
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
20 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 27
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
27 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 33
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
33 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 36
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
36 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 39
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
39 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 46
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
46 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 52
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
52 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 55
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
55 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 58
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
58 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 65
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
65 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 71
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
71 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 74
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
74 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 77
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
77 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 84
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
84 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 90
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
90 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 93
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
93 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 96
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
96 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 103
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
103 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 109
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
109 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 112
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
112 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 115
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
115 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 122
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
122 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 128
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
128 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 131
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
131 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 134
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
134 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 141
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
141 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 147
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
147 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 150
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
150 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 153
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
153 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 160
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
160 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 166
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
166 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 169
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
169 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 172
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
172 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 179
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
179 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 185
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
185 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 188
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
188 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 191
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
191 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 198
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
198 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 204
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
204 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 207
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
207 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 210
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
210 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 217
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
217 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 223
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
223 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 226
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
226 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 229
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
229 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 236
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
236 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 242
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
242 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 245
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
245 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 248
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
248 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 255
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
255 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 261
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
261 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 264
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
264 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 267
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
267 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 274
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
274 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 280
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
280 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 283
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
283 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 286
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
286 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 293
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
293 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 299
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
299 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 302
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
302 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 305
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
305 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 312
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
312 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 318
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
318 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 321
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
321 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
...
4 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:4:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:10:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   list.map(m, (row) => list.map(row, (x) => x * s))
   | -------------------------- fn list.len() defined here
...
10 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:18:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
...
18 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:18:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
18 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:18:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 |     )
   | ---------------------------------- fn option.unwrap_or() defined here
...
18 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:23:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:23:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:29:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   list.map(m, (row) => list.map(row, (x) => x * s))
   | -------------------------- fn list.len() defined here
...
29 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:37:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
...
37 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:37:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
37 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:37:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 |     )
   | ---------------------------------- fn option.unwrap_or() defined here
...
37 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:42:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
...
42 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:42:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
42 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:48:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   list.map(m, (row) => list.map(row, (x) => x * s))
   | -------------------------- fn list.len() defined here
...
48 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:56:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
...
56 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:56:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
56 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:56:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 |     )
   | ---------------------------------- fn option.unwrap_or() defined here
...
56 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:61:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
...
61 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:61:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
61 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:67:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   list.map(m, (row) => list.map(row, (x) => x * s))
   | -------------------------- fn list.len() defined here
...
67 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:75:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
...
75 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:75:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
75 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:75:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 |     )
   | ---------------------------------- fn option.unwrap_or() defined here
...
75 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:80:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
...
80 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:80:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
80 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:86:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   list.map(m, (row) => list.map(row, (x) => x * s))
   | -------------------------- fn list.len() defined here
...
86 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:94:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
...
94 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:94:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
94 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:94:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 |     )
   | ---------------------------------- fn option.unwrap_or() defined here
...
94 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:99:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   | -------------------------- fn list.get() defined here
...
99 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:99:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
99 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:105:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
105 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:113:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
113 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:113:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
113 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:113:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
113 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:118:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
118 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:118:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
118 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:124:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
124 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:132:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
132 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:132:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
132 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:132:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
132 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:137:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
137 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:137:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
137 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:143:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
143 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:151:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
151 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:151:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
151 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:151:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
151 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:156:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
156 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:156:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
156 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:162:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
162 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:170:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
170 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:170:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
170 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:170:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
170 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:175:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
175 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:175:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
175 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:181:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
181 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:189:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
189 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:189:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
189 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:189:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
189 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:194:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
194 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:194:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
194 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:200:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
200 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:208:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
208 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:208:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
208 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:208:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
208 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:213:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
213 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:213:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
213 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:219:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
219 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:227:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
227 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:227:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
227 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:227:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
227 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:232:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
232 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:232:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
232 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:238:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
238 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:246:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
246 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:246:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
246 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:246:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
246 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:251:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
251 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:251:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
251 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:257:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
257 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:265:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
265 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:265:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
265 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:265:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
265 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:270:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
270 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:270:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
270 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:276:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
276 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:284:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
284 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:284:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
284 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:284:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
284 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:289:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
289 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:289:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
289 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:295:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
295 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:303:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
303 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:303:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
303 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:303:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 |     )
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
303 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:308:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    | -------------------------- fn list.get() defined here
 ...
308 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:308:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
308 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:314:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   list.map(m, (row) => list.map(row, (x) => x * s))
    | -------------------------- fn list.len() defined here
 ...
314 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:4:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:23:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:23:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
23 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:42:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
42 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:42:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
42 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:61:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
61 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:61:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
61 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:80:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
80 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:80:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
80 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:99:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
99 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:99:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
99 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:118:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
118 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:118:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
118 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:137:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
137 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:137:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
137 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:156:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
156 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:156:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
156 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:175:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
175 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:175:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
175 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:194:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
194 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:194:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
194 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:213:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
213 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:213:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
213 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:232:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
232 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:232:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
232 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:251:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
251 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:251:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
251 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:270:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
270 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:270:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
270 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:289:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
289 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:289:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
289 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:308:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
308 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:308:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
308 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^

199 error(s) found
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
      list.get(b, list.index_of(row_a, x)) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => list.get(row, i) ?? 0)
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
   | -------------------------- fn list.get() defined here
...
4 |       list.get(b, list.index_of(row_a, x)) ?? 0 + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:4:51
  in operator +
  here: list.get(b, list.index_of(row_a, x)) ?? 0 + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(row_a, x)) ?? 0 + x
  |                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:10:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   list.map(m, (row) => list.map(row, (x) => x * s))
   | -------------------------- fn list.len() defined here
...
10 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:18:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | test "mat_transpose 2x3" { assert_eq(mat_transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]]) }
   | -------------------------- fn list.get() defined here
...
18 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:4:47
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x)) ?? 0 + x
  |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:4:51
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x)) ?? 0 + x
  |                                                   ^

6 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
