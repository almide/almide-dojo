# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => x + list.get(row_b, list.index_of(row_b, x))) |> list.flatten |> list.uniq))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols) |> list.map(fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)) |> list.flatten |> list.uniq)
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(list.zip(row_a, col_b), 0, fn(acc, (x, y)) => acc + x * y)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => x + list.get(row_b, list.index_of(row_b, x))) |> list.flatten |> list.uniq))
  |               ^
error: Expected expression at line 8:38 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:8:38
  |
8 |     list.range(0, ncols) |> list.map(fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)) |> list.flatten |> list.uniq)
  |                                      ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:13:15
   |
13 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 17:42 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:17:42
   |
17 |   list.reduce(list.zip(row_a, col_b), 0, fn(acc, (x, y)) => acc + x * y)
   |                                          ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:7:37
  in call to list.len()
  hint: Fix the argument type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
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
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:7:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
error[E001]: type mismatch in if branches: expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:7:37
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[List[Int]]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[List[Int]]) -> List[List[Int]] = if cond then step(<update>) else x
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:12:63
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
  --> /tmp/dojo-matrix-ops-0.almd:16:61
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
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => x + list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0))))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols) |> list.map(fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)) |> list.flatten)
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(list.zip(row_a, col_b), 0, fn(acc, (x, y)) => acc + x * y)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => x + list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0))))
  |               ^
error: Expected expression at line 8:38 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:8:38
  |
8 |     list.range(0, ncols) |> list.map(fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)) |> list.flatten)
  |                                      ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:13:15
   |
13 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 17:42 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:17:42
   |
17 |   list.reduce(list.zip(row_a, col_b), 0, fn(acc, (x, y)) => acc + x * y)
   |                                          ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:7:37
  in call to list.len()
  hint: Fix the argument type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
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
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:7:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
error[E001]: type mismatch in if branches: expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:7:37
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[List[Int]]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[List[Int]]) -> List[List[Int]] = if cond then step(<update>) else x
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
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
  list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => x + list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0))))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols) |> list.map(fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)) |> list.flatten)
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  let acc = 0
  list.fold(list.zip(row_a, col_b), acc, fn(acc, (x, y)) => acc + x * y)
}

fn mat_add(a
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => x + list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0))))
  |               ^
error: Expected expression at line 8:38 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:8:38
  |
8 |     list.range(0, ncols) |> list.map(fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)) |> list.flatten)
  |                                      ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:13:15
   |
13 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 18:42 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:18:42
   |
18 |   list.fold(list.zip(row_a, col_b), acc, fn(acc, (x, y)) => acc + x * y)
   |                                          ^
error: Expected Colon at line 21:13 (got Newline '')
  --> /tmp/dojo-matrix-ops-2.almd:21:13
   |
21 | fn mat_add(a
   |             ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:7:37
  in call to list.len()
  hint: Fix the argument type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
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
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:7:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
error[E001]: type mismatch in if branches: expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:7:37
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[List[Int]]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[List[Int]]) -> List[List[Int]] = if cond then step(<update>) else x
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
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
  --> /tmp/dojo-matrix-ops-2.almd:17:13
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
17 |   let acc = 0
   |             ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => x + list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0))))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols) |> list.map(fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)) |> list.flatten)
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  let acc = 0
  list.fold(list.zip(row_a, col_b), acc, fn(acc, (x, y)) => acc + x * y)
}

fn mat_add(a
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(b, fn(row_b) => list.map(row_a, fn(x) => x + list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0))))
  |               ^
error: Expected expression at line 8:38 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:8:38
  |
8 |     list.range(0, ncols) |> list.map(fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)) |> list.flatten)
  |                                      ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:13:15
   |
13 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 18:42 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:18:42
   |
18 |   list.fold(list.zip(row_a, col_b), acc, fn(acc, (x, y)) => acc + x * y)
   |                                          ^
error: Expected Colon at line 21:13 (got Newline '')
  --> /tmp/dojo-matrix-ops-3.almd:21:13
   |
21 | fn mat_add(a
   |             ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:7:37
  in call to list.len()
  hint: Fix the argument type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
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
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:7:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
error[E001]: type mismatch in if branches: expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:7:37
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[List[Int]]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[List[Int]]) -> List[List[Int]] = if cond then step(<update>) else x
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
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
  --> /tmp/dojo-matrix-ops-3.almd:17:13
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
17 |   let acc = 0
   |             ^

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
