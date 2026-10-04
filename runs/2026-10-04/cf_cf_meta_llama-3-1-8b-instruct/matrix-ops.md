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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
   |                                                        ^
error: Expected function name at line 10:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:10:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
   |                                                          ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:11:21
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 17:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:17:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 17:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:17:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 18:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:18:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 22:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:22:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 22:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:22:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
   |                                                        ^
error: Expected function name at line 10:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:10:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
   |                                                          ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:11:21
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 17:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:17:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 17:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:17:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 18:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:18:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 22:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:22:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 22:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:22:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
   |                                                        ^
error: Expected function name at line 10:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:10:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
   |                                                          ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:11:21
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 17:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:17:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 17:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:17:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 18:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:18:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 22:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:22:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 22:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:22:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^

11 error(s) found
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else 
    list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
   |                                                        ^
error: Expected function name at line 10:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:10:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     list.range(0, list.len(list.first(m))) |> list.map(fn(col_idx) =>
   |                                                          ^
error: Expected function name at line 11:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:11:21
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 17:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:17:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 17:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:17:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 18:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:18:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 22:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:22:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 22:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:22:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^

11 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
