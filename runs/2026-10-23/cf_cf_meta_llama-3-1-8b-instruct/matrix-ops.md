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
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), fn(col) => 
      list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
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
error: Expected function name at line 3:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:3:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |     list.map(row_a, fn(x) =>
  |                       ^
error: Expected function name at line 4:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:4:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  |                                                                                  ^
error: Expected function name at line 4:123 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:4:123
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  |                                                                                                                           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:9:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |     let ncols = list.len(list.first(m))
  |     ^^^
error: 'let' is not an expression in Almide at line 9:5
  --> /tmp/dojo-matrix-ops-0.almd:9:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |     let ncols = list.len(list.first(m))
  |     ^
error: Expected function name at line 10:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:10:38
  here: list.map(list.range(0, ncols), fn(col) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.map(list.range(0, ncols), fn(col) =>
   |                                      ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:11:21
  here: list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))
   |                     ^
error: Expected expression at line 14:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:14:15
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 14:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:14:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 14:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:14:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 17:48 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:17:48
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                ^
error: Expected function name at line 17:50 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:17:50
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                  ^

14 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), fn(col) => 
      list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
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
error: Expected function name at line 3:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:3:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |     list.map(row_a, fn(x) =>
  |                       ^
error: Expected function name at line 4:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:4:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  |                                                                                  ^
error: Expected function name at line 4:123 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:4:123
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  |                                                                                                                           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:9:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |     let ncols = list.len(list.first(m))
  |     ^^^
error: 'let' is not an expression in Almide at line 9:5
  --> /tmp/dojo-matrix-ops-1.almd:9:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |     let ncols = list.len(list.first(m))
  |     ^
error: Expected function name at line 10:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:10:38
  here: list.map(list.range(0, ncols), fn(col) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.map(list.range(0, ncols), fn(col) =>
   |                                      ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:11:21
  here: list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))
   |                     ^
error: Expected expression at line 14:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:14:15
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 14:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:14:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 14:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:14:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 17:48 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:17:48
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                ^
error: Expected function name at line 17:50 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:17:50
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                  ^

14 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), fn(col) => 
      list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
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
error: Expected function name at line 3:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:3:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |     list.map(row_a, fn(x) =>
  |                       ^
error: Expected function name at line 4:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:4:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  |                                                                                  ^
error: Expected function name at line 4:123 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:4:123
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  |                                                                                                                           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:9:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |     let ncols = list.len(list.first(m))
  |     ^^^
error: 'let' is not an expression in Almide at line 9:5
  --> /tmp/dojo-matrix-ops-2.almd:9:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |     let ncols = list.len(list.first(m))
  |     ^
error: Expected function name at line 10:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:10:38
  here: list.map(list.range(0, ncols), fn(col) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.map(list.range(0, ncols), fn(col) =>
   |                                      ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:11:21
  here: list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))
   |                     ^
error: Expected expression at line 14:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:14:15
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 14:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:14:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 14:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:14:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 17:48 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:17:48
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                ^
error: Expected function name at line 17:50 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:17:50
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                  ^

14 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), fn(col) => 
      list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
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
error: Expected function name at line 3:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:3:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |     list.map(row_a, fn(x) =>
  |                       ^
error: Expected function name at line 4:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:4:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  |                                                                                  ^
error: Expected function name at line 4:123 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:4:123
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_) => 0)) |> list.get, 0) |> list.map(fn(x) => x + list.get(row_a, 0)))
  |                                                                                                                           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:9:5
  in let-in
  here: let ncols = list.len(list.first(m))
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |     let ncols = list.len(list.first(m))
  |     ^^^
error: 'let' is not an expression in Almide at line 9:5
  --> /tmp/dojo-matrix-ops-3.almd:9:5
  here: let ncols = list.len(list.first(m))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
9 |     let ncols = list.len(list.first(m))
  |     ^
error: Expected function name at line 10:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:10:38
  here: list.map(list.range(0, ncols), fn(col) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.map(list.range(0, ncols), fn(col) =>
   |                                      ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:11:21
  here: list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) => list.get(row, col) |> option.unwrap_or(0)))
   |                     ^
error: Expected expression at line 14:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:14:15
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 14:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:14:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 14:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:14:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 17:48 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:17:48
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                ^
error: Expected function name at line 17:50 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:17:50
  here: list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.fold(list.range(0, list.len(row_a)), 0, fn(acc, i) => acc + list.get(row_a, i) * list.get(col_b, i))
   |                                                  ^

14 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
