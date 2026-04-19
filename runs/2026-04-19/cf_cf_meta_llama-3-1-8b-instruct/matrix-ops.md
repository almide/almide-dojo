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
  if list.len(a) != list.len(b) || list.len(a) != list.len(list.head(a)) || list.len(a) != list.len(list.head(b)) {
    return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  }
  let ncols = list.len(list.head(a))
  list.map(a, fn(row_a) => {
    list.map(row_a, fn((i, x), (j, y)) => x + y)
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    return m
  }
  let ncols = list.len(list.head(m))
  list.range(0, ncols).map(fn(i) => {
    list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  })
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got If 'if')
  --> /tmp/dojo-matrix-ops-0.almd:5:3
  |
5 |   if list.len(a) != list.len(b) || list.len(a) != list.len(list.head(a)) || list.len(a) != list.len(list.head(b)) {
  |   ^
error: Expected function name at line 6:26 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:6:26
  |
6 |     return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  |                          ^
error: Expected function name at line 6:47 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:6:47
  |
6 |     return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  |                                               ^
error: Expected function name at line 9:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:9:17
  |
9 |   list.map(a, fn(row_a) => {
  |                 ^
error: Expected function name at line 10:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:10:23
   |
10 |     list.map(row_a, fn((i, x), (j, y)) => x + y)
   |                       ^
error: Expected Then at line 15:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-0.almd:15:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
15 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:3 (got Ident 'list')
  --> /tmp/dojo-matrix-ops-0.almd:19:3
   |
19 |   list.range(0, ncols).map(fn(i) => {
   |   ^
error: Expected function name at line 19:30 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:19:30
   |
19 |   list.range(0, ncols).map(fn(i) => {
   |                              ^
error: Expected function name at line 20:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:20:19
   |
20 |     list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                   ^
error: Expected expression at line 25:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:25:15
   |
25 |   list.map(m, fn(row
   |               ^
error: Expected expression at line 27:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-0.almd:27:1
   |
27 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-matrix-ops-0.almd:18:34
  in variable m
  hint: Check the variable name
   |
18 |   let ncols = list.len(list.head(m))
   |                                  ^
error[E002]: undefined function 'list.head'
  --> /tmp/dojo-matrix-ops-0.almd:18:34
  in call to list.head()
  hint: Did you mean `list.first`?
  try:
      // list.head(...)  →  list.first(...)
      list.first(...)
   |
18 |   let ncols = list.len(list.head(m))
   |                                  ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:36:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
36 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:37:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
37 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:38:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
38 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:24:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
24 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

18 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) || list.is_empty(b) {
    return a
  }
  if list.len(a) != list.len(b) || list.len(a) != list.len(list.head(a)) || list.len(a) != list.len(list.head(b)) {
    return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  }
  let ncols = list.len(list.head(a))
  list.map(a, fn(row_a) => {
    list.map(row_a, fn(x, y) => x + y)
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    return m
  }
  let ncols = list.len(list.head(m))
  list.range(0, ncols).map(fn(i) => {
    list.map(m, fn(row) => list.get(row, ietection) |> option.unwrap_or(0))
  })
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: '||' is not valid in Almide at line 2:23
  --> /tmp/dojo-matrix-ops-1.almd:2:23
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   if list.is_empty(a) || list.is_empty(b) {
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got If 'if')
  --> /tmp/dojo-matrix-ops-1.almd:5:3
  |
5 |   if list.len(a) != list.len(b) || list.len(a) != list.len(list.head(a)) || list.len(a) != list.len(list.head(b)) {
  |   ^
error: Expected function name at line 6:26 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:6:26
  |
6 |     return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  |                          ^
error: Expected function name at line 6:47 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:6:47
  |
6 |     return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  |                                               ^
error: Expected function name at line 9:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:9:17
  |
9 |   list.map(a, fn(row_a) => {
  |                 ^
error: Expected function name at line 10:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:10:23
   |
10 |     list.map(row_a, fn(x, y) => x + y)
   |                       ^
error: Expected Then at line 15:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-1.almd:15:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
15 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:3 (got Ident 'list')
  --> /tmp/dojo-matrix-ops-1.almd:19:3
   |
19 |   list.range(0, ncols).map(fn(i) => {
   |   ^
error: Expected function name at line 19:30 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:19:30
   |
19 |   list.range(0, ncols).map(fn(i) => {
   |                              ^
error: Expected function name at line 20:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:20:19
   |
20 |     list.map(m, fn(row) => list.get(row, ietection) |> option.unwrap_or(0))
   |                   ^
error: Expected expression at line 25:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:25:15
   |
25 |   list.map(m, fn(row) => list.map(row, fn(x
   |               ^
error: Expected expression at line 27:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:27:1
   |
27 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-matrix-ops-1.almd:18:34
  in variable m
  hint: Check the variable name
   |
18 |   let ncols = list.len(list.head(m))
   |                                  ^
error[E002]: undefined function 'list.head'
  --> /tmp/dojo-matrix-ops-1.almd:18:34
  in call to list.head()
  hint: Did you mean `list.first`?
  try:
      // list.head(...)  →  list.first(...)
      list.first(...)
   |
18 |   let ncols = list.len(list.head(m))
   |                                  ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:36:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
36 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:37:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
37 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:38:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
38 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:24:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
24 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

18 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) || list.is_empty(b) {
    return a
  }
  if list.len(a) != list.len(b) || list.len(a) != list.len(list.head(a)) || list.len(a) != list.len(list.head(b)) {
    return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  }
  let ncols = list.len(list.head(a))
  list.map(a, fn(row_a) => {
    list.map(row_a, fn(x, y) => x + y)
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    return m
  }
  let ncols = list.len(list.head(m))
  list.range(0, ncols).map(fn(i) => {
    list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  })
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: '||' is not valid in Almide at line 2:23
  --> /tmp/dojo-matrix-ops-2.almd:2:23
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   if list.is_empty(a) || list.is_empty(b) {
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got If 'if')
  --> /tmp/dojo-matrix-ops-2.almd:5:3
  |
5 |   if list.len(a) != list.len(b) || list.len(a) != list.len(list.head(a)) || list.len(a) != list.len(list.head(b)) {
  |   ^
error: Expected function name at line 6:26 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:6:26
  |
6 |     return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  |                          ^
error: Expected function name at line 6:47 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:6:47
  |
6 |     return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  |                                               ^
error: Expected function name at line 9:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:9:17
  |
9 |   list.map(a, fn(row_a) => {
  |                 ^
error: Expected function name at line 10:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:10:23
   |
10 |     list.map(row_a, fn(x, y) => x + y)
   |                       ^
error: Expected Then at line 15:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-2.almd:15:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
15 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:3 (got Ident 'list')
  --> /tmp/dojo-matrix-ops-2.almd:19:3
   |
19 |   list.range(0, ncols).map(fn(i) => {
   |   ^
error: Expected function name at line 19:30 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:19:30
   |
19 |   list.range(0, ncols).map(fn(i) => {
   |                              ^
error: Expected function name at line 20:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:20:19
   |
20 |     list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                   ^
error: Expected expression at line 25:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:25:15
   |
25 |   list.map(m, fn(row) => list.map(row, fn(x)
   |               ^
error: Expected expression at line 27:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:27:1
   |
27 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-matrix-ops-2.almd:18:34
  in variable m
  hint: Check the variable name
   |
18 |   let ncols = list.len(list.head(m))
   |                                  ^
error[E002]: undefined function 'list.head'
  --> /tmp/dojo-matrix-ops-2.almd:18:34
  in call to list.head()
  hint: Did you mean `list.first`?
  try:
      // list.head(...)  →  list.first(...)
      list.first(...)
   |
18 |   let ncols = list.len(list.head(m))
   |                                  ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:36:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
36 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:37:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
37 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:38:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
38 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:24:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
24 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

18 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) || list.is_empty(b) {
    return a
  }
  if list.len(a) != list.len(b) || list.len(a) != list.len(list.head(a)) || list.len(a) != list.len(list.head(b)) {
    return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  }
  let ncols = list.len(list.head(a))
  list.map(a, fn(row_a) => {
    list.map(row_a, fn(x, y) => x + y)
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    return m
  }
  let ncols = list.len(list.head(m))
  list.range(0, ncols).map(fn(i) => {
    list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
  })
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: '||' is not valid in Almide at line 2:23
  --> /tmp/dojo-matrix-ops-3.almd:2:23
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   if list.is_empty(a) || list.is_empty(b) {
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got If 'if')
  --> /tmp/dojo-matrix-ops-3.almd:5:3
  |
5 |   if list.len(a) != list.len(b) || list.len(a) != list.len(list.head(a)) || list.len(a) != list.len(list.head(b)) {
  |   ^
error: Expected function name at line 6:26 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:6:26
  |
6 |     return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  |                          ^
error: Expected function name at line 6:47 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:6:47
  |
6 |     return list.map(a, fn(x) => list.map(x, fn(_) => 0))
  |                                               ^
error: Expected function name at line 9:17 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:9:17
  |
9 |   list.map(a, fn(row_a) => {
  |                 ^
error: Expected function name at line 10:23 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:10:23
   |
10 |     list.map(row_a, fn(x, y) => x + y)
   |                       ^
error: Expected Then at line 15:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-3.almd:15:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
15 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 19:3 (got Ident 'list')
  --> /tmp/dojo-matrix-ops-3.almd:19:3
   |
19 |   list.range(0, ncols).map(fn(i) => {
   |   ^
error: Expected function name at line 19:30 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:19:30
   |
19 |   list.range(0, ncols).map(fn(i) => {
   |                              ^
error: Expected function name at line 20:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:20:19
   |
20 |     list.map(m, fn(row) => list.get(row, i) |> option.unwrap_or(0))
   |                   ^
error: Expected expression at line 25:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:25:15
   |
25 |   list.map(m, fn(row) => list.map(row, fn(x)
   |               ^
error: Expected expression at line 27:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-3.almd:27:1
   |
27 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-matrix-ops-3.almd:18:34
  in variable m
  hint: Check the variable name
   |
18 |   let ncols = list.len(list.head(m))
   |                                  ^
error[E002]: undefined function 'list.head'
  --> /tmp/dojo-matrix-ops-3.almd:18:34
  in call to list.head()
  hint: Did you mean `list.first`?
  try:
      // list.head(...)  →  list.first(...)
      list.first(...)
   |
18 |   let ncols = list.len(list.head(m))
   |                                  ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:36:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
36 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:37:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
37 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:38:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
38 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:24:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
24 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

18 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
