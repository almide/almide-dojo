# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:2:15
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:17
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:46
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                                              ^
error: Expected expression at line 6:44 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:6:44
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                            ^
error: Expected function name at line 6:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:6:46
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                              ^
error: Expected function name at line 6:67 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:6:67
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                                                   ^
error: Expected expression at line 9:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:9:15
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |               ^
error: Expected function name at line 9:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:9:17
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |                 ^
error: Expected function name at line 9:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:9:42
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |                                          ^
error: Expected expression at line 12:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:12:23
   |
12 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 12:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:12:25
   |
12 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
  list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:17
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:46
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                                              ^
error: Expected expression at line 6:44 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:6:44
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                            ^
error: Expected function name at line 6:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:6:46
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                              ^
error: Expected function name at line 6:67 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:6:67
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                                                   ^
error: Expected expression at line 9:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:9:15
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |               ^
error: Expected function name at line 9:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:9:17
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |                 ^
error: Expected function name at line 9:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:9:42
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |                                          ^
error: Expected expression at line 12:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:12:23
   |
12 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 12:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:12:25
   |
12 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
  list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:17
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:46
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                                              ^
error: Expected expression at line 6:44 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:6:44
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                            ^
error: Expected function name at line 6:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:6:46
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                              ^
error: Expected function name at line 6:67 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:6:67
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                                                   ^
error: Expected expression at line 9:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:9:15
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |               ^
error: Expected function name at line 9:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:9:17
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |                 ^
error: Expected function name at line 9:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:9:42
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |                                          ^
error: Expected expression at line 12:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:12:23
   |
12 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 12:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:12:25
   |
12 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
  list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:17
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:46
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                                              ^
error: Expected expression at line 6:44 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:6:44
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                            ^
error: Expected function name at line 6:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:6:46
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                              ^
error: Expected function name at line 6:67 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:6:67
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) -> list.map(m, fn(row) -> list.get(row, i) |> option.unwrap_or(0)))
  |                                                                   ^
error: Expected expression at line 9:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:9:15
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |               ^
error: Expected function name at line 9:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:9:17
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |                 ^
error: Expected function name at line 9:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:9:42
  |
9 |   list.map(m, fn(row) -> list.map(row, fn(x) -> x * s))
  |                                          ^
error: Expected expression at line 12:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:12:23
   |
12 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 12:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:12:25
   |
12 |   list.fold(row_a, 0, fn(acc, x) -> acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
