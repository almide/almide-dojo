# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then []
  else
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.zip(row_a, col_b), 0, fn(acc, (x, y)) => acc + int.to_int(x * y))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:2:46
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |                                              ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-0.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let ncols = list.len(list.first(m))
  |     ^^^
error: Expected function name at line 8:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:8:38
  |
8 |     list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))
  |                                      ^
error: Expected function name at line 8:63 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:8:63
  |
8 |     list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))
  |                                                               ^
error: Expected expression at line 11:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:11:15
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |               ^
error: Expected function name at line 11:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:11:17
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |                 ^
error: Expected function name at line 11:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:11:42
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |                                          ^
error: Expected expression at line 14:40 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:14:40
   |
14 |   list.fold(list.zip(row_a, col_b), 0, fn(acc, (x, y)) => acc + int.to_int(x * y))
   |                                        ^
error: Expected function name at line 14:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:14:42
   |
14 |   list.fold(list.zip(row_a, col_b), 0, fn(acc, (x, y)) => acc + int.to_int(x * y))
   |                                          ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then []
  else
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + int.to_int(x * y))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:2:46
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |                                              ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-matrix-ops-1.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let ncols = list.len(list.first(m))
  |     ^^^
error: Expected function name at line 8:38 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:8:38
  |
8 |     list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))
  |                                      ^
error: Expected function name at line 8:63 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:8:63
  |
8 |     list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))
  |                                                               ^
error: Expected expression at line 11:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:11:15
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |               ^
error: Expected function name at line 11:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:11:17
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |                 ^
error: Expected function name at line 11:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:11:42
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |                                          ^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-1.almd:14:78
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
14 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + int.to_int(x * y))
   |                                                                              ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-matrix-ops-1.almd:14:78
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
14 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + int.to_int(x * y))
   |                                                                              ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then []
  else
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + int.to_int(x * y))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:2:46
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |                                              ^
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
8 |     list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))
  |                                      ^
error: Expected function name at line 8:63 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:8:63
  |
8 |     list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))
  |                                                               ^
error: Expected expression at line 11:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:11:15
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |               ^
error: Expected function name at line 11:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:11:17
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |                 ^
error: Expected function name at line 11:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:11:42
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |                                          ^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-2.almd:14:78
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
14 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + int.to_int(x * y))
   |                                                                              ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-matrix-ops-2.almd:14:78
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
14 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + int.to_int(x * y))
   |                                                                              ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.is_empty(m) then []
  else
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + int.to_int(x * y))
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |               ^
error: Expected function name at line 2:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:17
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |                 ^
error: Expected function name at line 2:46 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:2:46
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => int.to_int(x + list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0))))
  |                                              ^
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
8 |     list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))
  |                                      ^
error: Expected function name at line 8:63 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:8:63
  |
8 |     list.map(list.range(0, ncols), fn(col_i) => list.map(m, fn(row) => list.get(row, col_i) |> option.unwrap_or(0)))
  |                                                               ^
error: Expected expression at line 11:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:11:15
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |               ^
error: Expected function name at line 11:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:11:17
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |                 ^
error: Expected function name at line 11:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:11:42
   |
11 |   list.map(m, fn(row) => list.map(row, fn(x) => int.to_int(x * s)))
   |                                          ^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-3.almd:14:78
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
14 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + int.to_int(x * y))
   |                                                                              ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-matrix-ops-3.almd:14:78
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
   |
14 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + int.to_int(x * y))
   |                                                                              ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
