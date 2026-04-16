# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.len(a) != list.len(b) || list.len(list.first(a)) != list.len(list.first(b)) {
    throw "Matrices must have the same dimensions"
  }
  list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(list.first(a), x)).unwrap_or(0)))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    return []
  }
  let ncols = list.len(list.first(m))
  list.map(list.range(0, ncols), (i: Int) => list.map(m, (row: List[Int]) => list.get(row, i).unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) => list.map(row, (x: Int) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: '||' is not valid in Almide at line 2:33
  --> /tmp/dojo-matrix-ops-0.almd:2:33
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   if list.len(a) != list.len(b) || list.len(list.first(a)) != list.len(list.first(b)) {
  |                                 ^
error: 'throw' is not valid in Almide at line 3:5
  --> /tmp/dojo-matrix-ops-0.almd:3:5
  hint: Almide has no exceptions. Use Result[T, E] with 'ok(v)' / 'err(e)'.
  |
3 |     throw "Matrices must have the same dimensions"
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got Ident 'list')
  --> /tmp/dojo-matrix-ops-0.almd:5:3
  |
5 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(list.first(a), x)).unwrap_or(0)))
  |   ^
error: Expected Then at line 9:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-0.almd:9:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |   if list.is_empty(m) {
  |                       ^
error: Expected expression at line 10:13 (got RBracket ']')
  --> /tmp/dojo-matrix-ops-0.almd:10:13
   |
10 |     return []
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:3 (got Ident 'list')
  --> /tmp/dojo-matrix-ops-0.almd:13:3
   |
13 |   list.map(list.range(0, ncols), (i: Int) => list.map(m, (row: List[Int]) => list.get(row, i).unwrap_or(0)))
   |   ^
error: Expected expression at line 22:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-0.almd:22:1
   |
22 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-matrix-ops-0.almd:12:35
  in variable m
  hint: Check the variable name
   |
12 |   let ncols = list.len(list.first(m))
   |                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[?0]
  --> /tmp/dojo-matrix-ops-0.almd:12:35
  in call to list.len()
  hint: Fix the argument type
   |
12 |   let ncols = list.len(list.first(m))
   |                                   ^
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
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:8:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  |                                                           ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[?0]
  --> /tmp/dojo-matrix-ops-0.almd:12:35
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
12 |   let ncols = list.len(list.first(m))
   |                                   ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:20:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
20 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

13 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.len(a) != list.len(b) || list.len(list.first(a)) != list.len(list.first(b)) {
    return list.map(list.range(0, list.len(a)), (i: Int) => list.map(list.range(0, list.len(a)), (j: Int) => 0))
  }
  list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(list.first(a), x)).unwrap_or(0)))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    return []
  }
  let ncols = list.len(list.first(m))
  list.map(list.range(0, ncols), (i: Int) => list.map(m, (row: List[Int]) => list.get(row, i).unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) => list.map(row, (x: Int) => x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: '||' is not valid in Almide at line 2:33
  --> /tmp/dojo-matrix-ops-1.almd:2:33
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   if list.len(a) != list.len(b) || list.len(list.first(a)) != list.len(list.first(b)) {
  |                                 ^
error: 'return' is not needed in Almide at line 3:5
  --> /tmp/dojo-matrix-ops-1.almd:3:5
  hint: The last expression in a block is the return value. Use 'guard ... else' for early returns.
  |
3 |     return list.map(list.range(0, list.len(a)), (i: Int) => list.map(list.range(0, list.len(a)), (j: Int) => 0))
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got Ident 'list')
  --> /tmp/dojo-matrix-ops-1.almd:5:3
  |
5 |   list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(list.first(a), x)).unwrap_or(0)))
  |   ^
error: Expected Then at line 9:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-1.almd:9:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |   if list.is_empty(m) {
  |                       ^
error: Expected expression at line 10:13 (got RBracket ']')
  --> /tmp/dojo-matrix-ops-1.almd:10:13
   |
10 |     return []
   |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:3 (got Ident 'list')
  --> /tmp/dojo-matrix-ops-1.almd:13:3
   |
13 |   list.map(list.range(0, ncols), (i: Int) => list.map(m, (row: List[Int]) => list.get(row, i).unwrap_or(0)))
   |   ^
error: Expected ')' to close function call opened at line 17:43
  --> /tmp/dojo-matrix-ops-1.almd:19:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   list.map(m, (row: List[Int]) => list.map(row, (x: Int) => x
   |                                           --------------- '(' opened here
...
19 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-matrix-ops-1.almd:12:35
  in variable m
  hint: Check the variable name
   |
12 |   let ncols = list.len(list.first(m))
   |                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[?0]
  --> /tmp/dojo-matrix-ops-1.almd:12:35
  in call to list.len()
  hint: Fix the argument type
   |
12 |   let ncols = list.len(list.first(m))
   |                                   ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:28:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
28 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:29:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
29 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:30:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
30 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
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
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:8:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  |                                                           ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[?0]
  --> /tmp/dojo-matrix-ops-1.almd:12:35
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
12 |   let ncols = list.len(list.first(m))
   |                                   ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:16:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

16 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.len(a) != list.len(b) || list.len(list.first(a)) != list.len(list.first(b)) {
    list.map(list.range(0, list.len(a)), (i: Int) => list.map(list.range(0, list.len(a)), (j: Int) => 0))
  } else {
    list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(list.first(a), x)).unwrap_or(0)))
  }
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (i: Int) => list.map(m, (row: List[Int]) => list.get(row, i).unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) => list.map(row, (
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: '||' is not valid in Almide at line 2:33
  --> /tmp/dojo-matrix-ops-2.almd:2:33
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   if list.len(a) != list.len(b) || list.len(list.first(a)) != list.len(list.first(b)) {
  |                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-2.almd:4:5
  |
4 |   } else {
  |     ^
error: Expected Then at line 10:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-2.almd:10:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-2.almd:12:5
   |
12 |   } else {
   |     ^
error: Expected expression at line 19:50 (got Newline '')
  --> /tmp/dojo-matrix-ops-2.almd:19:50
   |
19 |   list.map(m, (row: List[Int]) => list.map(row, (
   |                                                  ^
error: Expected expression at line 21:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:21:1
   |
21 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:30:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
30 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:31:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
31 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:32:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
32 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:9:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  |                                                           ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:18:63
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

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.len(a) != list.len(b) || list.len(list.first(a)) != list.len(list.first(b)) {
    list.map(list.range(0, list.len(a)), (i: Int) => list.map(list.range(0, list.len(a)), (j: Int) => 0))
  } else {
    list.map(a, (row_a: List[Int]) => list.map(row_a, (x: Int) => x + list.get(b, list.index_of(list.first(a), x)).unwrap_or(0)))
  }
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (i: Int) => list.map(m, (row: List[Int]) => list.get(row, i).unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) => list.map(row, (
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: '||' is not valid in Almide at line 2:33
  --> /tmp/dojo-matrix-ops-3.almd:2:33
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   if list.len(a) != list.len(b) || list.len(list.first(a)) != list.len(list.first(b)) {
  |                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-3.almd:4:5
  |
4 |   } else {
  |     ^
error: Expected Then at line 10:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-3.almd:10:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-3.almd:12:5
   |
12 |   } else {
   |     ^
error: Expected expression at line 19:50 (got Newline '')
  --> /tmp/dojo-matrix-ops-3.almd:19:50
   |
19 |   list.map(m, (row: List[Int]) => list.map(row, (
   |                                                  ^
error: Expected expression at line 21:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-3.almd:21:1
   |
21 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:30:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
30 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:31:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
31 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:32:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
32 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:9:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  |                                                           ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:18:63
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

11 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
