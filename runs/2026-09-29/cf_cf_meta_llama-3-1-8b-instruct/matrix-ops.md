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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0, list.index_of(row_a, list.get(b, 0))) |> option.unwrap_or(0) + x
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
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 18:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:18:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0, list.index_of(row_a, list.get(b, 0))) |> option.unwrap_or(0) + x
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
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:15:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 15:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:15:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:18:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 18:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:18:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0, list.index_of(row_a, list.get(b, 0))) |> option.unwrap_or(0) + x
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
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0, list.index_of(row_a, list.get(b, 0))) |> option.unwrap_or(0) + x
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
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0, list.index_of(row_a, list.get(b, 0))) |> option.unwrap_or(0) + x
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
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0, list.index_of(row_a, list.get(b, 0))) |> option.unwrap_or(0) + x
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
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0, list.index_of(row_a, list.get(b, 0))) |> option.unwrap_or(0) + x
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
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:15:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 15:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:15:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:18:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 18:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:18:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:21:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   list.map(a, fn(row_a) =>
   |               ^
error: Expected function name at line 21:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:21:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |   list.map(a, fn(row_a) =>
   |                 ^
error: Expected function name at line 22:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:22:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |     list.map(row_a, fn(x) =>
   |                       ^
error: Expected expression at line 29:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:29:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 29:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:29:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
29 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 30:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:30:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
30 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 34:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:34:15
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 34:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:34:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 34:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:34:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
34 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 37:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:37:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 37:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:37:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^
error: Expected expression at line 40:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:40:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
40 |   list.map(a, fn(row_a) =>
   |               ^
error: Expected function name at line 40:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:40:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
40 |   list.map(a, fn(row_a) =>
   |                 ^
error: Expected function name at line 41:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:41:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |     list.map(row_a, fn(x) =>
   |                       ^
error: Expected expression at line 48:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:48:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
48 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 48:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:48:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
48 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 49:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:49:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
49 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 53:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:53:15
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
53 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 53:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:53:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
53 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 53:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:53:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
53 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 56:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:56:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
56 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 56:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:56:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
56 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^
error: Expected expression at line 59:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:59:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
59 |   list.map(a, fn(row_a) =>
   |               ^
error: Expected function name at line 59:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:59:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
59 |   list.map(a, fn(row_a) =>
   |                 ^
error: Expected function name at line 60:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:60:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
60 |     list.map(row_a, fn(x) =>
   |                       ^
error: Expected expression at line 67:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:67:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
67 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 67:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:67:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
67 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 68:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:68:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
68 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 72:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:72:15
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
72 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 72:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:72:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
72 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 72:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:72:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
72 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 75:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:75:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
75 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 75:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:75:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
75 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^
error: Expected expression at line 78:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:78:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
78 |   list.map(a, fn(row_a) =>
   |               ^
error: Expected function name at line 78:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:78:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
78 |   list.map(a, fn(row_a) =>
   |                 ^
error: Expected function name at line 79:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:79:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
79 |     list.map(row_a, fn(x) =>
   |                       ^
error: Expected expression at line 86:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:86:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
86 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 86:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:86:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
86 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 87:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:87:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
87 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 91:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:91:15
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
91 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 91:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:91:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
91 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 91:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:91:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
91 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 94:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:94:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
94 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 94:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:94:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
94 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^
error[E012]: duplicate function 'mat_add'
  at line 20
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
20 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 27
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
27 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 33
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
33 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 36
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
36 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 39
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
39 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 46
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
46 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 52
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
52 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 55
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
55 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 58
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
58 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 65
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
65 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 71
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
71 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 74
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
74 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 77
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
77 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 84
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
84 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 90
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
90 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 93
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
93 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^

71 error(s) found
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0, list.index_of(row_a, list.get(b, 0))) |> option.unwrap_or(0) + x
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
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:15:17
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 15:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:15:42
  here: list.map(m, fn(row) => list.map(row, fn(x) => x * s))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:18:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 18:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:18:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^

11 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
