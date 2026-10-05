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
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:79:49
  in call to list.get()
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:79:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:83:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   row_a,
   | -------------------------- fn list.len() defined here
...
83 | else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
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
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | )
   | -------------------------- fn list.get() defined here
...
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                 ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:98:81
  in operator +
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Use + with numeric types, String, or List
   |
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                                 ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:102:29
  in call to list.len()
  here: else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |   row_a,
    | -------------------------- fn list.len() defined here
 ...
102 | else list.range(0, list.len(list.first(m))) |> list.map((i) => list.map(m, (row) => list.get(row, i) ?? 0))
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
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:79:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:79:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
79 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                                 ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:98:77
  in ?? fallback
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                             ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:98:81
  in fn 'mat_add'
  here: (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
  hint: Fix the expression type or change the expected type
   |
98 |   (row_a) => list.map(row_a, (x) => list.get(b, list.index_of(row_a, x)) ?? 0 + x),
   |                                                                                 ^

56 error(s) found
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
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int
```

**Diagnostic:**

```
error: Expected RBracket at line 376:34 (got Newline '')
  --> /tmp/dojo-matrix-ops-2.almd:376:34
  here: fn mat_transpose(m: List[List[Int
  hint: Missing ']'. Check for an unclosed '[' earlier in this expression
    |
376 | fn mat_transpose(m: List[List[Int
    |                                  ^
error[E012]: duplicate function 'mat_add'
  at line 24
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 31
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
31 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 39
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
39 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 44
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
44 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 47
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
47 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 54
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
54 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 62
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
62 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 67
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
67 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 70
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
70 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 77
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
77 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 85
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
85 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 90
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
90 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 93
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
93 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 100
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
100 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 108
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
108 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 113
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
113 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 116
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
116 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 123
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
123 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 131
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
131 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 136
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
136 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 139
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
139 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 146
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
146 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 154
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
154 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 159
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
159 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 162
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
162 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 169
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
169 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 177
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
177 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 182
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
182 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 185
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
185 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 192
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
192 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 200
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
200 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 205
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
205 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 208
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
208 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 215
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
215 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 223
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
223 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 228
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
228 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 231
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
231 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 238
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
238 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 246
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
246 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 251
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
251 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 254
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
254 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 261
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
261 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 269
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
269 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 274
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
274 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 277
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
277 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 284
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
284 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 292
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
292 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 297
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
297 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 300
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
300 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 307
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
307 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 315
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
315 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 320
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
320 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 323
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
323 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 330
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
330 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 338
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
338 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 343
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
343 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 346
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
346 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 353
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
353 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 361
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
361 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 366
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 21 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
366 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 369
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
369 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
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
...
10 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:22:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
22 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:22:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
22 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:22:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- fn option.unwrap_or() defined here
...
22 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:27:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
27 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:27:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
27 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:33:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
33 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:45:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
45 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:45:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
45 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:45:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- fn option.unwrap_or() defined here
...
45 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:50:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
50 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:50:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
50 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:56:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
56 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:68:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
68 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:68:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
68 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:68:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- fn option.unwrap_or() defined here
...
68 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:73:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
73 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:73:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
73 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:79:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
79 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:91:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
91 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:91:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
91 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:91:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- fn option.unwrap_or() defined here
...
91 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:96:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
96 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:96:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
96 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:102:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
102 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:114:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
114 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:114:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
114 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:114:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
114 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:119:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
119 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:119:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
119 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:125:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
125 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:137:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
137 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:137:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
137 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:137:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
137 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:142:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
142 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:142:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
142 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:148:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
148 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:160:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
160 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:160:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
160 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:160:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
160 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:165:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
165 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:165:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
165 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:171:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
171 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:183:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
183 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:183:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
183 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:183:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
183 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:188:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
188 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:188:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
188 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:194:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
194 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:206:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
206 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:206:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
206 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:206:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
206 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:211:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
211 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:211:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
211 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:217:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
217 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:229:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
229 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:229:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
229 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:229:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
229 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:234:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
234 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:234:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
234 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:240:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
240 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:252:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
252 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:252:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
252 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:252:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
252 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:257:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
257 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:257:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
257 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:263:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
263 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:275:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
275 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:275:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
275 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:275:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
275 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:280:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
280 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:280:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
280 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:286:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
286 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:298:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
298 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:298:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
298 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:298:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
298 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:303:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
303 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:303:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
303 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:309:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
309 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:321:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
321 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:321:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
321 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:321:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
321 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:326:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
326 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:326:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
326 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:332:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
332 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:344:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
344 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:344:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
344 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:344:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
344 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:349:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
349 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:349:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
349 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:355:28
  in call to list.len()
  here: list.range(0, list.len(list.first(m))) |> list.map((i) =>
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
355 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
    |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:367:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
367 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:367:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
367 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:367:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
367 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:372:19
  in call to list.get()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
 ...
372 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:372:69
  in operator +
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
372 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
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
  --> /tmp/dojo-matrix-ops-2.almd:27:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
27 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:27:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
27 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:50:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
50 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:50:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
50 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:73:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
73 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:73:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
73 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:96:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
96 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:96:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
96 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:119:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
119 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:119:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
119 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:142:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
142 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:142:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
142 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:165:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
165 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:165:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
165 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:188:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
188 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:188:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
188 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:211:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
211 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:211:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
211 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:234:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
234 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:234:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
234 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:257:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
257 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:257:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
257 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:280:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
280 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:280:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
280 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:303:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
303 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:303:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
303 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:326:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
326 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:326:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
326 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:349:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
349 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:349:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
349 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:372:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
372 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:372:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
372 |       list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                     ^

194 error(s) found
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
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

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
...
10 |     list.range(0, list.len(list.first(m))) |> list.map((i) =>
   |                            ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:22:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
22 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
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
