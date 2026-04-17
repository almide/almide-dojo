# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) or list.is_empty(b) then return []
  if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then return []
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(list.first(a), x)) |> option.unwrap_or(0)))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then return []
  let ncols = list.len(list.first(m))
  list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, fn
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 4:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:4:15
  |
4 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(list.first(a), x)) |> option.unwrap_or(0)))
  |               ^
error: Expected expression at line 10:34 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:10:34
   |
10 |   list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
   |                                  ^
error: Expected expression at line 14:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:14:15
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:18:23
   |
18 |   list.fold(row_a, 0, fn
   |                       ^
error: Expected expression at line 20:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-0.almd:20:1
   |
20 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:3:56
  in call to list.len()
  hint: Fix the argument type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                        ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:3:83
  in call to list.len()
  hint: Fix the argument type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:9:35
  in call to list.len()
  hint: Fix the argument type
  |
9 |   let ncols = list.len(list.first(m))
  |                                   ^
error[E001]: type mismatch in if branches: expected List[?0] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:2:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?0]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?0]) -> List[?0] = if cond then step(<update>) else x
  |
2 |   if list.is_empty(a) or list.is_empty(b) then []
  |   ^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:3:56
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                        ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:3:83
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                                                   ^
error[E001]: type mismatch in if branches: expected List[?3] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:3:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?3]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?3]) -> List[?3] = if cond then step(<update>) else x
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |   ^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:3:3
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |   ^^
error[E001]: type mismatch in if branches: expected List[?4] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:8:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?4]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?4]) -> List[?4] = if cond then step(<update>) else x
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
  --> /tmp/dojo-matrix-ops-0.almd:13:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
13 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:17:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

18 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) or list.is_empty(b) then return []
  if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then return []
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(list.first(a), x)) |> option.unwrap_or(0)))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then return []
  let ncols = list.len(list.first(m))
  list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, fn(acc, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 4:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:4:15
  |
4 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(list.first(a), x)) |> option.unwrap_or(0)))
  |               ^
error: Expected expression at line 10:34 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:10:34
   |
10 |   list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
   |                                  ^
error: Expected expression at line 14:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:14:15
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:18:23
   |
18 |   list.fold(row_a, 0, fn(acc, x
   |                       ^
error: Expected expression at line 20:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:20:1
   |
20 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:3:56
  in call to list.len()
  hint: Fix the argument type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                        ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:3:83
  in call to list.len()
  hint: Fix the argument type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:9:35
  in call to list.len()
  hint: Fix the argument type
  |
9 |   let ncols = list.len(list.first(m))
  |                                   ^
error[E001]: type mismatch in if branches: expected List[?0] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:2:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?0]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?0]) -> List[?0] = if cond then step(<update>) else x
  |
2 |   if list.is_empty(a) or list.is_empty(b) then []
  |   ^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:3:56
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                        ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:3:83
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                                                   ^
error[E001]: type mismatch in if branches: expected List[?3] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:3:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?3]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?3]) -> List[?3] = if cond then step(<update>) else x
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |   ^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:3:3
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |   ^^
error[E001]: type mismatch in if branches: expected List[?4] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:8:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?4]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?4]) -> List[?4] = if cond then step(<update>) else x
  |
8 |   if list.is_empty(m) then []
  |   ^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:9:35
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
9 |   let ncols = list.len(list.first(m))
  |                                   ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:9:35
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
  --> /tmp/dojo-matrix-ops-1.almd:13:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
13 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:17:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

18 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) or list.is_empty(b) then return []
  if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then return []
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(list.first(a), x)) |> option.unwrap_or(0)))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then return []
  let ncols = list.len(list.first(m))
  list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, fn(acc, x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 4:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:4:15
  |
4 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(list.first(a), x)) |> option.unwrap_or(0)))
  |               ^
error: Expected expression at line 10:34 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:10:34
   |
10 |   list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
   |                                  ^
error: Expected expression at line 14:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:14:15
   |
14 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 18:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:18:23
   |
18 |   list.fold(row_a, 0, fn(acc, x
   |                       ^
error: Expected expression at line 20:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:20:1
   |
20 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:3:56
  in call to list.len()
  hint: Fix the argument type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                        ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:3:83
  in call to list.len()
  hint: Fix the argument type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:9:35
  in call to list.len()
  hint: Fix the argument type
  |
9 |   let ncols = list.len(list.first(m))
  |                                   ^
error[E001]: type mismatch in if branches: expected List[?0] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:2:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?0]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?0]) -> List[?0] = if cond then step(<update>) else x
  |
2 |   if list.is_empty(a) or list.is_empty(b) then []
  |   ^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:3:56
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                        ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:3:83
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |                                                                                   ^
error[E001]: type mismatch in if branches: expected List[?3] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:3:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?3]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?3]) -> List[?3] = if cond then step(<update>) else x
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |   ^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:3:3
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
3 |   if list.len(a) != list.len(b) or list.len(list.first(a)) != list.len(list.first(b)) then []
  |   ^^
error[E001]: type mismatch in if branches: expected List[?4] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:8:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?4]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?4]) -> List[?4] = if cond then step(<update>) else x
  |
8 |   if list.is_empty(m) then []
  |   ^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:9:35
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
9 |   let ncols = list.len(list.first(m))
  |                                   ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:9:35
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
  --> /tmp/dojo-matrix-ops-2.almd:13:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
13 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:17:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
17 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

18 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  let n = list.len(a)
  let m = list.len(list.first(a))
  if n != list.len(b) or m != list.len(list.first(b)) then return []
  list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(list.first(a), x)) |> option.unwrap_or(0)))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then return []
  let ncols = list.len(list.first(m))
  list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, fn(acc, x) => acc + x *
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 5:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:5:15
  |
5 |   list.map(a, fn(row_a) => list.map(row_a, fn(x) => x + list.get(b, list.index_of(list.first(a), x)) |> option.unwrap_or(0)))
  |               ^
error: Expected expression at line 11:34 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:11:34
   |
11 |   list.map(list.range(0, ncols), fn(i) => list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0)))
   |                                  ^
error: Expected expression at line 15:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:15:15
   |
15 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 19:23 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:19:23
   |
19 |   list.fold(row_a, 0, fn(acc, x) => acc + x *
   |                       ^
error: Expected expression at line 21:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-3.almd:21:1
   |
21 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:3:31
  in call to list.len()
  hint: Fix the argument type
  |
3 |   let m = list.len(list.first(a))
  |                               ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:4:51
  in call to list.len()
  hint: Fix the argument type
  |
4 |   if n != list.len(b) or m != list.len(list.first(b)) then []
  |                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:10:35
  in call to list.len()
  hint: Fix the argument type
   |
10 |   let ncols = list.len(list.first(m))
   |                                   ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:3:31
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   let m = list.len(list.first(a))
  |                               ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:4:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
4 |   if n != list.len(b) or m != list.len(list.first(b)) then []
  |                                                   ^
error[E001]: type mismatch in if branches: expected List[?2] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:4:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?2]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?2]) -> List[?2] = if cond then step(<update>) else x
  |
4 |   if n != list.len(b) or m != list.len(list.first(b)) then []
  |   ^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:4:3
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
4 |   if n != list.len(b) or m != list.len(list.first(b)) then []
  |   ^^
error[E001]: type mismatch in if branches: expected List[?3] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:9:3
  in if branches
  hint: Both branches of `if/then/else` must have the same type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce List[?3]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: List[?3]) -> List[?3] = if cond then step(<update>) else x
  |
9 |   if list.is_empty(m) then []
  |   ^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:10:35
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
10 |   let ncols = list.len(list.first(m))
   |                                   ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:10:35
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
10 |   let ncols = list.len(list.first(m))
   |                                   ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:14:63
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
  --> /tmp/dojo-matrix-ops-3.almd:18:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
18 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

17 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
