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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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
error: Expected function name at line 4:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:4:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                                  ^
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

12 error(s) found
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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
error: Expected function name at line 4:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:4:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                                  ^
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

12 error(s) found
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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

fn mat_dot_row(row_a: List[Int], col_b: List[Int
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
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                                  ^
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
error: Expected expression at line 23:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:23:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   list.map(a, fn(row_a) =>
   |               ^
error: Expected function name at line 23:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:23:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   list.map(a, fn(row_a) =>
   |                 ^
error: Expected function name at line 24:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:24:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |     list.map(row_a, fn(x) =>
   |                       ^
error: Expected function name at line 25:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:25:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                                  ^
error: Expected expression at line 31:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:31:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 31:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:31:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
31 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 32:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:32:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
32 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 36:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:36:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 36:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:36:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
36 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 37:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:37:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
37 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 41:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:41:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                       ^
error: Expected function name at line 41:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:41:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
41 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                         ^
error: Expected expression at line 44:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:44:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
44 |   list.map(a, fn(row_a) =>
   |               ^
error: Expected function name at line 44:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:44:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
44 |   list.map(a, fn(row_a) =>
   |                 ^
error: Expected function name at line 45:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:45:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
45 |     list.map(row_a, fn(x) =>
   |                       ^
error: Expected function name at line 46:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:46:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
46 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                                  ^
error: Expected expression at line 52:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:52:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
52 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 52:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:52:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
52 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 53:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:53:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
53 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 57:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:57:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
57 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 57:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:57:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
57 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 58:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:58:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
58 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 62:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:62:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
62 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                       ^
error: Expected function name at line 62:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:62:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
62 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                         ^
error: Expected expression at line 65:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:65:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
65 |   list.map(a, fn(row_a) =>
   |               ^
error: Expected function name at line 65:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:65:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
65 |   list.map(a, fn(row_a) =>
   |                 ^
error: Expected function name at line 66:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:66:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
66 |     list.map(row_a, fn(x) =>
   |                       ^
error: Expected function name at line 67:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:67:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
67 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                                  ^
error: Expected expression at line 73:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:73:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
73 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 73:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:73:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
73 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 74:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:74:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
74 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 78:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:78:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
78 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 78:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:78:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
78 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 79:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:79:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
79 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 83:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:83:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
83 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                       ^
error: Expected function name at line 83:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:83:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
83 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
   |                         ^
error: Expected expression at line 86:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:86:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
86 |   list.map(a, fn(row_a) =>
   |               ^
error: Expected function name at line 86:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:86:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
86 |   list.map(a, fn(row_a) =>
   |                 ^
error: Expected function name at line 87:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:87:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
87 |     list.map(row_a, fn(x) =>
   |                       ^
error: Expected function name at line 88:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:88:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
88 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
   |                                                                                  ^
error: Expected expression at line 94:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:94:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
94 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                        ^
error: Expected function name at line 94:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:94:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
94 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
   |                                                          ^
error: Expected function name at line 95:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:95:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
95 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 99:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:99:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
99 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 99:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:99:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
99 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 100:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:100:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
100 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected expression at line 104:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:104:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
104 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                       ^
error: Expected function name at line 104:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:104:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
104 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                         ^
error: Expected expression at line 107:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:107:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
107 |   list.map(a, fn(row_a) =>
    |               ^
error: Expected function name at line 107:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:107:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
107 |   list.map(a, fn(row_a) =>
    |                 ^
error: Expected function name at line 108:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:108:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
108 |     list.map(row_a, fn(x) =>
    |                       ^
error: Expected function name at line 109:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:109:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
109 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                                  ^
error: Expected expression at line 115:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:115:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
115 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                        ^
error: Expected function name at line 115:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:115:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
115 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                          ^
error: Expected function name at line 116:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:116:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
116 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    |                     ^
error: Expected expression at line 120:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:120:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
120 |   list.map(m, fn(row) =>
    |               ^
error: Expected function name at line 120:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:120:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
120 |   list.map(m, fn(row) =>
    |                 ^
error: Expected function name at line 121:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:121:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
121 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected expression at line 125:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:125:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
125 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                       ^
error: Expected function name at line 125:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:125:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
125 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                         ^
error: Expected expression at line 128:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:128:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
128 |   list.map(a, fn(row_a) =>
    |               ^
error: Expected function name at line 128:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:128:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
128 |   list.map(a, fn(row_a) =>
    |                 ^
error: Expected function name at line 129:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:129:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
129 |     list.map(row_a, fn(x) =>
    |                       ^
error: Expected function name at line 130:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:130:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
130 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                                  ^
error: Expected expression at line 136:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:136:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
136 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                        ^
error: Expected function name at line 136:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:136:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
136 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                          ^
error: Expected function name at line 137:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:137:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
137 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    |                     ^
error: Expected expression at line 141:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:141:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
141 |   list.map(m, fn(row) =>
    |               ^
error: Expected function name at line 141:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:141:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
141 |   list.map(m, fn(row) =>
    |                 ^
error: Expected function name at line 142:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:142:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
142 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected expression at line 146:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:146:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
146 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                       ^
error: Expected function name at line 146:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:146:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
146 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                         ^
error: Expected expression at line 149:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:149:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
149 |   list.map(a, fn(row_a) =>
    |               ^
error: Expected function name at line 149:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:149:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
149 |   list.map(a, fn(row_a) =>
    |                 ^
error: Expected function name at line 150:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:150:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
150 |     list.map(row_a, fn(x) =>
    |                       ^
error: Expected function name at line 151:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:151:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
151 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                                  ^
error: Expected expression at line 157:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:157:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
157 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                        ^
error: Expected function name at line 157:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:157:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
157 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                          ^
error: Expected function name at line 158:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:158:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
158 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    |                     ^
error: Expected expression at line 162:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:162:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
162 |   list.map(m, fn(row) =>
    |               ^
error: Expected function name at line 162:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:162:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
162 |   list.map(m, fn(row) =>
    |                 ^
error: Expected function name at line 163:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:163:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
163 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected expression at line 167:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:167:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
167 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                       ^
error: Expected function name at line 167:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:167:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
167 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                         ^
error: Expected expression at line 170:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:170:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
170 |   list.map(a, fn(row_a) =>
    |               ^
error: Expected function name at line 170:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:170:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
170 |   list.map(a, fn(row_a) =>
    |                 ^
error: Expected function name at line 171:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:171:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
171 |     list.map(row_a, fn(x) =>
    |                       ^
error: Expected function name at line 172:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:172:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
172 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                                  ^
error: Expected expression at line 178:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:178:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
178 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                        ^
error: Expected function name at line 178:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:178:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
178 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                          ^
error: Expected function name at line 179:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:179:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
179 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    |                     ^
error: Expected expression at line 183:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:183:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
183 |   list.map(m, fn(row) =>
    |               ^
error: Expected function name at line 183:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:183:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
183 |   list.map(m, fn(row) =>
    |                 ^
error: Expected function name at line 184:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:184:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
184 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected expression at line 188:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:188:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
188 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                       ^
error: Expected function name at line 188:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:188:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
188 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                         ^
error: Expected expression at line 191:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:191:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
191 |   list.map(a, fn(row_a) =>
    |               ^
error: Expected function name at line 191:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:191:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
191 |   list.map(a, fn(row_a) =>
    |                 ^
error: Expected function name at line 192:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:192:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
192 |     list.map(row_a, fn(x) =>
    |                       ^
error: Expected function name at line 193:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:193:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
193 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                                  ^
error: Expected expression at line 199:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:199:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
199 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                        ^
error: Expected function name at line 199:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:199:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
199 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                          ^
error: Expected function name at line 200:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:200:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
200 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    |                     ^
error: Expected expression at line 204:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:204:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
204 |   list.map(m, fn(row) =>
    |               ^
error: Expected function name at line 204:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:204:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
204 |   list.map(m, fn(row) =>
    |                 ^
error: Expected function name at line 205:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:205:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
205 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected expression at line 209:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:209:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
209 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                       ^
error: Expected function name at line 209:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:209:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
209 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                         ^
error: Expected expression at line 212:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:212:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
212 |   list.map(a, fn(row_a) =>
    |               ^
error: Expected function name at line 212:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:212:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
212 |   list.map(a, fn(row_a) =>
    |                 ^
error: Expected function name at line 213:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:213:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
213 |     list.map(row_a, fn(x) =>
    |                       ^
error: Expected function name at line 214:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:214:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
214 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                                  ^
error: Expected expression at line 220:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:220:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
220 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                        ^
error: Expected function name at line 220:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:220:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
220 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                          ^
error: Expected function name at line 221:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:221:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
221 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    |                     ^
error: Expected expression at line 225:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:225:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
225 |   list.map(m, fn(row) =>
    |               ^
error: Expected function name at line 225:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:225:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
225 |   list.map(m, fn(row) =>
    |                 ^
error: Expected function name at line 226:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:226:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
226 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected expression at line 230:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:230:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
230 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                       ^
error: Expected function name at line 230:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:230:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
230 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                         ^
error: Expected expression at line 233:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:233:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
233 |   list.map(a, fn(row_a) =>
    |               ^
error: Expected function name at line 233:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:233:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
233 |   list.map(a, fn(row_a) =>
    |                 ^
error: Expected function name at line 234:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:234:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
234 |     list.map(row_a, fn(x) =>
    |                       ^
error: Expected function name at line 235:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:235:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
235 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                                  ^
error: Expected expression at line 241:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:241:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
241 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                        ^
error: Expected function name at line 241:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:241:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
241 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                          ^
error: Expected function name at line 242:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:242:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
242 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    |                     ^
error: Expected expression at line 246:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:246:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
246 |   list.map(m, fn(row) =>
    |               ^
error: Expected function name at line 246:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:246:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
246 |   list.map(m, fn(row) =>
    |                 ^
error: Expected function name at line 247:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:247:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
247 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected expression at line 251:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:251:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
251 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                       ^
error: Expected function name at line 251:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:251:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
251 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                         ^
error: Expected expression at line 254:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:254:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
254 |   list.map(a, fn(row_a) =>
    |               ^
error: Expected function name at line 254:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:254:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
254 |   list.map(a, fn(row_a) =>
    |                 ^
error: Expected function name at line 255:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:255:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
255 |     list.map(row_a, fn(x) =>
    |                       ^
error: Expected function name at line 256:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:256:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
256 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                                  ^
error: Expected expression at line 262:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:262:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
262 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                        ^
error: Expected function name at line 262:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:262:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
262 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                          ^
error: Expected function name at line 263:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:263:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
263 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    |                     ^
error: Expected expression at line 267:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:267:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
267 |   list.map(m, fn(row) =>
    |               ^
error: Expected function name at line 267:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:267:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
267 |   list.map(m, fn(row) =>
    |                 ^
error: Expected function name at line 268:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:268:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
268 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected expression at line 272:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:272:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
272 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                       ^
error: Expected function name at line 272:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:272:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
272 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                         ^
error: Expected expression at line 275:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:275:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
275 |   list.map(a, fn(row_a) =>
    |               ^
error: Expected function name at line 275:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:275:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
275 |   list.map(a, fn(row_a) =>
    |                 ^
error: Expected function name at line 276:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:276:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
276 |     list.map(row_a, fn(x) =>
    |                       ^
error: Expected function name at line 277:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:277:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
277 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                                  ^
error: Expected expression at line 283:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:283:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
283 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                        ^
error: Expected function name at line 283:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:283:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
283 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                          ^
error: Expected function name at line 284:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:284:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
284 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    |                     ^
error: Expected expression at line 288:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:288:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
288 |   list.map(m, fn(row) =>
    |               ^
error: Expected function name at line 288:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:288:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
288 |   list.map(m, fn(row) =>
    |                 ^
error: Expected function name at line 289:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:289:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
289 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected expression at line 293:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:293:23
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
293 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                       ^
error: Expected function name at line 293:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:293:25
  here: list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
293 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x) |> option.unwrap_or(0)))
    |                         ^
error: Expected expression at line 296:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:296:15
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
296 |   list.map(a, fn(row_a) =>
    |               ^
error: Expected function name at line 296:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:296:17
  here: list.map(a, fn(row_a) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
296 |   list.map(a, fn(row_a) =>
    |                 ^
error: Expected function name at line 297:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:297:23
  here: list.map(row_a, fn(x) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
297 |     list.map(row_a, fn(x) =>
    |                       ^
error: Expected function name at line 298:82 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:298:82
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
298 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
    |                                                                                  ^
error: Expected expression at line 304:56 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:304:56
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
304 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                        ^
error: Expected function name at line 304:58 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:304:58
  here: list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
304 |     list.range(0, list.len(list.first(m))) |> list.map(fn(i) =>
    |                                                          ^
error: Expected function name at line 305:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:305:21
  here: list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
305 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    |                     ^
error: Expected expression at line 309:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:309:15
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
309 |   list.map(m, fn(row) =>
    |               ^
error: Expected function name at line 309:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:309:17
  here: list.map(m, fn(row) =>
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
309 |   list.map(m, fn(row) =>
    |                 ^
error: Expected function name at line 310:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:310:21
  here: list.map(row, fn(x) => x * s)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
310 |     list.map(row, fn(x) => x * s)
    |                     ^
error: Expected RBracket at line 313:49 (got Newline '')
  --> /tmp/dojo-matrix-ops-2.almd:313:49
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int
  hint: Missing ']'. Check for an unclosed '[' earlier in this expression
    |
313 | fn mat_dot_row(row_a: List[Int], col_b: List[Int
    |                                                 ^
error[E012]: duplicate function 'mat_add'
  at line 22
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
22 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 29
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
29 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 35
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
35 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 40
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
40 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 43
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
43 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 50
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
50 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 56
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
56 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 61
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
61 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 64
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
64 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 71
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
71 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 77
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
77 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 82
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | -------------------------------------- first definition of 'mat_dot_row' here
...
82 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
   | ^
error[E012]: duplicate function 'mat_add'
  at line 85
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------- first definition of 'mat_add' here
...
85 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 92
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ---------------------------------------- first definition of 'mat_transpose' here
...
92 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 98
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ------------------------------------ first definition of 'mat_scale' here
...
98 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 103
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
103 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 106
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
106 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 113
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
113 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 119
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
119 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 124
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
124 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 127
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
127 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 134
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
134 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 140
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
140 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 145
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
145 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 148
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
148 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 155
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
155 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 161
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
161 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 166
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
166 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 169
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
169 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 176
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
176 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 182
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
182 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 187
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
187 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 190
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
190 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 197
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
197 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 203
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
203 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 208
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
208 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 211
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
211 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 218
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
218 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 224
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
224 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 229
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
229 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 232
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
232 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 239
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
239 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 245
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
245 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 250
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
250 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 253
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
253 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 260
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
260 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 266
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
266 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 271
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
271 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 274
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
274 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 281
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
281 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 287
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
287 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 292
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
292 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
    | ^
error[E012]: duplicate function 'mat_add'
  at line 295
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------- first definition of 'mat_add' here
 ...
295 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 302
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
302 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 308
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ------------------------------------ first definition of 'mat_scale' here
 ...
308 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^

234 error(s) found
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
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
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(list.map(row_a, fn(_y) => 0)) |> list.get(_, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
  |                                                                                  ^
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

12 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
