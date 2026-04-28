# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:2:15
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:17
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:46
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |                                              ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let ncols = list.len(list.first(m))
  |     ^^^
error: Expected function name at line 7:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:7:32
  |
7 |     list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))
  |                                ^
error: Expected function name at line 7:55 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:7:55
  |
7 |     list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))
  |                                                       ^
error: Expected expression at line 10:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:10:15
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |               ^
error: Expected function name at line 10:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:10:17
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |                 ^
error: Expected function name at line 10:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:10:42
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |                                          ^
error: Expected expression at line 13:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:13:23
   |
13 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
   |                       ^
error: Expected function name at line 13:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:13:25
   |
13 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
   |                         ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:17
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:46
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |                                              ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let ncols = list.len(list.first(m))
  |     ^^^
error: Expected function name at line 7:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:7:32
  |
7 |     list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))
  |                                ^
error: Expected function name at line 7:55 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:7:55
  |
7 |     list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))
  |                                                       ^
error: Expected expression at line 10:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:10:15
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |               ^
error: Expected function name at line 10:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:10:17
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |                 ^
error: Expected function name at line 10:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:10:42
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |                                          ^
error: Expected expression at line 13:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:13:23
   |
13 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
   |                       ^
error: Expected function name at line 13:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:13:25
   |
13 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
   |                         ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:17
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:46
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |                                              ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let ncols = list.len(list.first(m))
  |     ^^^
error: Expected function name at line 7:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:7:32
  |
7 |     list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))
  |                                ^
error: Expected function name at line 7:55 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:7:55
  |
7 |     list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))
  |                                                       ^
error: Expected expression at line 10:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:10:15
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |               ^
error: Expected function name at line 10:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:10:17
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |                 ^
error: Expected function name at line 10:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:10:42
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |                                          ^
error: Expected expression at line 13:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:13:23
   |
13 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
   |                       ^
error: Expected function name at line 13:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:13:25
   |
13 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
   |                         ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:17
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:46
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x))
  |                                              ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let ncols = list.len(list.first(m))
  |     ^^^
error: Expected function name at line 7:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:7:32
  |
7 |     list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))
  |                                ^
error: Expected function name at line 7:55 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:7:55
  |
7 |     list.range(0, ncols).map(fn(col) -> list.map(m, fn(row) -> list.get(row, col) |> option.unwrap_or(0)))
  |                                                       ^
error: Expected expression at line 10:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:10:15
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |               ^
error: Expected function name at line 10:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:10:17
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |                 ^
error: Expected function name at line 10:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:10:42
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
   |                                          ^
error: Expected expression at line 13:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:13:23
   |
13 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
   |                       ^
error: Expected function name at line 13:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:13:25
   |
13 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)))
   |                         ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
