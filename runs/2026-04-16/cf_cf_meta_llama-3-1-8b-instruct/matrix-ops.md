# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
 .existsSync(m) =>
    list.range(0, list.len(m)) |> list.map(fn(i) =>
      list.range(0, list.len(m)).map(fn(j) => list.get(m, j).unwrap_or(0).get(m, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) -> list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:2:15
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:17
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:46
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) -> x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                              ^
error: Expected expression at line 5:2 (got Dot '.')
  --> /tmp/dojo-matrix-ops-0.almd:5:2
  |
5 |  .existsSync(m) =>
  |  ^
error: Expected function name at line 6:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:6:46
  |
6 |     list.range(0, list.len(m)) |> list.map(fn(i) =>
  |                                              ^
error: Expected function name at line 7:40 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:7:40
  |
7 |       list.range(0, list.len(m)).map(fn(j) => list.get(m, j).unwrap_or(0).get(m, i).unwrap_or(0)))
  |                                        ^
error: Expected expression at line 10:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:10:15
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 10:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:10:17
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 10:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:10:42
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 13:39 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:13:39
   |
13 |   list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
   |                                       ^
error: Expected function name at line 13:41 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:13:41
   |
13 |   list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
   |                                         ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) -> list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(m)).map(fn(i) =>
      list.range(0, list.len(m)).map(fn(j) => list.get(m, j).unwrap_or(0).get(m, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) -> list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:17
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:46
  |
2 |   list.map(a, fn(row_a) -> list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                              ^
error: Expected expression at line 6:36 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:6:36
  |
6 |     list.range(0, list.len(m)).map(fn(i) =>
  |                                    ^
error: Expected function name at line 6:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:6:38
  |
6 |     list.range(0, list.len(m)).map(fn(i) =>
  |                                      ^
error: Expected function name at line 7:40 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:7:40
  |
7 |       list.range(0, list.len(m)).map(fn(j) => list.get(m, j).unwrap_or(0).get(m, i).unwrap_or(0)))
  |                                        ^
error: Expected expression at line 10:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:10:15
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 10:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:10:17
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 10:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:10:42
   |
10 |   list.map(m, fn(row) -> list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 13:39 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:13:39
   |
13 |   list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
   |                                       ^
error: Expected function name at line 13:41 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:13:41
   |
13 |   list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
   |                                         ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(m)).map(fn(i) =>
      list.range(0, list.len(m)).map(fn(j) => list.get(m, j).unwrap_or(0).get(m, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:46
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                              ^
error: Expected expression at line 6:36 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:6:36
  |
6 |     list.range(0, list.len(m)).map(fn(i) =>
  |                                    ^
error: Expected function name at line 6:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:6:38
  |
6 |     list.range(0, list.len(m)).map(fn(i) =>
  |                                      ^
error: Expected function name at line 7:40 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:7:40
  |
7 |       list.range(0, list.len(m)).map(fn(j) => list.get(m, j).unwrap_or(0).get(m, i).unwrap_or(0)))
  |                                        ^
error: Expected expression at line 10:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:10:15
   |
10 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 10:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:10:17
   |
10 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 10:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:10:42
   |
10 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 13:39 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:13:39
   |
13 |   list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
   |                                       ^
error: Expected function name at line 13:41 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:13:41
   |
13 |   list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
   |                                         ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then [] else
    list.range(0, list.len(m)).map(fn(i) =>
      list.range(0, list.len(m)).map(fn(j) => list.get(m, j).unwrap_or(0).get(m, i).unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:46
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(a, row_a)).unwrap_or(0)))
  |                                              ^
error: Expected expression at line 6:36 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:6:36
  |
6 |     list.range(0, list.len(m)).map(fn(i) =>
  |                                    ^
error: Expected function name at line 6:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:6:38
  |
6 |     list.range(0, list.len(m)).map(fn(i) =>
  |                                      ^
error: Expected function name at line 7:40 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:7:40
  |
7 |       list.range(0, list.len(m)).map(fn(j) => list.get(m, j).unwrap_or(0).get(m, i).unwrap_or(0)))
  |                                        ^
error: Expected expression at line 10:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:10:15
   |
10 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 10:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:10:17
   |
10 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 10:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:10:42
   |
10 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 13:39 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:13:39
   |
13 |   list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
   |                                       ^
error: Expected function name at line 13:41 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:13:41
   |
13 |   list.reduce(list.zip(row_a, col_b), fn(acc, (x, y)) => acc + x * y)
   |                                         ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
