# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
// mat_add: Element-wise addition of two matrices of the same dimensions.
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, fn(row_a) => list.map(row_a, fn(x, i) => list.get(b, i) |> option.unwrap_or(0) + x))
}

// mat_transpose: Transpose rows and columns.
fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then return []
  let ncols = list.len(list.first(m))
  list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
}

// mat_scale: Multiply every element by scalar s.
fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

// mat_dot_row: Dot product of two vectors (used as helper for multiplication).
fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 3:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:3:15
  |
3 |   list.map(a, fn(row_a) => list.map(row_a, fn(x, i) => list.get(b, i) |> option.unwrap_or(0) + x))
  |               ^
error: Expected expression at line 10:34 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:10:34
   |
10 |   list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
   |                                  ^
error: Expected expression at line 15:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:15:15
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected ')' to close function call opened at line 20:12
  --> /tmp/dojo-matrix-ops-0.almd:22:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
20 |   list.fold(row
   |            --------------- '(' opened here
...
22 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:9:35
  in call to list.len()
  hint: Fix the argument type
  |
9 |   let ncols = list.len(list.first(m))
  |                                   ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:2:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
2 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  |                                                                         ^
error[E001]: type mismatch in if branches: expected List[?0] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:8:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?0]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?0]) -> List[?0] = if cond then step(<update>) else x
  |
8 |   if list.is_empty(m) then []
  |   ^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:9:35
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
9 |   let ncols = list.len(list.first(m))
  |                                   ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:9:35
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
9 |   let ncols = list.len(list.first(m))
  |                                   ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:14:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
14 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:19:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
19 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
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
  list.map(a, fn(row_a) => list.map(row_a, fn(x, i) => list.get(b, i) |> option.unwrap_or(0) + x))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then list.new[Int]() else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(col_b) - 1 - list.index_of(row_a, x)))
}

fn mat_dot(row_a: List[Int], col_b: List
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x, i) => list.get(b, i) |> option.unwrap_or(0) + x))
  |               ^
error: Expected expression at line 8:36 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:8:36
  |
8 |     list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
  |                                    ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:13:15
   |
13 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected ')' to close function parameters opened at line 20:11
  --> /tmp/dojo-matrix-ops-1.almd:22:1
  hint: Add ')' or check for a missing delimiter inside the function parameters
   |
20 | fn mat_dot(row_a: List[Int], col_b: List
   |           --------------- '(' opened here
...
22 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-matrix-ops-1.almd:6:36
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
6 |   if list.is_empty(m) then list.new[Int]() else {
  |                                    ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:7:37
  in call to list.len()
  hint: Fix the argument type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:17:104
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(col_b) - 1 - list.index_of(row_a, x)))
   |                                                                                                        ^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:17:104
  in operator *
  hint: Use numeric types (Int or Float)
   |
17 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(col_b) - 1 - list.index_of(row_a, x)))
   |                                                                                                        ^
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

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, fn(row_a) => list.map(row_a, fn(x, i) => list.get(b, i) |> option.unwrap_or(0) + x))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(col_b) - 1 - list.index_of(row_a, x)))
}

fn mat_dot(row_a: List[Int], col_b: List[Int]) ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x, i) => list.get(b, i) |> option.unwrap_or(0) + x))
  |               ^
error: Expected expression at line 8:36 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:8:36
  |
8 |     list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
  |                                    ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:13:15
   |
13 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected type name at line 20:50 (got Newline '')
  --> /tmp/dojo-matrix-ops-2.almd:20:50
   |
20 | fn mat_dot(row_a: List[Int], col_b: List[Int]) ->
   |                                                  ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:7:37
  in call to list.len()
  hint: Fix the argument type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:17:104
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(col_b) - 1 - list.index_of(row_a, x)))
   |                                                                                                        ^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:17:104
  in operator *
  hint: Use numeric types (Int or Float)
   |
17 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(col_b) - 1 - list.index_of(row_a, x)))
   |                                                                                                        ^
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

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, fn(row_a) => list.map(row_a, fn(x, i) => list.get(b, i) |> option.unwrap_or(0) + x))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(col_b) - 1 - list.index_of(row_a, x)))
}

fn mat_dot(row_a: List[Int], col_b: List[Int]) ->
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   list.map(a, fn(row_a) => list.map(row_a, fn(x, i) => list.get(b, i) |> option.unwrap_or(0) + x))
  |               ^
error: Expected expression at line 8:36 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:8:36
  |
8 |     list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
  |                                    ^
error: Expected expression at line 13:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:13:15
   |
13 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected type name at line 20:50 (got Newline '')
  --> /tmp/dojo-matrix-ops-3.almd:20:50
   |
20 | fn mat_dot(row_a: List[Int], col_b: List[Int]) ->
   |                                                  ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:7:37
  in call to list.len()
  hint: Fix the argument type
  |
7 |     let ncols = list.len(list.first(m))
  |                                     ^
error: operator '-' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:17:104
  in operator -
  hint: Use numeric types (Int or Float)
   |
17 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(col_b) - 1 - list.index_of(row_a, x)))
   |                                                                                                        ^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:17:104
  in operator *
  hint: Use numeric types (Int or Float)
   |
17 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.len(col_b) - 1 - list.index_of(row_a, x)))
   |                                                                                                        ^
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

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
