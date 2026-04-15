# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(
    a,
    fn(row_a) -> list.map(
      row_a,
      fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    let ncols = list.len(list.first(m))
    list.map(
      list.range(0, ncols),
      fn(i) -> list.map(
        m,
        fn(row) -> list.get(row, i) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(
    m,
    fn(row) -> list.map(row, fn(x) -> x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(
    row_a,
    0,
    fn(acc, x) -> acc + x * list.get(col_b, list.index_of
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 4:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:4:5
  |
4 |     fn(row_a) -> list.map(
  |     ^
error: Expected function name at line 4:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:4:7
  |
4 |     fn(row_a) -> list.map(
  |       ^
error: Expected function name at line 6:9 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:6:9
  |
6 |       fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:14:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |     let ncols = list.len(list.first(m))
   |     ^^^
error: Expected function name at line 17:9 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:17:9
   |
17 |       fn(i) -> list.map(
   |         ^
error: Expected function name at line 19:11 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:19:11
   |
19 |         fn(row) -> list.get(row, i) |> option.unwrap_or(0)
   |           ^
error: Expected expression at line 26:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:26:5
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |     ^
error: Expected function name at line 26:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:26:7
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |       ^
error: Expected function name at line 26:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:26:32
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |                                ^
error: Expected expression at line 33:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:33:5
   |
33 |     fn(acc, x) -> acc + x * list.get(col_b, list.index_of
   |     ^
error: Expected function name at line 33:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:33:7
   |
33 |     fn(acc, x) -> acc + x * list.get(col_b, list.index_of
   |       ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(
    a,
    fn(row_a) -> list.map(
      row_a,
      fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    let ncols = list.len(list.first(m))
    list.map(
      list.range(0, ncols),
      fn(i) -> list.map(
        m,
        fn(row) -> list.get(row, i) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(
    m,
    fn(row) -> list.map(row, fn(x) -> x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(
    row_a,
    0,
    fn(acc, x) -> acc + x * list.get(col_b, list.index_of(col_b, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 4:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:4:5
  |
4 |     fn(row_a) -> list.map(
  |     ^
error: Expected function name at line 4:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:4:7
  |
4 |     fn(row_a) -> list.map(
  |       ^
error: Expected function name at line 6:9 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:6:9
  |
6 |       fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:14:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |     let ncols = list.len(list.first(m))
   |     ^^^
error: Expected function name at line 17:9 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:17:9
   |
17 |       fn(i) -> list.map(
   |         ^
error: Expected function name at line 19:11 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:19:11
   |
19 |         fn(row) -> list.get(row, i) |> option.unwrap_or(0)
   |           ^
error: Expected expression at line 26:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:26:5
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |     ^
error: Expected function name at line 26:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:26:7
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |       ^
error: Expected function name at line 26:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:26:32
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |                                ^
error: Expected expression at line 33:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:33:5
   |
33 |     fn(acc, x) -> acc + x * list.get(col_b, list.index_of(col_b, x
   |     ^
error: Expected function name at line 33:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:33:7
   |
33 |     fn(acc, x) -> acc + x * list.get(col_b, list.index_of(col_b, x
   |       ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(
    a,
    fn(row_a) -> list.map(
      row_a,
      fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    let ncols = list.len(list.first(m))
    list.map(
      list.range(0, ncols),
      fn(i) -> list.map(
        m,
        fn(row) -> list.get(row, i) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(
    m,
    fn(row) -> list.map(row, fn(x) -> x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(
    row_a,
    0,
    fn(acc, x) -> acc + x * list.get(col_b, list.index_of(col_b, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 4:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:4:5
  |
4 |     fn(row_a) -> list.map(
  |     ^
error: Expected function name at line 4:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:4:7
  |
4 |     fn(row_a) -> list.map(
  |       ^
error: Expected function name at line 6:9 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:6:9
  |
6 |       fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:14:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |     let ncols = list.len(list.first(m))
   |     ^^^
error: Expected function name at line 17:9 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:17:9
   |
17 |       fn(i) -> list.map(
   |         ^
error: Expected function name at line 19:11 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:19:11
   |
19 |         fn(row) -> list.get(row, i) |> option.unwrap_or(0)
   |           ^
error: Expected expression at line 26:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:26:5
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |     ^
error: Expected function name at line 26:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:26:7
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |       ^
error: Expected function name at line 26:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:26:32
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |                                ^
error: Expected expression at line 33:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:33:5
   |
33 |     fn(acc, x) -> acc + x * list.get(col_b, list.index_of(col_b, x
   |     ^
error: Expected function name at line 33:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:33:7
   |
33 |     fn(acc, x) -> acc + x * list.get(col_b, list.index_of(col_b, x
   |       ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(
    a,
    fn(row_a) -> list.map(
      row_a,
      fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then
    []
  else
    let ncols = list.len(list.first(m))
    list.map(
      list.range(0, ncols),
      fn(i) -> list.map(
        m,
        fn(row) -> list.get(row, i) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(
    m,
    fn(row) -> list.map(row, fn(x) -> x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(
    row_a,
    0,
    fn(acc, x) -> acc + x * list.get(col_b, list.index_of(col_b, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 4:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:4:5
  |
4 |     fn(row_a) -> list.map(
  |     ^
error: Expected function name at line 4:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:4:7
  |
4 |     fn(row_a) -> list.map(
  |       ^
error: Expected function name at line 6:9 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:6:9
  |
6 |       fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:14:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |     let ncols = list.len(list.first(m))
   |     ^^^
error: Expected function name at line 17:9 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:17:9
   |
17 |       fn(i) -> list.map(
   |         ^
error: Expected function name at line 19:11 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:19:11
   |
19 |         fn(row) -> list.get(row, i) |> option.unwrap_or(0)
   |           ^
error: Expected expression at line 26:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:26:5
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |     ^
error: Expected function name at line 26:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:26:7
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |       ^
error: Expected function name at line 26:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:26:32
   |
26 |     fn(row) -> list.map(row, fn(x) -> x * s)
   |                                ^
error: Expected expression at line 33:5 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:33:5
   |
33 |     fn(acc, x) -> acc + x * list.get(col_b, list.index_of(col_b, x
   |     ^
error: Expected function name at line 33:7 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:33:7
   |
33 |     fn(acc, x) -> acc + x * list.get(col_b, list.index_of(col_b, x
   |       ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
