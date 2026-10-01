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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map(fn(i) => 
      list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
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
error: Expected expression at line 10:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:10:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 10:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:10:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:11:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 15:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:15:15
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:15:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 15:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:15:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:18:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                       ^
error: Expected function name at line 18:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:18:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                         ^

11 error(s) found
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map(fn(i) => 
      list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
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
error: Expected expression at line 10:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:10:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 10:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:10:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:11:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 15:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:15:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:15:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 16:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:16:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 20:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:20:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                       ^
error: Expected function name at line 20:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:20:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                         ^

11 error(s) found
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
      list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map(fn(i) => 
      list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map(fn(i) => 
      list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))

fn mat_multiply(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(a) || list.is_empty(b) then [] else 
    list.map(a, fn(row_a) => 
      list.map(b, fn(col_b) => mat_dot_row(row_a, col_b))
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
error: Expected function name at line 3:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:3:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |     list.map(row_a, fn(x) =>
  |                       ^
error: Expected expression at line 10:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:10:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 10:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:10:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:11:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 15:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:15:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:15:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 16:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:16:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 20:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:20:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                       ^
error: Expected function name at line 20:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:20:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                         ^
error: Expected expression at line 24:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:24:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 24:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:24:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 25:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:25:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 29:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:29:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 29:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:29:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 30:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:30:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
30 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 34:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:34:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                       ^
error: Expected function name at line 34:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:34:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                         ^
error: '||' is not valid in Almide at line 37:23
  --> /tmp/dojo-matrix-ops-2.almd:37:23
  here: if list.is_empty(a) || list.is_empty(b) then [] else
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
37 |   if list.is_empty(a) || list.is_empty(b) then [] else
   |                       ^
error: Expected function name at line 38:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:38:19
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
38 |     list.map(a, fn(row_a) =>
   |                   ^
error: Expected function name at line 39:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:39:21
  here: list.map(b, fn(col_b) => mat_dot_row(row_a, col_b))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
39 |       list.map(b, fn(col_b) => mat_dot_row(row_a, col_b))
   |                     ^
error[E012]: duplicate function 'mat_transpose'
  at line 22
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
22 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 28
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
28 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 33
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
33 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
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
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(row_a, x) |> option.unwrap_or(0)) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map(fn(i) => 
      list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))

fn mat_multiply(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(a) || list.is_empty(b) then [] else 
    list.map(a, fn(row_a) => 
      list.map(b, fn(col_b) => mat_dot_row(row_a, col_b))
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
error: Expected function name at line 3:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:3:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |     list.map(row_a, fn(x) =>
  |                       ^
error: Expected expression at line 10:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:10:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 10:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:10:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:11:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 15:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:15:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:15:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 16:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:16:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 20:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:20:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                       ^
error: Expected function name at line 20:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:20:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
20 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                         ^
error: '||' is not valid in Almide at line 23:23
  --> /tmp/dojo-matrix-ops-3.almd:23:23
  here: if list.is_empty(a) || list.is_empty(b) then [] else
  hint: Use 'or' for logical OR. Example: if a or b then ...
   |
23 |   if list.is_empty(a) || list.is_empty(b) then [] else
   |                       ^
error: Expected function name at line 24:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:24:19
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |     list.map(a, fn(row_a) =>
   |                   ^
error: Expected function name at line 25:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:25:21
  here: list.map(b, fn(col_b) => mat_dot_row(row_a, col_b))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |       list.map(b, fn(col_b) => mat_dot_row(row_a, col_b))
   |                     ^

14 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
