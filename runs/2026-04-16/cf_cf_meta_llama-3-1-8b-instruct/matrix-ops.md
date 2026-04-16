# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(a) {
    list.map(b, fn(row) => row)
  } else if list.is_empty(b) {
    list.map(a, fn(row) => row)
  } else {
    list.zip_with(a, b, fn(row_a, row_b) =>
      list.zip_with(row_a, row_b, fn(x_a, x_b) => x_a + x_b)
    )
  }

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) {
    list.new[Int]()
  } else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map(fn(i) =>
      list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    )
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected Then at line 2:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-0.almd:2:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if list.is_empty(a) {
  |                       ^
error: Expected function name at line 3:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:3:19
  |
3 |     list.map(b, fn(row) => row)
  |                   ^
error: Expected function name at line 5:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:5:19
  |
5 |     list.map(a, fn(row) => row)
  |                   ^
error: Expected function name at line 7:27 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:7:27
  |
7 |     list.zip_with(a, b, fn(row_a, row_b) =>
  |                           ^
error: Expected function name at line 8:37 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:8:37
  |
8 |       list.zip_with(row_a, row_b, fn(x_a, x_b) => x_a + x_b)
  |                                     ^
error: Expected Then at line 13:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-0.almd:13:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
13 |   if list.is_empty(m) {
   |                       ^
error: Expected function name at line 17:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:17:32
   |
17 |     list.range(0, ncols).map(fn(i) =>
   |                                ^
error: Expected function name at line 18:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:18:21
   |
18 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 23:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:23:15
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 23:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:23:17
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 23:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:23:42
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error[E003]: undefined variable 'list'
  --> /tmp/dojo-matrix-ops-0.almd:26:3
  in variable list
  hint: Check the variable name
   |
26 |   list
   |   ^^^^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(a) {
    list.map(b, fn(row) => row)
  } else if list.is_empty(b) {
    list.map(a, fn(row) => row)
  } else {
    list.zip_with(a, b, fn(row_a, row_b) =>
      list.zip_with(row_a, row_b, fn(x_a, x_b) => x_a + x_b)
    )
  }

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) {
    list.new[Int]()
  } else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map(fn(i) =>
      list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    )
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a,
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected Then at line 2:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-1.almd:2:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if list.is_empty(a) {
  |                       ^
error: Expected function name at line 3:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:3:19
  |
3 |     list.map(b, fn(row) => row)
  |                   ^
error: Expected function name at line 5:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:5:19
  |
5 |     list.map(a, fn(row) => row)
  |                   ^
error: Expected function name at line 7:27 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:7:27
  |
7 |     list.zip_with(a, b, fn(row_a, row_b) =>
  |                           ^
error: Expected function name at line 8:37 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:8:37
  |
8 |       list.zip_with(row_a, row_b, fn(x_a, x_b) => x_a + x_b)
  |                                     ^
error: Expected Then at line 13:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-1.almd:13:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
13 |   if list.is_empty(m) {
   |                       ^
error: Expected function name at line 17:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:17:32
   |
17 |     list.range(0, ncols).map(fn(i) =>
   |                                ^
error: Expected function name at line 18:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:18:21
   |
18 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 23:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:23:15
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 23:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:23:17
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 23:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:23:42
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 28:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:28:1
   |
28 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(a) {
    list.map(b, fn(row) => row)
  } else if list.is_empty(b) {
    list.map(a, fn(row) => row)
  } else {
    list.zip_with(a, b, fn(row_a, row_b) =>
      list.zip_with(row_a, row_b, fn(x_a, x_b) => x_a + x_b)
    )
  }

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) {
    list.new[Int]()
  } else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map(fn(i) =>
      list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    )
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a,
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected Then at line 2:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-2.almd:2:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if list.is_empty(a) {
  |                       ^
error: Expected function name at line 3:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:3:19
  |
3 |     list.map(b, fn(row) => row)
  |                   ^
error: Expected function name at line 5:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:5:19
  |
5 |     list.map(a, fn(row) => row)
  |                   ^
error: Expected function name at line 7:27 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:7:27
  |
7 |     list.zip_with(a, b, fn(row_a, row_b) =>
  |                           ^
error: Expected function name at line 8:37 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:8:37
  |
8 |       list.zip_with(row_a, row_b, fn(x_a, x_b) => x_a + x_b)
  |                                     ^
error: Expected Then at line 13:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-2.almd:13:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
13 |   if list.is_empty(m) {
   |                       ^
error: Expected function name at line 17:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:17:32
   |
17 |     list.range(0, ncols).map(fn(i) =>
   |                                ^
error: Expected function name at line 18:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:18:21
   |
18 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 23:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:23:15
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 23:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:23:17
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 23:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:23:42
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 28:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:28:1
   |
28 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(a) {
    list.map(b, fn(row) => row)
  } else if list.is_empty(b) {
    list.map(a, fn(row) => row)
  } else {
    list.zip_with(a, b, fn(row_a, row_b) =>
      list.zip_with(row_a, row_b, fn(x_a, x_b) => x_a + x_b)
    )
  }

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) {
    list.new[Int]()
  } else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map(fn(i) =>
      list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
    )
  }

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(row_a,
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected Then at line 2:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-3.almd:2:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if list.is_empty(a) {
  |                       ^
error: Expected function name at line 3:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:3:19
  |
3 |     list.map(b, fn(row) => row)
  |                   ^
error: Expected function name at line 5:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:5:19
  |
5 |     list.map(a, fn(row) => row)
  |                   ^
error: Expected function name at line 7:27 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:7:27
  |
7 |     list.zip_with(a, b, fn(row_a, row_b) =>
  |                           ^
error: Expected function name at line 8:37 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:8:37
  |
8 |       list.zip_with(row_a, row_b, fn(x_a, x_b) => x_a + x_b)
  |                                     ^
error: Expected Then at line 13:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-3.almd:13:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
13 |   if list.is_empty(m) {
   |                       ^
error: Expected function name at line 17:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:17:32
   |
17 |     list.range(0, ncols).map(fn(i) =>
   |                                ^
error: Expected function name at line 18:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:18:21
   |
18 |       list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 23:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:23:15
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 23:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:23:17
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 23:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:23:42
   |
23 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 28:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-3.almd:28:1
   |
28 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
