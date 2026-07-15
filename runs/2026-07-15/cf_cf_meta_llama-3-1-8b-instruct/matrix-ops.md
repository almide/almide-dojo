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
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.first(m) |> option.unwrap_or([]) |> list.len 
    list.map(list.range(0, ncols), fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x
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
error: Expected function name at line 3:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:3:23
  |
3 |     list.map(row_a, fn(x) =>
  |                       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:12:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |     let ncols = list.first(m) |> option.unwrap_or([]) |> list.len
   |     ^^^
error: Expected function name at line 13:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:13:38
   |
13 |     list.map(list.range(0, ncols), fn(col_idx) =>
   |                                      ^
error: Expected function name at line 14:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:14:21
   |
14 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 20:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:20:15
   |
20 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 20:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:20:17
   |
20 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 21:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:21:21
   |
21 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 25:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:25:23
   |
25 |   list.fold(row_a, 0, fn(acc, x
   |                       ^
error: Expected function name at line 25:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:25:25
   |
25 |   list.fold(row_a, 0, fn(acc, x
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
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.first(m) |> option.unwrap_or([]) |> list.len 
    list.map(list.range(0, ncols), fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x
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
error: Expected function name at line 3:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:3:23
  |
3 |     list.map(row_a, fn(x) =>
  |                       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:12:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |     let ncols = list.first(m) |> option.unwrap_or([]) |> list.len
   |     ^^^
error: Expected function name at line 13:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:13:38
   |
13 |     list.map(list.range(0, ncols), fn(col_idx) =>
   |                                      ^
error: Expected function name at line 14:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:14:21
   |
14 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 20:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:20:15
   |
20 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 20:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:20:17
   |
20 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 21:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:21:21
   |
21 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 25:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:25:23
   |
25 |   list.fold(row_a, 0, fn(acc, x
   |                       ^
error: Expected function name at line 25:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:25:25
   |
25 |   list.fold(row_a, 0, fn(acc, x
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
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.first(m) |> option.unwrap_or([]) |> list.len 
    list.map(list.range(0, ncols), fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   list.map(a, fn(row_a) =>
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:17
  |
2 |   list.map(a, fn(row_a) =>
  |                 ^
error: Expected function name at line 3:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:3:23
  |
3 |     list.map(row_a, fn(x) =>
  |                       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-2.almd:12:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |     let ncols = list.first(m) |> option.unwrap_or([]) |> list.len
   |     ^^^
error: Expected function name at line 13:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:13:38
   |
13 |     list.map(list.range(0, ncols), fn(col_idx) =>
   |                                      ^
error: Expected function name at line 14:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:14:21
   |
14 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 20:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:20:15
   |
20 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 20:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:20:17
   |
20 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 21:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:21:21
   |
21 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 25:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:25:23
   |
25 |   list.fold(row_a, 0, fn(acc, x
   |                       ^
error: Expected function name at line 25:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:25:25
   |
25 |   list.fold(row_a, 0, fn(acc, x
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
  list.map(a, fn(row_a) => 
    list.map(row_a, fn(x) => 
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or([]) |> list.get(0) |> option.unwrap_or(0) + x
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then 
    [] 
  else 
    let ncols = list.first(m) |> option.unwrap_or([]) |> list.len 
    list.map(list.range(0, ncols), fn(col_idx) => 
      list.map(m, fn(row) => 
        list.get(row, col_idx) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, fn(row) => 
    list.map(row, fn(x) => x * s)
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(row_a, 0, fn(acc, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   list.map(a, fn(row_a) =>
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:17
  |
2 |   list.map(a, fn(row_a) =>
  |                 ^
error: Expected function name at line 3:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:3:23
  |
3 |     list.map(row_a, fn(x) =>
  |                       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-3.almd:12:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |     let ncols = list.first(m) |> option.unwrap_or([]) |> list.len
   |     ^^^
error: Expected function name at line 13:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:13:38
   |
13 |     list.map(list.range(0, ncols), fn(col_idx) =>
   |                                      ^
error: Expected function name at line 14:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:14:21
   |
14 |       list.map(m, fn(row) =>
   |                     ^
error: Expected expression at line 20:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:20:15
   |
20 |   list.map(m, fn(row) =>
   |               ^
error: Expected function name at line 20:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:20:17
   |
20 |   list.map(m, fn(row) =>
   |                 ^
error: Expected function name at line 21:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:21:21
   |
21 |     list.map(row, fn(x) => x * s)
   |                     ^
error: Expected expression at line 25:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:25:23
   |
25 |   list.fold(row_a, 0, fn(acc, x
   |                       ^
error: Expected function name at line 25:25 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:25:25
   |
25 |   list.fold(row_a, 0, fn(acc, x
   |                         ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
