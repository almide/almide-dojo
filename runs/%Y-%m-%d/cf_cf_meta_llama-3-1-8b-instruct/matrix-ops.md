# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(b, fn(row_b) => 
      list.map(row_a, fn(x) => 
        list.get(row_b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
      )
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    []
  else 
    let ncols = list.len(list.first(m)) 
    list.map(list.range(0, ncols), fn(col) => 
      list.map(m, fn(row) => 
        list.get(row, col) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:2:15
  |
2 |   list.map(a, fn(row_a) =>
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:17
  |
2 |   list.map(a, fn(row_a) =>
  |                 ^
error: Expected function name at line 3:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:3:19
  |
3 |     list.map(b, fn(row_b) =>
  |                   ^
error: Expected function name at line 4:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:4:25
  |
4 |       list.map(row_a, fn(x) =>
  |                         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:14:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |     let ncols = list.len(list.first(m))
   |     ^^^
error: Expected function name at line 15:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:15:38
   |
15 |     list.map(list.range(0, ncols), fn(col) =>
   |                                      ^
error: Expected function name at line 16:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:16:21
   |
16 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 22:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:22:15
   |
22 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 22:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:22:17
   |
22 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 23:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:23:21
   |
23 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 27:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:27:23
   |
27 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get
   |                       ^
error: Expected function name at line 27:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:27:25
   |
27 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get
   |                         ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => 
    list.map(b, fn(row_b) => 
      list.map(row_a, fn(x) => 
        list.get(row_b, list.index_of(row_a, x)) |> option.unwrap_or(0) + x
      )
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    []
  else 
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), fn(col) => 
      list.map(m, fn(row) => 
        list.get(row, col) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  |
2 |   list.map(a, fn(row_a) =>
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:17
  |
2 |   list.map(a, fn(row_a) =>
  |                 ^
error: Expected function name at line 3:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:3:19
  |
3 |     list.map(b, fn(row_b) =>
  |                   ^
error: Expected function name at line 4:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:4:25
  |
4 |       list.map(row_a, fn(x) =>
  |                         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:14:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
14 |     let ncols = list.len(list.first(m))
   |     ^^^
error: Expected function name at line 15:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:15:38
   |
15 |     list.map(list.range(0, ncols), fn(col) =>
   |                                      ^
error: Expected function name at line 16:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:16:21
   |
16 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 22:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:22:15
   |
22 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 22:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:22:17
   |
22 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 23:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:23:21
   |
23 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 27:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:27:23
   |
27 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col
   |                       ^
error: Expected function name at line 27:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:27:25
   |
27 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col
   |                         ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => list.get(row_b, list.index_of(row_a, x)) |>
    option.unwrap_or(0) + x)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), fn(col) => list.map(m, fn(row) => list.get(row, col) |>
      option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |>
    option.unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => list.get(row_b, list.index_of(row_a, x)) |>
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => list.get(row_b, list.index_of(row_a, x)) |>
  |                 ^
error: Expected function name at line 2:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:42
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => list.get(row_b, list.index_of(row_a, x)) |>
  |                                          ^
error: Expected function name at line 2:71 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:71
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => list.get(row_b, list.index_of(row_a, x)) |>
  |                                                                       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let ncols = list.len(list.first(m))
  |     ^^^
error: Expected function name at line 8:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:8:38
  |
8 |     list.map(list.range(0, ncols), fn(col) => list.map(m, fn(row) => list.get(row, col) |>
  |                                      ^
error: Expected function name at line 8:61 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:8:61
  |
8 |     list.map(list.range(0, ncols), fn(col) => list.map(m, fn(row) => list.get(row, col) |>
  |                                                             ^
error: Expected expression at line 12:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:12:15
   |
12 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 12:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:12:17
   |
12 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 12:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:12:42
   |
12 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 15:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:15:23
   |
15 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |>
   |                       ^
error: Expected function name at line 15:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:15:25
   |
15 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |>
   |                         ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => list.get(row_b, list.index_of(row_a, x)) |>
    option.unwrap_or(0) + x)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] else
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), fn(col) => list.map(m, fn(row) => list.get(row, col) |>
      option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |>
    option.unwrap_or(0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => list.get(row_b, list.index_of(row_a, x)) |>
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => list.get(row_b, list.index_of(row_a, x)) |>
  |                 ^
error: Expected function name at line 2:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:42
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => list.get(row_b, list.index_of(row_a, x)) |>
  |                                          ^
error: Expected function name at line 2:71 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:71
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => list.get(row_b, list.index_of(row_a, x)) |>
  |                                                                       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let ncols = list.len(list.first(m))
  |     ^^^
error: Expected function name at line 8:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:8:38
  |
8 |     list.map(list.range(0, ncols), fn(col) => list.map(m, fn(row) => list.get(row, col) |>
  |                                      ^
error: Expected function name at line 8:61 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:8:61
  |
8 |     list.map(list.range(0, ncols), fn(col) => list.map(m, fn(row) => list.get(row, col) |>
  |                                                             ^
error: Expected expression at line 12:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:12:15
   |
12 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected function name at line 12:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:12:17
   |
12 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                 ^
error: Expected function name at line 12:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:12:42
   |
12 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |                                          ^
error: Expected expression at line 15:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:15:23
   |
15 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |>
   |                       ^
error: Expected function name at line 15:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:15:25
   |
15 |   list.fold(row_a, 0, fn(acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |>
   |                         ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
