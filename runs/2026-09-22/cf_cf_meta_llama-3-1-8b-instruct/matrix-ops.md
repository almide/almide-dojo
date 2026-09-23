# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:12:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 12:5
  --> /tmp/dojo-matrix-ops-0.almd:12:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |     let ncols = list.len(list.first(m))
   |     ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   list.map(m, (row) =>
   | -------------------------- fn list.get() defined here
...
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-0.almd:4:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |                                                                     ^
error: operator '*' requires numeric types but got Option[Int] and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:25:103
  in operator *
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: Use numeric types (Int or Float)
   |
25 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                                                                       ^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:25:103
  in operator +
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: Use + with numeric types, String, or List
   |
25 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                                                                       ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:4:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:4:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |                                                                     ^

8 error(s) found
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
      list.get(b, list.index_of(a, row_a)) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:12:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 12:5
  --> /tmp/dojo-matrix-ops-1.almd:12:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |     let ncols = list.len(list.first(m))
   |     ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   list.map(m, (row) =>
   | -------------------------- fn list.get() defined here
...
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:4:51
  in operator +
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                   ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:4:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:4:51
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                   ^

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
      list.get(b, list.index_of(a, row_a)) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:12:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 12:5
  --> /tmp/dojo-matrix-ops-2.almd:12:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:41:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
41 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 41:5
  --> /tmp/dojo-matrix-ops-2.almd:41:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |     let ncols = list.len(list.first(m))
   |     ^
error[E012]: duplicate function 'mat_add'
  at line 27
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
27 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 37
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
37 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 48
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
19 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
48 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 53
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
24 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
53 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   list.map(m, (row) =>
   | -------------------------- fn list.get() defined here
...
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:4:51
  in operator +
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                   ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:30:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |   list.map(m, (row) =>
   | -------------------------- fn list.get() defined here
...
30 |       match list.get(b, list.index_of(a, row_a)) {
   |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:31:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
   |
31 |         some(val_b) => val_b + x
   |                                ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:4:51
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                   ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:32:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
32 |         none => x
   |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:32:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
   |
32 |         none => x
   |                 ^

16 error(s) found
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
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + (list.get(row_a, i) ?? 0) * (list.get(col_b, i) ?? 0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      match list.get(b, list.index_of(a, row_a)) {
        some(val_b) => val_b + x
        none => x
      }
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col) => 
      list.map(m, (row) => 
        list.get(row, col) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int],
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:15:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
15 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 15:5
  --> /tmp/dojo-matrix-ops-3.almd:15:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:44:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
44 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 44:5
  --> /tmp/dojo-matrix-ops-3.almd:44:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
44 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:73:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
73 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 73:5
  --> /tmp/dojo-matrix-ops-3.almd:73:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
73 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:102:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
102 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 102:5
  --> /tmp/dojo-matrix-ops-3.almd:102:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
102 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:131:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
131 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 131:5
  --> /tmp/dojo-matrix-ops-3.almd:131:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
131 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:160:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
160 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 160:5
  --> /tmp/dojo-matrix-ops-3.almd:160:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
160 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:189:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
189 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 189:5
  --> /tmp/dojo-matrix-ops-3.almd:189:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
189 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:218:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
218 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 218:5
  --> /tmp/dojo-matrix-ops-3.almd:218:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
218 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:247:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
247 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 247:5
  --> /tmp/dojo-matrix-ops-3.almd:247:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
247 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:276:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
276 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 276:5
  --> /tmp/dojo-matrix-ops-3.almd:276:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
276 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:305:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
305 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 305:5
  --> /tmp/dojo-matrix-ops-3.almd:305:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
305 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:334:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
334 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 334:5
  --> /tmp/dojo-matrix-ops-3.almd:334:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
334 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:363:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
363 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 363:5
  --> /tmp/dojo-matrix-ops-3.almd:363:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
363 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:392:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
392 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 392:5
  --> /tmp/dojo-matrix-ops-3.almd:392:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
392 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:421:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
421 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 421:5
  --> /tmp/dojo-matrix-ops-3.almd:421:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
421 |     let ncols = list.len(list.first(m))
    |     ^
error: Expected parameter name at line 435:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-3.almd:435:1
  here: test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
435 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
    | ^
error[E012]: duplicate function 'mat_add'
  at line 30
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
30 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 40
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
40 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 51
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
51 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 56
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
56 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 59
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
59 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 69
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
69 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 80
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
80 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 85
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
85 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 88
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
88 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 98
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
98 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 109
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
109 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 114
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
114 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 117
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
117 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 127
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
127 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 138
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
138 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 143
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
143 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 146
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
146 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 156
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
156 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 167
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
167 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 172
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
172 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 175
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
175 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 185
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
185 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 196
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
196 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 201
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
201 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 204
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
204 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 214
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
214 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 225
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
225 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 230
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
230 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 233
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
233 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 243
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
243 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 254
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
254 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 259
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
259 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 262
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
262 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 272
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
272 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 283
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
283 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 288
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
288 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 291
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
291 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 301
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
301 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 312
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
312 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 317
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
317 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 320
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
320 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 330
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
330 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 341
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
341 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 346
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
346 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 349
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
349 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 359
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
359 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 370
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
370 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 375
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
375 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 378
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
378 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 388
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
388 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 399
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
399 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E012]: duplicate function 'mat_dot_row'
  at line 404
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 27 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
404 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_add'
  at line 407
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
407 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^
error[E012]: duplicate function 'mat_transpose'
  at line 417
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 11 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
417 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^^^^^^^^^^^^^^^^
error[E012]: duplicate function 'mat_scale'
  at line 428
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 22 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
428 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |     )
   | -------------------------- fn list.get() defined here
...
4 |       match list.get(b, list.index_of(a, row_a)) {
  |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:5:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
  |
5 |         some(val_b) => val_b + x
  |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:33:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |     )
   | -------------------------- fn list.get() defined here
...
33 |       match list.get(b, list.index_of(a, row_a)) {
   |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:34:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
   |
34 |         some(val_b) => val_b + x
   |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:62:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |     )
   | -------------------------- fn list.get() defined here
...
62 |       match list.get(b, list.index_of(a, row_a)) {
   |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:63:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
   |
63 |         some(val_b) => val_b + x
   |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:91:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
20 |     )
   | -------------------------- fn list.get() defined here
...
91 |       match list.get(b, list.index_of(a, row_a)) {
   |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:92:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
   |
92 |         some(val_b) => val_b + x
   |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:120:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
120 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:121:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
121 |         some(val_b) => val_b + x
    |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:149:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
149 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:150:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
150 |         some(val_b) => val_b + x
    |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:178:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
178 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:179:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
179 |         some(val_b) => val_b + x
    |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:207:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
207 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:208:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
208 |         some(val_b) => val_b + x
    |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:236:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
236 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:237:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
237 |         some(val_b) => val_b + x
    |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:265:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
265 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:266:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
266 |         some(val_b) => val_b + x
    |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:294:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
294 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:295:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
295 |         some(val_b) => val_b + x
    |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:323:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
323 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:324:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
324 |         some(val_b) => val_b + x
    |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:352:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
352 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:353:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
353 |         some(val_b) => val_b + x
    |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:381:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
381 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:382:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
382 |         some(val_b) => val_b + x
    |                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:410:25
  in call to list.get()
  here: match list.get(b, list.index_of(a, row_a)) {
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 20 |     )
    | -------------------------- fn list.get() defined here
 ...
410 |       match list.get(b, list.index_of(a, row_a)) {
    |                         ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:411:32
  in operator +
  here: some(val_b) => val_b + x
  hint: Use + with numeric types, String, or List
    |
411 |         some(val_b) => val_b + x
    |                                ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:6:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
  |
6 |         none => x
  |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:6:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
  |
6 |         none => x
  |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:35:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
35 |         none => x
   |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:35:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
   |
35 |         none => x
   |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:64:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
64 |         none => x
   |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:64:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
   |
64 |         none => x
   |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:93:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
93 |         none => x
   |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:93:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
   |
93 |         none => x
   |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:122:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
122 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:122:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
122 |         none => x
    |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:151:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
151 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:151:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
151 |         none => x
    |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:180:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
180 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:180:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
180 |         none => x
    |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:209:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
209 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:209:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
209 |         none => x
    |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:238:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
238 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:238:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
238 |         none => x
    |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:267:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
267 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:267:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
267 |         none => x
    |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:296:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
296 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:296:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
296 |         none => x
    |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:325:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
325 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:325:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
325 |         none => x
    |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:354:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
354 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:354:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
354 |         none => x
    |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:383:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
383 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:383:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
383 |         none => x
    |                 ^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:412:17
  in match arm
  here: none => x
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
    |
412 |         none => x
    |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:412:17
  in fn 'mat_add'
  here: none => x
  hint: Fix the expression type or change the expected type
    |
412 |         none => x
    |                 ^

146 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
