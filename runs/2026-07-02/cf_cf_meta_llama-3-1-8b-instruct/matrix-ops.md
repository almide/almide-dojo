# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  match m {
    none => none
    some([]) => []
    some(xs) => 
      list.range(0, list.len(xs)) |> 
      list.map(fn(col_idx) => 
        list.map(xs, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:46
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                                              ^
error: Expected expression at line 10:16 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:10:16
   |
10 |       list.map(fn(col_idx) =>
   |                ^
error: Expected function name at line 10:18 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:10:18
   |
10 |       list.map(fn(col_idx) =>
   |                  ^
error: Expected function name at line 11:24 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:11:24
   |
11 |         list.map(xs, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
   |                        ^
error: Expected expression at line 15:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:15:15
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:15:17
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 15:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:15:42
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:18:23
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 18:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:18:25
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
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
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  match m {
    none => none
    some([]) => []
    some(xs) => 
      list.range(0, list.len(xs)) |> 
      list.map(fn(col_idx) => 
        list.map(xs, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_transpose(m: List[List[Int
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:46
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                                              ^
error: Expected expression at line 10:16 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:10:16
   |
10 |       list.map(fn(col_idx) =>
   |                ^
error: Expected function name at line 10:18 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:10:18
   |
10 |       list.map(fn(col_idx) =>
   |                  ^
error: Expected function name at line 11:24 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:11:24
   |
11 |         list.map(xs, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
   |                        ^
error: Expected expression at line 15:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:15:15
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:15:17
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 15:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:15:42
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:18:23
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 18:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:18:25
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^
error: Expected RBracket at line 20:34 (got Newline '')
  --> /tmp/dojo-matrix-ops-1.almd:20:34
  hint: Missing ']'. Check for an unclosed '[' earlier in this expression
   |
20 | fn mat_transpose(m: List[List[Int
   |                                  ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  match m {
    none => none
    some([]) => []
    some(xs) => 
      list.range(0, list.len(xs)) |> 
      list.map(fn(col_idx) => 
        list.map(xs, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_transpose(m: List[List[Int
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:46
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                                              ^
error: Expected expression at line 10:16 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:10:16
   |
10 |       list.map(fn(col_idx) =>
   |                ^
error: Expected function name at line 10:18 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:10:18
   |
10 |       list.map(fn(col_idx) =>
   |                  ^
error: Expected function name at line 11:24 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:11:24
   |
11 |         list.map(xs, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
   |                        ^
error: Expected expression at line 15:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:15:15
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:15:17
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 15:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:15:42
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:18:23
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 18:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:18:25
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^
error: Expected RBracket at line 20:34 (got Newline '')
  --> /tmp/dojo-matrix-ops-2.almd:20:34
  hint: Missing ']'. Check for an unclosed '[' earlier in this expression
   |
20 | fn mat_transpose(m: List[List[Int
   |                                  ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  match m {
    none => none
    some([]) => []
    some(xs) => 
      list.range(0, list.len(xs)) |> 
      list.map(fn(col_idx) => 
        list.map(xs, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))

fn mat_transpose(m: List[List[Int
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:46
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                                              ^
error: Expected expression at line 10:16 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:10:16
   |
10 |       list.map(fn(col_idx) =>
   |                ^
error: Expected function name at line 10:18 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:10:18
   |
10 |       list.map(fn(col_idx) =>
   |                  ^
error: Expected function name at line 11:24 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:11:24
   |
11 |         list.map(xs, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
   |                        ^
error: Expected expression at line 15:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:15:15
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 15:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:15:17
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 15:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:15:42
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:18:23
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                       ^
error: Expected function name at line 18:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:18:25
   |
18 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                         ^
error: Expected RBracket at line 20:34 (got Newline '')
  --> /tmp/dojo-matrix-ops-3.almd:20:34
  hint: Missing ']'. Check for an unclosed '[' earlier in this expression
   |
20 | fn mat_transpose(m: List[List[Int
   |                                  ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
