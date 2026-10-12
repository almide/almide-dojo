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
      list.get(b, list.index_of(row_a, x) |> option.unwrap_or(0)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0) |> option.unwrap_or(0)))
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:11:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 11:5
  --> /tmp/dojo-matrix-ops-0.almd:11:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     let ncols = list.len(list.first(m))
   |     ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-0.almd:4:92
  in operator +
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(0)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(0)) |> option.unwrap_or(0) + x
  |                                                                                            ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:24:128
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0) |> option.unwrap_or(0)))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0) |> option.unwrap_or(0)))
   | ---------------------------------- fn option.unwrap_or() defined here
   |
24 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0) |> option.unwrap_or(0)))
   |                                                                                                                                ^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:24:128
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0) |> option.unwrap_or(0)))
  hint: Use numeric types (Int or Float)
   |
24 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0) |> option.unwrap_or(0)))
   |                                                                                                                                ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:4:87
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(0)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(0)) |> option.unwrap_or(0) + x
  |                                                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:4:92
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(0)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(0)) |> option.unwrap_or(0) + x
  |                                                                                            ^

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
      list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:11:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 11:5
  --> /tmp/dojo-matrix-ops-1.almd:11:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     let ncols = list.len(list.first(m))
   |     ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:4:93
  in operator +
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  |                                                                                             ^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:24:106
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
24 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:24:130
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0))
   | ---------------------------------- fn option.unwrap_or() defined here
   |
24 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0))
   |                                                                                                                                  ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:4:88
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  |                                                                                        ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:4:93
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  |                                                                                             ^

7 error(s) found
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
      list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) ?? 0)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:11:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 11:5
  --> /tmp/dojo-matrix-ops-2.almd:11:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     let ncols = list.len(list.first(m))
   |     ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:4:93
  in operator +
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  |                                                                                             ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:88
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  |                                                                                        ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:4:93
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  |                                                                                             ^

5 error(s) found
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
      list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(-1)) ?? 0)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:11:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 11:5
  --> /tmp/dojo-matrix-ops-3.almd:11:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:36:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
36 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 36:5
  --> /tmp/dojo-matrix-ops-3.almd:36:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:61:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
61 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 61:5
  --> /tmp/dojo-matrix-ops-3.almd:61:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
61 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:86:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
86 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 86:5
  --> /tmp/dojo-matrix-ops-3.almd:86:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
86 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:111:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
111 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 111:5
  --> /tmp/dojo-matrix-ops-3.almd:111:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
111 |     let ncols = list.len(list.first(m))
    |     ^
error[E012]: duplicate function 'mat_add'
  at line 26
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
26 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 33
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
33 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 43
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
43 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 48
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
48 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 51
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
51 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 58
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
58 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 68
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
68 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 73
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
73 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 76
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
76 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 83
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
83 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 93
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
93 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 98
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
98 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 101
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
101 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 108
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
108 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 118
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
118 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 123
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
123 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:4:93
  in operator +
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  |                                                                                             ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:29:93
  in operator +
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
29 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
   |                                                                                             ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:54:93
  in operator +
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
54 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
   |                                                                                             ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:79:93
  in operator +
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
79 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
   |                                                                                             ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:104:93
  in operator +
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
104 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
    |                                                                                             ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:4:88
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  |                                                                                        ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:4:93
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  |                                                                                             ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:29:88
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
29 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
   |                                                                                        ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:29:93
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
29 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
   |                                                                                             ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:54:88
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
54 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
   |                                                                                        ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:54:93
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
54 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
   |                                                                                             ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:79:88
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
79 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
   |                                                                                        ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:79:93
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
79 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
   |                                                                                             ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:104:88
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
104 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
    |                                                                                        ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:104:93
  in fn 'mat_add'
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
104 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
    |                                                                                             ^

41 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
