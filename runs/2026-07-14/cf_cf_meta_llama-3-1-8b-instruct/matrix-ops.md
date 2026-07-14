# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  let mat_len = list.len(a)
  let row_len = list.len(list.first(a))
  list.map(a, (row: List[Int]) => {
    list.map(row, (x: Int) => {
      let col_idx = list.first(list.enumerate(row)).unwrap_or(0)
      list.get(b, col_idx) |> option.unwrap_or(0)
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then {
    list.first(list.enumerate(m)) |> option.unwrap_or(0)
  } else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col_idx: Int) => {
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
error: Expected expression at line 29:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-0.almd:29:1
   |
29 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error: Expected ')' to close function call opened at line 26:11
  --> /tmp/dojo-matrix-ops-0.almd:30:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
26 |   list.map(m, (row: List[Int]) => {
   |           --------------- '(' opened here
...
30 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
   | ^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:3:37
  in call to list.len()
  hint: Fix the argument type
  |
3 |   let row_len = list.len(list.first(a))
  |                                     ^
error[E005]: argument 'i' expects Int but got (Int, Int)
  --> /tmp/dojo-matrix-ops-0.almd:7:19
  in call to list.get()
  hint: Fix the argument type
  |
7 |       list.get(b, col_idx) |> option.unwrap_or(0)
  |                   ^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:16:37
  in call to list.len()
  hint: Fix the argument type
   |
16 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:38:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
38 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:39:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
39 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-0.almd:40:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
40 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:3:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   let row_len = list.len(list.first(a))
  |                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected (Int, Int) but got Int
  --> /tmp/dojo-matrix-ops-0.almd:6:47
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
6 |       let col_idx = list.first(list.enumerate(row)).unwrap_or(0)
  |                                               ^^^
error[E001]: type mismatch in call to list.get(): expected Int but got (Int, Int)
  --> /tmp/dojo-matrix-ops-0.almd:7:19
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
7 |       list.get(b, col_idx) |> option.unwrap_or(0)
  |                   ^^^^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:7:48
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |       list.get(b, col_idx) |> option.unwrap_or(0)
  |                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:7:48
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
7 |       list.get(b, col_idx) |> option.unwrap_or(0)
  |                                                ^
error[E001]: type mismatch in call to option.unwrap_or(): expected (Int, List[Int]) but got Int
  --> /tmp/dojo-matrix-ops-0.almd:14:55
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
14 |     list.first(list.enumerate(m)) |> option.unwrap_or(0)
   |                                                       ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:16:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
16 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E001]: type mismatch in if branches: expected (Int, List[Int]) but got List[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:19:52
  in if branches
  hint: Both branches of `if/then/else` must have the same type
   |
19 |         list.get(row, col_idx) |> option.unwrap_or(0)
   |                                                    ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got (Int, List[Int])
  --> /tmp/dojo-matrix-ops-0.almd:19:52
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type
   |
19 |         list.get(row, col_idx) |> option.unwrap_or(0)
   |                                                    ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:25:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
25 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
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
  let mat_len = list.len(a)
  let row_len = list.len(list.first(a))
  list.map(a, (row: List[Int]) => {
    list.map(row, (x: Int) => {
      let col_idx = list.first(list.enumerate(row)).unwrap_or(0)
      let col_b = list.get(b, col_idx)
      match col_b {
        some(x) => x,
        none => 0
      }
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then {
    list.new[Int]()
  } else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col_idx: Int) => {
      let row = list.map(m, (row: List[Int]) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
      })
      row
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int])
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected ')' to close parenthesized expression opened at line 31:15
  --> /tmp/dojo-matrix-ops-1.almd:31:19
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
31 |   list.map(m, (row: List[Int])
   |               --------------- '(' opened here
   |
31 |   list.map(m, (row: List[Int])
   |                   ^
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:33:1
   |
33 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:3:37
  in call to list.len()
  hint: Fix the argument type
  |
3 |   let row_len = list.len(list.first(a))
  |                                     ^
error[E005]: argument 'i' expects Int but got (Int, Int)
  --> /tmp/dojo-matrix-ops-1.almd:7:31
  in call to list.get()
  hint: Fix the argument type
  |
7 |       let col_b = list.get(b, col_idx)
  |                               ^^^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-matrix-ops-1.almd:18:13
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
18 |     list.new[Int]()
   |             ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:20:37
  in call to list.len()
  hint: Fix the argument type
   |
20 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:42:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
42 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:43:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
43 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-1.almd:44:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
44 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:3:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   let row_len = list.len(list.first(a))
  |                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected (Int, Int) but got Int
  --> /tmp/dojo-matrix-ops-1.almd:6:47
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
6 |       let col_idx = list.first(list.enumerate(row)).unwrap_or(0)
  |                                               ^^^
error[E001]: type mismatch in call to list.get(): expected Int but got (Int, Int)
  --> /tmp/dojo-matrix-ops-1.almd:7:31
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
7 |       let col_b = list.get(b, col_idx)
  |                               ^^^^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:10:17
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |         none => 0
   |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:10:17
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
   |
10 |         none => 0
   |                 ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:20:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
20 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:30:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
30 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
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
  let mat_len = list.len(a)
  let row_len = list.len(list.first(a))
  list.map(a, (row: List[Int]) => {
    list.map(row, (x: Int) => {
      let col_idx = list.first(list.enumerate(row)).unwrap_or(0)
      let col_b = list.get(b, col_idx)
      match col_b {
        some(x) => x,
        none => 0
      }
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then {
    list.new[Int]()
  } else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col_idx: Int) => {
      let row = list.map(m, (row: List[Int]) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
      })
      row
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int])
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected ')' to close parenthesized expression opened at line 31:15
  --> /tmp/dojo-matrix-ops-2.almd:31:19
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
31 |   list.map(m, (row: List[Int])
   |               --------------- '(' opened here
   |
31 |   list.map(m, (row: List[Int])
   |                   ^
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:33:1
   |
33 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:3:37
  in call to list.len()
  hint: Fix the argument type
  |
3 |   let row_len = list.len(list.first(a))
  |                                     ^
error[E005]: argument 'i' expects Int but got (Int, Int)
  --> /tmp/dojo-matrix-ops-2.almd:7:31
  in call to list.get()
  hint: Fix the argument type
  |
7 |       let col_b = list.get(b, col_idx)
  |                               ^^^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-matrix-ops-2.almd:18:13
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
18 |     list.new[Int]()
   |             ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:20:37
  in call to list.len()
  hint: Fix the argument type
   |
20 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:42:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
42 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:43:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
43 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-2.almd:44:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
44 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:3:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   let row_len = list.len(list.first(a))
  |                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected (Int, Int) but got Int
  --> /tmp/dojo-matrix-ops-2.almd:6:47
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
6 |       let col_idx = list.first(list.enumerate(row)).unwrap_or(0)
  |                                               ^^^
error[E001]: type mismatch in call to list.get(): expected Int but got (Int, Int)
  --> /tmp/dojo-matrix-ops-2.almd:7:31
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
7 |       let col_b = list.get(b, col_idx)
  |                               ^^^^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:10:17
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |         none => 0
   |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:10:17
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
   |
10 |         none => 0
   |                 ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:20:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
20 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:30:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
30 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

16 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  let mat_len = list.len(a)
  let row_len = list.len(list.first(a))
  list.map(a, (row: List[Int]) => {
    list.map(row, (x: Int) => {
      let col_idx = list.first(list.enumerate(row)).unwrap_or(0)
      let col_b = list.get(b, col_idx)
      match col_b {
        some(x) => x,
        none => 0
      }
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then {
    list.new[Int]()
  } else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (col_idx: Int) => {
      let row = list.map(m, (row: List[Int]) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
      })
      row
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row: List[Int])
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected ')' to close parenthesized expression opened at line 31:15
  --> /tmp/dojo-matrix-ops-3.almd:31:19
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
   |
31 |   list.map(m, (row: List[Int])
   |               --------------- '(' opened here
   |
31 |   list.map(m, (row: List[Int])
   |                   ^
error: Expected expression at line 33:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-3.almd:33:1
   |
33 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:3:37
  in call to list.len()
  hint: Fix the argument type
  |
3 |   let row_len = list.len(list.first(a))
  |                                     ^
error[E005]: argument 'i' expects Int but got (Int, Int)
  --> /tmp/dojo-matrix-ops-3.almd:7:31
  in call to list.get()
  hint: Fix the argument type
  |
7 |       let col_b = list.get(b, col_idx)
  |                               ^^^^^^^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-matrix-ops-3.almd:18:13
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
18 |     list.new[Int]()
   |             ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:20:37
  in call to list.len()
  hint: Fix the argument type
   |
20 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:42:62
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
42 | test "mat_dot_row" { assert_eq(mat_dot_row([1, 2, 3], [4, 5, 6]), 32) }
   |                                                              ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:43:57
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
43 | test "mat_dot_row single" { assert_eq(mat_dot_row([3], [4]), 12) }
   |                                                         ^
error[E002]: undefined function 'mat_dot_row'
  --> /tmp/dojo-matrix-ops-3.almd:44:54
  in call to mat_dot_row()
  hint: Did you mean `matrix.dot_row`?
  try:
      // mat_dot_row(...)  →  matrix.dot_row(...)
      matrix.dot_row(...)
   |
44 | test "mat_dot_row empty" { assert_eq(mat_dot_row([], []), 0) }
   |                                                      ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:3:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |   let row_len = list.len(list.first(a))
  |                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected (Int, Int) but got Int
  --> /tmp/dojo-matrix-ops-3.almd:6:47
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
6 |       let col_idx = list.first(list.enumerate(row)).unwrap_or(0)
  |                                               ^^^
error[E001]: type mismatch in call to list.get(): expected Int but got (Int, Int)
  --> /tmp/dojo-matrix-ops-3.almd:7:31
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
7 |       let col_b = list.get(b, col_idx)
  |                               ^^^^^^^
error[E001]: type mismatch in match arm: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:10:17
  in match arm
  hint: All match arms must share the same type. Change the mismatched arm to return the same type as the others, or change the first arm
   |
10 |         none => 0
   |                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:10:17
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
   |
10 |         none => 0
   |                 ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:20:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
20 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:30:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
30 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^

16 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
