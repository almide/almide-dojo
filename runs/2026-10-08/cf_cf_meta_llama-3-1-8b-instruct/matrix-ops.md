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
  list.map(a, fn(row_a) => 
    list.map(b, fn(row_b) => 
      list.map(row_a, fn(x) => 
        list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0) + x
      )
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => 
    acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0)
  )
```

**Diagnostic:**

```
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:2:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   list.map(a, fn(row_a) =>
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   list.map(a, fn(row_a) =>
  |                 ^
error: Expected function name at line 3:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:3:19
  here: list.map(b, fn(row_b) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |     list.map(b, fn(row_b) =>
  |                   ^
error: Expected function name at line 4:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:4:25
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.map(row_a, fn(x) =>
  |                         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:13:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 13:5
  --> /tmp/dojo-matrix-ops-0.almd:13:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     let ncols = list.len(list.first(m))
   |     ^
error: Expected function name at line 14:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:14:38
  here: list.map(list.range(0, ncols), fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |     list.map(list.range(0, ncols), fn(col_idx) =>
   |                                      ^
error: Expected function name at line 15:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:15:21
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:21:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 21:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:21:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 22:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:22:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 26:48 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:26:48
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
26 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
   |                                                ^
error: Expected function name at line 26:50 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:26:50
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
26 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
   |                                                  ^

13 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(b, fn(row_b) => 
      list.map(row_a, fn(x) => 
        list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0) + x
      )
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => 
    acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0)
  )
```

**Diagnostic:**

```
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   list.map(a, fn(row_a) =>
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   list.map(a, fn(row_a) =>
  |                 ^
error: Expected function name at line 3:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:3:19
  here: list.map(b, fn(row_b) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |     list.map(b, fn(row_b) =>
  |                   ^
error: Expected function name at line 4:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:4:25
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.map(row_a, fn(x) =>
  |                         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:13:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 13:5
  --> /tmp/dojo-matrix-ops-1.almd:13:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     let ncols = list.len(list.first(m))
   |     ^
error: Expected function name at line 14:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:14:38
  here: list.map(list.range(0, ncols), fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |     list.map(list.range(0, ncols), fn(col_idx) =>
   |                                      ^
error: Expected function name at line 15:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:15:21
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:21:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 21:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:21:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 22:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:22:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 26:48 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:26:48
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
26 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
   |                                                ^
error: Expected function name at line 26:50 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:26:50
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
26 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
   |                                                  ^

13 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(b, fn(row_b) => 
      list.map(row_a, fn(x) => 
        list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0) + x
      )
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => 
    acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => 
    acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0)
  )
```

**Diagnostic:**

```
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   list.map(a, fn(row_a) =>
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   list.map(a, fn(row_a) =>
  |                 ^
error: Expected function name at line 3:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:3:19
  here: list.map(b, fn(row_b) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |     list.map(b, fn(row_b) =>
  |                   ^
error: Expected function name at line 4:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:4:25
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.map(row_a, fn(x) =>
  |                         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:13:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 13:5
  --> /tmp/dojo-matrix-ops-2.almd:13:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     let ncols = list.len(list.first(m))
   |     ^
error: Expected function name at line 14:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:14:38
  here: list.map(list.range(0, ncols), fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |     list.map(list.range(0, ncols), fn(col_idx) =>
   |                                      ^
error: Expected function name at line 15:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:15:21
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:21:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 21:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:21:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 22:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:22:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 26:48 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:26:48
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
26 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
   |                                                ^
error: Expected function name at line 26:50 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:26:50
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
26 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
   |                                                  ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:33:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
33 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 33:5
  --> /tmp/dojo-matrix-ops-2.almd:33:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
33 |     let ncols = list.len(list.first(m))
   |     ^
error: Expected function name at line 34:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:34:38
  here: list.map(list.range(0, ncols), fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |     list.map(list.range(0, ncols), fn(col_idx) =>
   |                                      ^
error: Expected function name at line 35:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:35:21
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
35 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 41:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:41:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 41:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:41:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 42:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:42:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
42 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 46:48 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:46:48
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
46 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
   |                                                ^
error: Expected function name at line 46:50 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:46:50
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
46 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
   |                                                  ^
error[E012]: duplicate function 'mat_transpose'
  at line 30
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
10 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
30 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 40
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
40 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 45
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
25 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
45 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^

25 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(b, fn(row_b) => 
      list.map(row_a, fn(x) => 
        list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0) + x
      )
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => 
    acc + list.get(row_a, i) |> option.unwrap_or(0) * list.get(col_b, i) |> option.unwrap_or(0)
  )
```

**Diagnostic:**

```
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   list.map(a, fn(row_a) =>
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   list.map(a, fn(row_a) =>
  |                 ^
error: Expected function name at line 3:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:3:19
  here: list.map(b, fn(row_b) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |     list.map(b, fn(row_b) =>
  |                   ^
error: Expected function name at line 4:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:4:25
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.map(row_a, fn(x) =>
  |                         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:13:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |     let ncols = list.len(list.first(m))
   |     ^^^
error: 'let' is not an expression in Almide at line 13:5
  --> /tmp/dojo-matrix-ops-3.almd:13:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     let ncols = list.len(list.first(m))
   |     ^
error: Expected function name at line 14:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:14:38
  here: list.map(list.range(0, ncols), fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |     list.map(list.range(0, ncols), fn(col_idx) =>
   |                                      ^
error: Expected function name at line 15:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:15:21
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:21:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 21:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:21:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 22:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:22:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 26:48 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:26:48
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
26 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
   |                                                ^
error: Expected function name at line 26:50 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:26:50
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
26 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) =>
   |                                                  ^

13 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
