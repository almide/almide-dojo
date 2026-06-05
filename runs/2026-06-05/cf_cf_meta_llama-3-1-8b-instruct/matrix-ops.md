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
    []
  } else {
    list.map(a, (row_a: List[Int]) => {
      list.map(b, (row_b: List[Int]) => {
        list.map(row_a, (x: Int) => {
          list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0) + x
        })
      })
    })
  }
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map((col_idx: Int) => {
      list.map(m, (row: List[Int]) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) => {
    list.map(row, (x: Int) =>
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-0.almd:4:5
  |
4 |   } else {
  |     ^
error: Expected Then at line 16:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-0.almd:16:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-0.almd:18:5
   |
18 |   } else {
   |     ^
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-0.almd:32:1
   |
32 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error: Expected ')' to close function call opened at line 29:11
  --> /tmp/dojo-matrix-ops-0.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |   list.map(m, (row: List[Int]) => {
   |           --------------- '(' opened here
...
33 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
   | ^^^^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:41:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
41 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:42:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
42 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:43:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
43 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
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
  --> /tmp/dojo-matrix-ops-0.almd:15:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
15 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   |                                                           ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:28:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
28 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) || list.is_empty(b) {
    []
  } else {
    list.map(a, (row_a: List[Int]) => {
      list.map(b, (row_b: List[Int]) => {
        list.map(row_a, (x: Int) => {
          list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0) + x
        })
      })
    })
  }
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map((col_idx: Int) => {
      list.map(m, (row: List[Int]) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) => {
    list.map(row, (x: Int) => x * s
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-1.almd:4:5
  |
4 |   } else {
  |     ^
error: Expected Then at line 16:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-1.almd:16:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-1.almd:18:5
   |
18 |   } else {
   |     ^
error: Expected ')' to close function call opened at line 30:13
  --> /tmp/dojo-matrix-ops-1.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     list.map(row, (x: Int) => x * s
   |             --------------- '(' opened here
...
32 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: Expected ')' to close function call opened at line 29:11
  --> /tmp/dojo-matrix-ops-1.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |   list.map(m, (row: List[Int]) => {
   |           --------------- '(' opened here
...
33 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
   | ^^^^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:41:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
41 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:42:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
42 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:43:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
43 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
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
  --> /tmp/dojo-matrix-ops-1.almd:15:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
15 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   |                                                           ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:28:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
28 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) || list.is_empty(b) {
    []
  } else {
    list.map(a, (row_a: List[Int]) => {
      list.map(b, (row_b: List[Int]) => {
        list.map(row_a, (x: Int) => {
          list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0) + x
        })
      })
    })
  }
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map((col_idx: Int) => {
      list.map(m, (row: List[Int]) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) => {
    list.map(row, (x: Int) => x * s
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-2.almd:4:5
  |
4 |   } else {
  |     ^
error: Expected Then at line 16:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-2.almd:16:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-2.almd:18:5
   |
18 |   } else {
   |     ^
error: Expected ')' to close function call opened at line 30:13
  --> /tmp/dojo-matrix-ops-2.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     list.map(row, (x: Int) => x * s
   |             --------------- '(' opened here
...
32 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: Expected ')' to close function call opened at line 29:11
  --> /tmp/dojo-matrix-ops-2.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |   list.map(m, (row: List[Int]) => {
   |           --------------- '(' opened here
...
33 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
   | ^^^^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:41:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
41 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:42:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
42 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:43:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
43 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
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
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:15:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
15 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   |                                                           ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:28:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
28 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(a) || list.is_empty(b) {
    []
  } else {
    list.map(a, (row_a: List[Int]) => {
      list.map(b, (row_b: List[Int]) => {
        list.map(row_a, (x: Int) => {
          list.get(row_b, list.index_of(row_b, x)) |> option.unwrap_or(0) + x
        })
      })
    })
  }
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols).map((col_idx: Int) => {
      list.map(m, (row: List[Int]) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int]) => {
    list.map(row, (x: Int) => x * s
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-3.almd:4:5
  |
4 |   } else {
  |     ^
error: Expected Then at line 16:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-3.almd:16:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
16 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-3.almd:18:5
   |
18 |   } else {
   |     ^
error: Expected ')' to close function call opened at line 30:13
  --> /tmp/dojo-matrix-ops-3.almd:32:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
30 |     list.map(row, (x: Int) => x * s
   |             --------------- '(' opened here
...
32 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error: Expected ')' to close function call opened at line 29:11
  --> /tmp/dojo-matrix-ops-3.almd:33:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
29 |   list.map(m, (row: List[Int]) => {
   |           --------------- '(' opened here
...
33 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
   | ^^^^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:41:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
41 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:42:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
42 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:43:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
43 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
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
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:15:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
15 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   |                                                           ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:28:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
28 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
