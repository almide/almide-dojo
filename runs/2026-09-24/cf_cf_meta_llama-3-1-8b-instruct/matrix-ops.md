# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

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
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
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
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:24:82
  in operator +
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: Use + with numeric types, String, or List
   |
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                  ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:24:105
  in call to option.unwrap_or()
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
20 |     list.map(row, (x) => x * s)
   | ---------------------------------- fn option.unwrap_or() defined here
...
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                                         ^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:24:126
  in operator *
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                                                              ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:24:149
  in call to option.unwrap_or()
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
20 |     list.map(row, (x) => x * s)
   | ---------------------------------- fn option.unwrap_or() defined here
...
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                                                                                     ^
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

9 error(s) found
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
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
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
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:24:82
  in operator +
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: Use + with numeric types, String, or List
   |
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                  ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:24:105
  in call to option.unwrap_or()
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
20 |     list.map(row, (x) => x * s)
   | ---------------------------------- fn option.unwrap_or() defined here
...
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                                         ^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:24:126
  in operator *
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                                                              ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:24:149
  in call to option.unwrap_or()
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
20 |     list.map(row, (x) => x * s)
   | ---------------------------------- fn option.unwrap_or() defined here
...
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                                                                                     ^
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

9 error(s) found
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
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
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
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:24:82
  in operator +
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: Use + with numeric types, String, or List
   |
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                  ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:24:105
  in call to option.unwrap_or()
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
20 |     list.map(row, (x) => x * s)
   | ---------------------------------- fn option.unwrap_or() defined here
...
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                                         ^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:24:126
  in operator *
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                                                              ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:24:149
  in call to option.unwrap_or()
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
20 |     list.map(row, (x) => x * s)
   | ---------------------------------- fn option.unwrap_or() defined here
...
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0))
   |                                                                                                                                                     ^
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

9 error(s) found
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
  list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
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
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:4:93
  in operator +
  here: list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(row_a, x) |> option.unwrap_or(-1)) |> option.unwrap_or(0) + x
  |                                                                                             ^
error: operator '*' requires numeric types but got Option[Int] and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:24:103
  in operator *
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: Use numeric types (Int or Float)
   |
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                                                                       ^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:24:103
  in operator +
  here: list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: Use + with numeric types, String, or List
   |
24 |   list.fold(list.range(0, list.len(row_a)), 0, (acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                                                                       ^
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

7 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
