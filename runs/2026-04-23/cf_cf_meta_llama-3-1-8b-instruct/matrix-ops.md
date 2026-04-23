# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) || list.is_empty(b) {
    return a
  }
  list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    return m
  }
  let ncols = list.len(m) |> option.unwrap_or(0)
  list.map(list.range(0, ncols), fn(col_idx) => {
    list.map(m, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0))
  })
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, fn(acc, x) => acc + x * col_b |> list.get(0) |> option.unwrap_or(0))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: '||' is not valid in Almide at line 2:23
  --> /tmp/dojo-matrix-ops-0.almd:2:23
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   if list.is_empty(a) || list.is_empty(b) {
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got Ident 'list')
  --> /tmp/dojo-matrix-ops-0.almd:5:3
  |
5 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |   ^
error: Expected function name at line 5:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:5:17
  |
5 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                 ^
error: Expected function name at line 5:42 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:5:42
  |
5 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                                          ^
error: Expected Then at line 9:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-0.almd:9:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |   if list.is_empty(m) {
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:3 (got Ident 'list')
  --> /tmp/dojo-matrix-ops-0.almd:13:3
   |
13 |   list.map(list.range(0, ncols), fn(col_idx) => {
   |   ^
error: Expected function name at line 13:36 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:13:36
   |
13 |   list.map(list.range(0, ncols), fn(col_idx) => {
   |                                    ^
error: Expected function name at line 14:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:14:19
   |
14 |     list.map(m, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0))
   |                   ^
error: Expected expression at line 19:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:19:15
   |
19 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 23:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:23:23
   |
23 |   list.fold(row_a, 0, fn(acc, x) => acc + x * col_b |> list.get(0) |> option.unwrap_or(0))
   |                       ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-matrix-ops-0.almd:12:24
  in variable m
  hint: Check the variable name
   |
12 |   let ncols = list.len(m) |> option.unwrap_or(0)
   |                        ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:12:47
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
12 |   let ncols = list.len(m) |> option.unwrap_or(0)
   |                                               ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:12:47
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
12 |   let ncols = list.len(m) |> option.unwrap_or(0)
   |                                               ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:18:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:22:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
22 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

15 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) then list.is_empty(b) else list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then m else {
    let ncols = list.len(m) |> option.unwrap_or(0)
    list.map(list.range(0, ncols), fn(col_idx) => list.map(m, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, fn(acc, x) => acc + x * col_b |> list.get(0) |> option.unwrap_or(0))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 2:62 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:62
  |
2 |   if list.is_empty(a) then list.is_empty(b) else list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                                                              ^
error: Expected expression at line 8:36 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:8:36
  |
8 |     list.map(list.range(0, ncols), fn(col_idx) => list.map(m, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
  |                                    ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:13:15
   |
13 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 17:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:17:23
   |
17 |   list.fold(row_a, 0, fn(acc, x) => acc + x * col_b |> list.get(0) |> option.unwrap_or(0))
   |                       ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:7:49
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
7 |     let ncols = list.len(m) |> option.unwrap_or(0)
  |                                                 ^
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
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:7:49
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = list.len(m) |> option.unwrap_or(0)
  |                                                 ^
error[E001]: type mismatch in if branches: expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:7:49
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[List[Int]]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[List[Int]]) -> List[List[Int]] = if cond then step(<update>) else x
  |
7 |     let ncols = list.len(m) |> option.unwrap_or(0)
  |                                                 ^
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
  if list.is_empty(a) then list.is_empty(b) else list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then m else {
    let ncols = list.len(m) |> option.unwrap_or(0)
    list.range(0, ncols).map(fn(col_idx) => list.map(m, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, fn(acc, x) => acc + x * col_b |> list.get(0) |> option.unwrap_or(0))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:62 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:62
  |
2 |   if list.is_empty(a) then list.is_empty(b) else list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                                                              ^
error: Expected expression at line 8:30 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:8:30
  |
8 |     list.range(0, ncols).map(fn(col_idx) => list.map(m, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
  |                              ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:13:15
   |
13 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 17:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:17:23
   |
17 |   list.fold(row_a, 0, fn(acc, x) => acc + x * col_b |> list.get(0) |> option.unwrap_or(0))
   |                       ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:7:49
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
7 |     let ncols = list.len(m) |> option.unwrap_or(0)
  |                                                 ^
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
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:7:49
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = list.len(m) |> option.unwrap_or(0)
  |                                                 ^
error[E001]: type mismatch in if branches: expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:7:49
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[List[Int]]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[List[Int]]) -> List[List[Int]] = if cond then step(<update>) else x
  |
7 |     let ncols = list.len(m) |> option.unwrap_or(0)
  |                                                 ^
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

10 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) then list.is_empty(b) else list.map(a, fn(row_a) => Aad = list.map(b, fn(row_b) => row_a + row_b))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then m else {
    let ncols = list.len(m) |> option.unwrap_or(0)
    list.range(0, ncols).map(fn(col_idx) => list.map(m, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, fn(acc, x) => acc + x * col_b |> list.get(0) |> option.unwrap_or(0))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:62 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:62
  |
2 |   if list.is_empty(a) then list.is_empty(b) else list.map(a, fn(row_a) => Aad = list.map(b, fn(row_b) => row_a + row_b))
  |                                                              ^
error: Expected expression at line 8:30 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:8:30
  |
8 |     list.range(0, ncols).map(fn(col_idx) => list.map(m, fn(row) => list.get(row, col_idx) |> option.unwrap_or(0)))
  |                              ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:13:15
   |
13 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 17:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:17:23
   |
17 |   list.fold(row_a, 0, fn(acc, x) => acc + x * col_b |> list.get(0) |> option.unwrap_or(0))
   |                       ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:7:49
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
7 |     let ncols = list.len(m) |> option.unwrap_or(0)
  |                                                 ^
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
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:7:49
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = list.len(m) |> option.unwrap_or(0)
  |                                                 ^
error[E001]: type mismatch in if branches: expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:7:49
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[List[Int]]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[List[Int]]) -> List[List[Int]] = if cond then step(<update>) else x
  |
7 |     let ncols = list.len(m) |> option.unwrap_or(0)
  |                                                 ^
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

10 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
