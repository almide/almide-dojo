# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then return []
  let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
  list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y) |> option.unwrap_or(
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected ')' to close parenthesized expression opened at line 2:15
  --> /tmp/dojo-matrix-ops-0.almd:2:21
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
2 |   list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               --------------- '(' opened here
  |
2 |   list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                     ^
error: Expected ')' to close parenthesized expression opened at line 8:28
  --> /tmp/dojo-matrix-ops-0.almd:8:36
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
8 |   list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  |                            --------------- '(' opened here
  |
8 |   list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  |                                    ^
error: Expected ')' to close parenthesized expression opened at line 12:15
  --> /tmp/dojo-matrix-ops-0.almd:12:19
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
12 |   list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
   |               --------------- '(' opened here
   |
12 |   list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
   |                   ^
error: Expected ')' to close function call opened at line 16:14
  --> /tmp/dojo-matrix-ops-0.almd:16:47
  hint: Add ')' or check for a missing delimiter inside the function call
   |
16 |   list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y) |> option.unwrap_or(
   |              --------------- '(' opened here
   |
16 |   list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y) |> option.unwrap_or(
   |                                               ^^
error: Expected expression at line 18:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-0.almd:18:1
   |
18 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:1:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  |                                                                         ^
error[E001]: type mismatch in if branches: expected List[?0] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:6:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?0]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?0]) -> List[?0] = if cond then step(<update>) else x
  |
6 |   if list.is_empty(m) then []
  |   ^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:7:49
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |   let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
  |                                                 ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:7:49
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
7 |   let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
  |                                                 ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:11:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
11 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:15:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
15 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then list.new[Int]() else {
    let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
    list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y)
}

fn
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected ')' to close parenthesized expression opened at line 2:15
  --> /tmp/dojo-matrix-ops-1.almd:2:21
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
2 |   list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               --------------- '(' opened here
  |
2 |   list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                     ^
error: Expected ')' to close parenthesized expression opened at line 8:30
  --> /tmp/dojo-matrix-ops-1.almd:8:38
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
8 |     list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  |                              --------------- '(' opened here
  |
8 |     list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  |                                      ^
error: Expected ')' to close parenthesized expression opened at line 13:15
  --> /tmp/dojo-matrix-ops-1.almd:13:19
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
13 |   list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
   |               --------------- '(' opened here
   |
13 |   list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
   |                   ^
error: Expected ')' to close function call opened at line 17:14
  --> /tmp/dojo-matrix-ops-1.almd:17:47
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y)
   |              --------------- '(' opened here
   |
17 |   list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y)
   |                                               ^^
error: Expected function name at line 20:3 (got Newline '')
  --> /tmp/dojo-matrix-ops-1.almd:20:3
   |
20 | fn
   |   ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-matrix-ops-1.almd:6:36
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
6 |   if list.is_empty(m) then list.new[Int]() else {
  |                                    ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:1:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  |                                                                         ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:7:51
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
  |                                                   ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:12:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
12 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:16:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
16 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

10 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
    list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected ')' to close parenthesized expression opened at line 2:15
  --> /tmp/dojo-matrix-ops-2.almd:2:21
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
2 |   list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               --------------- '(' opened here
  |
2 |   list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                     ^
error: Expected ')' to close parenthesized expression opened at line 8:30
  --> /tmp/dojo-matrix-ops-2.almd:8:38
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
8 |     list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  |                              --------------- '(' opened here
  |
8 |     list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  |                                      ^
error: Expected ')' to close parenthesized expression opened at line 13:15
  --> /tmp/dojo-matrix-ops-2.almd:13:19
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
13 |   list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
   |               --------------- '(' opened here
   |
13 |   list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
   |                   ^
error: Expected ')' to close function call opened at line 17:14
  --> /tmp/dojo-matrix-ops-2.almd:17:47
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y)
   |              --------------- '(' opened here
   |
17 |   list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y)
   |                                               ^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:1:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  |                                                                         ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:7:51
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
  |                                                   ^
error[E001]: type mismatch in if branches: expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:7:51
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[List[Int]]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[List[Int]]) -> List[List[Int]] = if cond then step(<update>) else x
  |
7 |     let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
  |                                                   ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:12:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
12 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:16:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
16 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

9 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
    list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected ')' to close parenthesized expression opened at line 2:15
  --> /tmp/dojo-matrix-ops-3.almd:2:21
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
2 |   list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |               --------------- '(' opened here
  |
2 |   list.map(a, (row_a: List[Int]) -> list.map(row_a, (x: Int) -> list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x))
  |                     ^
error: Expected ')' to close parenthesized expression opened at line 8:30
  --> /tmp/dojo-matrix-ops-3.almd:8:38
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
8 |     list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  |                              --------------- '(' opened here
  |
8 |     list.range(0, ncols).map((col_idx: Int) -> list.map(m, (row: List[Int]) -> list.get(row, col_idx) |> option.unwrap_or(0)))
  |                                      ^
error: Expected ')' to close parenthesized expression opened at line 13:15
  --> /tmp/dojo-matrix-ops-3.almd:13:19
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
13 |   list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
   |               --------------- '(' opened here
   |
13 |   list.map(m, (row: List[Int]) -> list.map(row, (x: Int) -> x * s))
   |                   ^
error: Expected ')' to close function call opened at line 17:14
  --> /tmp/dojo-matrix-ops-3.almd:17:47
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y)
   |              --------------- '(' opened here
   |
17 |   list.reduce(row_a.zip(col_b), (acc, (x, y)) -> acc + x * y)
   |                                               ^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:1:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  |                                                                         ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:7:51
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
  |                                                   ^
error[E001]: type mismatch in if branches: expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:7:51
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[List[Int]]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[List[Int]]) -> List[List[Int]] = if cond then step(<update>) else x
  |
7 |     let ncols = list.first(m) |> option.unwrap_or(0) |> list.len
  |                                                   ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:12:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
12 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:16:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
16 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

9 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
