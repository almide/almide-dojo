# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:3:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       [1, 2],
   | -------------------------- fn list.get() defined here
...
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-0.almd:3:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:7:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
7 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
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
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:3:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

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
error[E012]: duplicate function 'mat_add'
  at line 77
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ---------------------------------- first definition of 'mat_add' here
...
77 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 82
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ---------------------------------------- first definition of 'mat_transpose' here
...
82 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 85
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
   | ------------------------------------ first definition of 'mat_scale' here
...
85 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 90
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | -------------------------------------- first definition of 'mat_dot_row' here
...
90 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | ^
error[E012]: duplicate function 'mat_add'
  at line 96
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ---------------------------------- first definition of 'mat_add' here
...
96 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 101
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
101 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 104
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
    | ------------------------------------ first definition of 'mat_scale' here
 ...
104 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 109
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
109 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
    | ^
error[E012]: duplicate function 'mat_add'
  at line 115
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
    | ---------------------------------- first definition of 'mat_add' here
 ...
115 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 120
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
120 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 123
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
    | ------------------------------------ first definition of 'mat_scale' here
 ...
123 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 128
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
128 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
    | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:3:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:3:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:7:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
7 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
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
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:22:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:26:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
26 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
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
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:41:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:45:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
45 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
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
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:60:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:64:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
64 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
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
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:79:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:79:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:83:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
83 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:93:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
93 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
   |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:98:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:98:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:102:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   row_a,
    | -------------------------- fn list.len() defined here
 ...
102 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
    |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:112:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 | )
    | -------------------------- fn list.get() defined here
 ...
112 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
    |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:117:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 | )
    | -------------------------- fn list.get() defined here
 ...
117 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:117:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
    |
117 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:121:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   row_a,
    | -------------------------- fn list.len() defined here
 ...
121 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
    |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:131:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 | )
    | -------------------------- fn list.get() defined here
 ...
131 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
    |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:3:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:3:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:22:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:22:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:41:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:41:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:60:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:60:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:79:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:79:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:98:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:98:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:117:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
    |
117 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:117:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
    |
117 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                                                 ^

66 error(s) found
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:3:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |       [1, 2],
   | -------------------------- fn list.get() defined here
...
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:3:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:7:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
7 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:17:41
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
  --> /tmp/dojo-matrix-ops-2.almd:3:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:3:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                                 ^

6 error(s) found
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((col_idx) => 
      list.map(m, (row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

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
error[E012]: duplicate function 'mat_add'
  at line 77
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ---------------------------------- first definition of 'mat_add' here
...
77 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 82
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ---------------------------------------- first definition of 'mat_transpose' here
...
82 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 85
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
   | ------------------------------------ first definition of 'mat_scale' here
...
85 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 90
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | -------------------------------------- first definition of 'mat_dot_row' here
...
90 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | ^
error[E012]: duplicate function 'mat_add'
  at line 96
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ---------------------------------- first definition of 'mat_add' here
...
96 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 101
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
101 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 104
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
    | ------------------------------------ first definition of 'mat_scale' here
 ...
104 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 109
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
109 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
    | ^
error[E012]: duplicate function 'mat_add'
  at line 115
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
    | ---------------------------------- first definition of 'mat_add' here
 ...
115 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 120
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
120 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 123
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
    | ------------------------------------ first definition of 'mat_scale' here
 ...
123 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 128
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
128 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
    | ^
error[E012]: duplicate function 'mat_add'
  at line 134
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
    | ---------------------------------- first definition of 'mat_add' here
 ...
134 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 139
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  6 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
139 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = if list.is_empty(m) then []
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 142
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
    | ------------------------------------ first definition of 'mat_scale' here
 ...
142 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = list.map(
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 147
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
147 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
    | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:3:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:3:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:7:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
7 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:17:41
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
  --> /tmp/dojo-matrix-ops-3.almd:22:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:22:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:26:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
26 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:36:41
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
  --> /tmp/dojo-matrix-ops-3.almd:41:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:41:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:45:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
45 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:55:41
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
  --> /tmp/dojo-matrix-ops-3.almd:60:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:60:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:64:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
64 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:74:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
74 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
   |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:79:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:79:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:83:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
83 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
   |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:93:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
93 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
   |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:98:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:98:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:102:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   row_a,
    | -------------------------- fn list.len() defined here
 ...
102 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
    |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:112:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 | )
    | -------------------------- fn list.get() defined here
 ...
112 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
    |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:117:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 | )
    | -------------------------- fn list.get() defined here
 ...
117 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:117:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
    |
117 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:121:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   row_a,
    | -------------------------- fn list.len() defined here
 ...
121 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
    |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:131:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 | )
    | -------------------------- fn list.get() defined here
 ...
131 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
    |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:136:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 | )
    | -------------------------- fn list.get() defined here
 ...
136 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:136:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
    |
136 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:140:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   row_a,
    | -------------------------- fn list.len() defined here
 ...
140 | else list.range(0, list.len(list.first(m))) |> list.map((col_idx) => list.map(m, (row) => list.get(row, col_idx) ?? 0))
    |                             ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:150:41
  in call to list.get()
  here: (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 | )
    | -------------------------- fn list.get() defined here
 ...
150 |   (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0,
    |                                         ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:3:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:3:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
  |
3 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:22:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:22:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
22 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:41:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:41:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
41 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:60:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:60:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
60 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:79:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:79:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:98:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:98:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:117:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
    |
117 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:117:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
    |
117 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:136:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
    |
136 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:136:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
    |
136 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(a, row_a)) ?? 0 + x),
    |                                                                                 ^

76 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
