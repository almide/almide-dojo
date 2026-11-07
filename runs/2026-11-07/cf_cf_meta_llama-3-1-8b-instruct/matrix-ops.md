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
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)
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
  --> /tmp/dojo-matrix-ops-0.almd:4:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  |                                                        ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:4:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) =>
  |           ^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 11:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b,
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:36:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
36 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 36:5
  --> /tmp/dojo-matrix-ops-1.almd:36:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:61:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
61 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 61:5
  --> /tmp/dojo-matrix-ops-1.almd:61:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
61 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:86:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
86 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 86:5
  --> /tmp/dojo-matrix-ops-1.almd:86:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
86 |     let ncols = list.len(list.first(m))
   |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:111:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
111 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 111:5
  --> /tmp/dojo-matrix-ops-1.almd:111:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
111 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:136:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
136 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 136:5
  --> /tmp/dojo-matrix-ops-1.almd:136:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
136 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:161:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
161 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 161:5
  --> /tmp/dojo-matrix-ops-1.almd:161:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
161 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:186:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
186 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 186:5
  --> /tmp/dojo-matrix-ops-1.almd:186:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
186 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:211:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
211 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 211:5
  --> /tmp/dojo-matrix-ops-1.almd:211:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
211 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:236:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
236 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 236:5
  --> /tmp/dojo-matrix-ops-1.almd:236:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
236 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:261:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
261 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 261:5
  --> /tmp/dojo-matrix-ops-1.almd:261:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
261 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:286:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
286 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 286:5
  --> /tmp/dojo-matrix-ops-1.almd:286:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
286 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:311:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
311 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 311:5
  --> /tmp/dojo-matrix-ops-1.almd:311:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
311 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:336:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
336 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 336:5
  --> /tmp/dojo-matrix-ops-1.almd:336:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
336 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:361:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
361 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 361:5
  --> /tmp/dojo-matrix-ops-1.almd:361:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
361 |     let ncols = list.len(list.first(m))
    |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:386:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
    |
386 |     let ncols = list.len(list.first(m))
    |     ^^^
error: 'let' is not an expression in Almide at line 386:5
  --> /tmp/dojo-matrix-ops-1.almd:386:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
386 |     let ncols = list.len(list.first(m))
    |     ^
error: Expected expression at line 401:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:401:1
  here: test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
401 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
    | ^
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
error[E012]: duplicate function 'mat_add'
  at line 126
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
126 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 133
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
133 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 143
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
143 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 148
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
148 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 151
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
151 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 158
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
158 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 168
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
168 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 173
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
173 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 176
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
176 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 183
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
183 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 193
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
193 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 198
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
198 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 201
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
201 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 208
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
208 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 218
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
218 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 223
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
223 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 226
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
226 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 233
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
233 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 243
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
243 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 248
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
248 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 251
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
251 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 258
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
258 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 268
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
268 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 273
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
273 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 276
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
276 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 283
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
283 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 293
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
293 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 298
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
298 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 301
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
301 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 308
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
308 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 318
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
318 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 323
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
323 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 326
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
326 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 333
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
333 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 343
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
343 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 348
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
348 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 351
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
351 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 358
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
358 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 368
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
368 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 373
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
373 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 376
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
376 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 383
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
383 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 393
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
393 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 398
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
398 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:4:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:29:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
   |
29 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
   |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:54:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
   |
54 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
   |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:79:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
   |
79 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
   |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:104:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
104 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:129:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
129 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:154:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
154 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:179:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
179 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:204:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
204 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:229:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
229 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:254:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
254 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:279:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
279 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:304:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
304 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:329:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
329 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:354:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
354 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:379:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
379 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                        ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:4:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) =>
  |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:29:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
   |
29 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
   |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:27:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
   |
27 |   list.map(a, (row_a) =>
   |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:54:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
   |
54 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
   |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:52:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
   |
52 |   list.map(a, (row_a) =>
   |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:79:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
   |
79 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
   |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:77:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
   |
77 |   list.map(a, (row_a) =>
   |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:104:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
104 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:102:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
102 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:129:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
129 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:127:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
127 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:154:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
154 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:152:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
152 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:179:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
179 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:177:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
177 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:204:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
204 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:202:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
202 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:229:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
229 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:227:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
227 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:254:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
254 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:252:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
252 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:279:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
279 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:277:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
277 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:304:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
304 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:302:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
302 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:329:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
329 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:327:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
327 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:354:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
354 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:352:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
352 |   list.map(a, (row_a) =>
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:379:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
379 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:377:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
    |
377 |   list.map(a, (row_a) =>
    |           ^

141 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 11:5
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)
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
  --> /tmp/dojo-matrix-ops-2.almd:4:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  |                                                        ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) =>
  |           ^

5 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 11:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(row_a, (x) => 
      list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(a) || list.is_empty(b) then [] 
  else 
    list.map(a, (row_a) => 
      if list.is_empty(row_a) || list.is_empty(list.get(b, list.index_of(row_a, 0) ?? 0)) then [] 
      else 
        list.map(row_a, (x) => 
          list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
        )
    )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), (i) => 
      list.map(m, (row) => 
        list.get(row, i) ?? 0
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) ?? 0) ?? 0)
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
error: '||' is not valid in Almide
  --> /tmp/dojo-matrix-ops-3.almd:27:23
  in operator
  here: if list.is_empty(a) || list.is_empty(b) then []
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
27 |   if list.is_empty(a) || list.is_empty(b) then []
   |                       ^^
error: '||' is not valid in Almide
  --> /tmp/dojo-matrix-ops-3.almd:30:31
  in operator
  here: if list.is_empty(row_a) || list.is_empty(list.get(b, list.index_of(row_a, 0) ?? 0)) then []
  hint: Use 'or' for logical OR. Example: if a or b then ...
  try:
      a or b
   |
30 |       if list.is_empty(row_a) || list.is_empty(list.get(b, list.index_of(row_a, 0) ?? 0)) then []
   |                               ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:40:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
40 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 40:5
  --> /tmp/dojo-matrix-ops-3.almd:40:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
40 |     let ncols = list.len(list.first(m))
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
  at line 37
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
37 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 47
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
47 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 52
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
52 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:4:56
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  |                                                        ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:30:48
  in call to list.is_empty()
  here: if list.is_empty(row_a) || list.is_empty(list.get(b, list.index_of(row_a, 0) ?? 0)) then []
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
30 |       if list.is_empty(row_a) || list.is_empty(list.get(b, list.index_of(row_a, 0) ?? 0)) then []
   |                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:33:60
  in operator +
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
   |
33 |           list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
   |                                                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:4:52
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  |                                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) =>
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) =>
  |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:33:56
  in ?? fallback
  here: list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
  hint: Fix the expression type or change the expected type
   |
33 |           list.get(b, list.index_of(row_a, x) ?? 0) ?? 0 + x
   |                                                        ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:27:48
  in fn 'mat_add'
  here: if list.is_empty(a) || list.is_empty(b) then []
  hint: Fix the expression type or change the expected type
   |
27 |   if list.is_empty(a) || list.is_empty(b) then []
   |                                                ^

17 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 11:5
  parse error: '||' is not valid in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
