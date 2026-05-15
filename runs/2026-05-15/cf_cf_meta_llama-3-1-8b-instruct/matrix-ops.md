# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] {
    let (nrows, ncols) = (list.len(a), list.len(list.first(a)) |>
        option.unwrap_or(0));
    list.map(a, |row_a| list.map(row_a, |x| x + list.get(b, list.index_of(a, row_a)) |>
        option.unwrap_or(0)))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] {
    if list.is_empty(m) {
        return list.new();
    }
    let ncols = list.len(list.first(m)) |>
        option.unwrap_or(0);
    list.range(0, ncols).map(|col_idx| list.map(m, |row| list.get(row, col_idx) |>
        option.unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] {
    list.map(m, |row| list.map(row, |x| x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int {
    list.map(row_a, |x| x * list.get(col_b, list
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Missing '=' before function body at line 1:71
  --> /tmp/dojo-matrix-ops-0.almd:1:71
  hint: Almide requires '=' before the body. Write: fn mat_add(...) -> Type = { ... }
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] {
  |                                                                       ^
error: Missing '=' before function body at line 8:57
  --> /tmp/dojo-matrix-ops-0.almd:8:57
  hint: Almide requires '=' before the body. Write: fn mat_transpose(...) -> Type = { ... }
  |
8 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] {
  |                                                         ^
error: Missing '=' before function body at line 18:61
  --> /tmp/dojo-matrix-ops-0.almd:18:61
  hint: Almide requires '=' before the body. Write: fn mat_scale(...) -> Type = { ... }
   |
18 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] {
   |                                                             ^
error: Missing '=' before function body at line 22:59
  --> /tmp/dojo-matrix-ops-0.almd:22:59
  hint: Almide requires '=' before the body. Write: fn mat_dot_row(...) -> Type = { ... }
   |
22 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int {
   |                                                           ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    let (nrows, ncols) = (list.len(a), list.len(list.first(a)) |>
        option.unwrap_or(0));
    list.map(a, |row_a| list.map(row_a, |x| x + list.get(b, list.index_of(a, row_a)) |>
        option.unwrap_or(0)))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    if list.is_empty(m) {
        return list.new();
    }
    let ncols = list.len(list.first(m)) |>
        option.unwrap_or(0);
    list.range(0, ncols).map(|col_idx| list.map(m, |row| list.get(row, col_idx) |>
        option.unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    list.map(m, |row| list.map(row, |x| x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    list.map(row_a, |x| x * list.get(col_b,
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: '|x|' closure syntax is not valid in Almide at line 4:17
  --> /tmp/dojo-matrix-ops-1.almd:4:17
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |     list.map(a, |row_a| list.map(row_a, |x| x + list.get(b, list.index_of(a, row_a)) |>
  |                 ^
error: Expected expression at line 5:28 (got RParen ')')
  --> /tmp/dojo-matrix-ops-1.almd:5:28
  |
5 |         option.unwrap_or(0)))
  |                            ^
error: Expected Then at line 9:25 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-1.almd:9:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if list.is_empty(m) {
  |                         ^
error: Semicolons are not used in Almide at line 13:28
  --> /tmp/dojo-matrix-ops-1.almd:13:28
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
13 |         option.unwrap_or(0);
   |                            ^
error: '|x|' closure syntax is not valid in Almide at line 19:17
  --> /tmp/dojo-matrix-ops-1.almd:19:17
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
19 |     list.map(m, |row| list.map(row, |x| x * s))
   |                 ^
error: '|x|' closure syntax is not valid in Almide at line 23:21
  --> /tmp/dojo-matrix-ops-1.almd:23:21
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
23 |     list.map(row_a, |x| x * list.get(col_b,
   |                     ^
error: Expected expression at line 25:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:25:1
   |
25 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:2:60
  in call to list.len()
  hint: Fix the argument type
  |
2 |     let (nrows, ncols) = (list.len(a), list.len(list.first(a)) |>
  |                                                            ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:3:26
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
3 |         option.unwrap_or(0));
  |                          ^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-1.almd:5:26
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 1
      option.unwrap_or(<o: Option[A]>, <default: A>)
  |
5 |         option.unwrap_or(0)))
  |                          ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:5:26
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
5 |         option.unwrap_or(0)))
  |                          ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-matrix-ops-1.almd:10:17
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
   |
10 |         list.new();
   |                 ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-matrix-ops-1.almd:12:37
  in variable m
  hint: Check the variable name
   |
12 |     let ncols = list.len(list.first(m)) |>
   |                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[?2]
  --> /tmp/dojo-matrix-ops-1.almd:12:37
  in call to list.len()
  hint: Fix the argument type
   |
12 |     let ncols = list.len(list.first(m)) |>
   |                                     ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:13:26
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
13 |         option.unwrap_or(0);
   |                          ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:2:60
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
2 |     let (nrows, ncols) = (list.len(a), list.len(list.first(a)) |>
  |                                                            ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:3:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
3 |         option.unwrap_or(0));
  |                          ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[A] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:5:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
5 |         option.unwrap_or(0)))
  |                          ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:5:26
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
5 |         option.unwrap_or(0)))
  |                          ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[?2]
  --> /tmp/dojo-matrix-ops-1.almd:12:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
12 |     let ncols = list.len(list.first(m)) |>
   |                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:13:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
13 |         option.unwrap_or(0);
   |                          ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:18:63
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
  --> /tmp/dojo-matrix-ops-1.almd:22:61
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

23 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    let (nrows, ncols) = (list.len(a), list.len(list.first(a)));
    list.map(a, |row_a| list.map(row_a, |x| x + list.get(b, list.index_of(a, row_a)) |>
        option.unwrap_or(0)))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    if list.is_empty(m) {
        return list.new();
    }
    let ncols = list.len(list.first(m));
    list.range(0, ncols).map(|col_idx| list.map(m, |row| list.get(row, col_idx) |>
        option.unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    list.map(m, |row| list.map(row, |x| x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    list.map(row_a, |x| x * list.get(col_b, list.index_of(col_b, x)) |>
        option.unwrap_or(0)).fold
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: '|x|' closure syntax is not valid in Almide at line 3:17
  --> /tmp/dojo-matrix-ops-2.almd:3:17
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |     list.map(a, |row_a| list.map(row_a, |x| x + list.get(b, list.index_of(a, row_a)) |>
  |                 ^
error: Expected expression at line 4:28 (got RParen ')')
  --> /tmp/dojo-matrix-ops-2.almd:4:28
  |
4 |         option.unwrap_or(0)))
  |                            ^
error: Expected Then at line 8:25 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-2.almd:8:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |     if list.is_empty(m) {
  |                         ^
error: Semicolons are not used in Almide at line 11:40
  --> /tmp/dojo-matrix-ops-2.almd:11:40
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
11 |     let ncols = list.len(list.first(m));
   |                                        ^
error: '|x|' closure syntax is not valid in Almide at line 17:17
  --> /tmp/dojo-matrix-ops-2.almd:17:17
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
17 |     list.map(m, |row| list.map(row, |x| x * s))
   |                 ^
error: '|x|' closure syntax is not valid in Almide at line 21:21
  --> /tmp/dojo-matrix-ops-2.almd:21:21
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
21 |     list.map(row_a, |x| x * list.get(col_b, list.index_of(col_b, x)) |>
   |                     ^
error: Expected expression at line 22:28 (got RParen ')')
  --> /tmp/dojo-matrix-ops-2.almd:22:28
   |
22 |         option.unwrap_or(0)).fold
   |                            ^
error: Expected expression at line 24:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:24:1
   |
24 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:2:60
  in call to list.len()
  hint: Fix the argument type
  |
2 |     let (nrows, ncols) = (list.len(a), list.len(list.first(a)));
  |                                                            ^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-2.almd:4:26
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 1
      option.unwrap_or(<o: Option[A]>, <default: A>)
  |
4 |         option.unwrap_or(0)))
  |                          ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:26
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
4 |         option.unwrap_or(0)))
  |                          ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-matrix-ops-2.almd:9:17
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
9 |         list.new();
  |                 ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-matrix-ops-2.almd:11:37
  in variable m
  hint: Check the variable name
   |
11 |     let ncols = list.len(list.first(m));
   |                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[?2]
  --> /tmp/dojo-matrix-ops-2.almd:11:37
  in call to list.len()
  hint: Fix the argument type
   |
11 |     let ncols = list.len(list.first(m));
   |                                     ^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-2.almd:22:26
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 1
      option.unwrap_or(<o: Option[A]>, <default: A>)
   |
22 |         option.unwrap_or(0)).fold
   |                          ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:22:26
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
22 |         option.unwrap_or(0)).fold
   |                          ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:2:60
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
2 |     let (nrows, ncols) = (list.len(a), list.len(list.first(a)));
  |                                                            ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
4 |         option.unwrap_or(0)))
  |                          ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:4:26
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
4 |         option.unwrap_or(0)))
  |                          ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[?2]
  --> /tmp/dojo-matrix-ops-2.almd:11:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
11 |     let ncols = list.len(list.first(m));
   |                                     ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:16:63
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
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:22:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
22 |         option.unwrap_or(0)).fold
   |                          ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:22:26
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
22 |         option.unwrap_or(0)).fold
   |                          ^

23 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    let (nrows, ncols) = (list.len(a), list.len(list.first(a)));
    list.map(a, |row_a| list.map(row_a, |x| x + list.get(b, list.index_of(a, row_a)) |>
        option.unwrap_or(0)))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    if list.is_empty(m) {
        return list.new();
    }
    let ncols = list.len(list.first(m));
    list.range(0, ncols).map(|col_idx| list.map(m, |row| list.get(row, col_idx) |>
        option.unwrap_or(0)))
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    list.map(m, |row| list.map(row, |x| x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    list.map(row_a, |x| x * list.get(col_b, list.index_of(col_b, x)) |>
        option.unwrap_or(0)).fold
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: '|x|' closure syntax is not valid in Almide at line 3:17
  --> /tmp/dojo-matrix-ops-3.almd:3:17
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |     list.map(a, |row_a| list.map(row_a, |x| x + list.get(b, list.index_of(a, row_a)) |>
  |                 ^
error: Expected expression at line 4:28 (got RParen ')')
  --> /tmp/dojo-matrix-ops-3.almd:4:28
  |
4 |         option.unwrap_or(0)))
  |                            ^
error: Expected Then at line 8:25 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-3.almd:8:25
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |     if list.is_empty(m) {
  |                         ^
error: Semicolons are not used in Almide at line 11:40
  --> /tmp/dojo-matrix-ops-3.almd:11:40
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
11 |     let ncols = list.len(list.first(m));
   |                                        ^
error: '|x|' closure syntax is not valid in Almide at line 17:17
  --> /tmp/dojo-matrix-ops-3.almd:17:17
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
17 |     list.map(m, |row| list.map(row, |x| x * s))
   |                 ^
error: '|x|' closure syntax is not valid in Almide at line 21:21
  --> /tmp/dojo-matrix-ops-3.almd:21:21
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
   |
21 |     list.map(row_a, |x| x * list.get(col_b, list.index_of(col_b, x)) |>
   |                     ^
error: Expected expression at line 22:28 (got RParen ')')
  --> /tmp/dojo-matrix-ops-3.almd:22:28
   |
22 |         option.unwrap_or(0)).fold
   |                            ^
error: Expected expression at line 24:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-3.almd:24:1
   |
24 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:2:60
  in call to list.len()
  hint: Fix the argument type
  |
2 |     let (nrows, ncols) = (list.len(a), list.len(list.first(a)));
  |                                                            ^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-3.almd:4:26
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 1
      option.unwrap_or(<o: Option[A]>, <default: A>)
  |
4 |         option.unwrap_or(0)))
  |                          ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:4:26
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
4 |         option.unwrap_or(0)))
  |                          ^
error[E002]: undefined function 'list.new'
  --> /tmp/dojo-matrix-ops-3.almd:9:17
  in call to list.new()
  hint: Did you mean `[] (empty list literal)`?
  |
9 |         list.new();
  |                 ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-matrix-ops-3.almd:11:37
  in variable m
  hint: Check the variable name
   |
11 |     let ncols = list.len(list.first(m));
   |                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[?2]
  --> /tmp/dojo-matrix-ops-3.almd:11:37
  in call to list.len()
  hint: Fix the argument type
   |
11 |     let ncols = list.len(list.first(m));
   |                                     ^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-matrix-ops-3.almd:22:26
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 1
      option.unwrap_or(<o: Option[A]>, <default: A>)
   |
22 |         option.unwrap_or(0)).fold
   |                          ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:22:26
  in call to option.unwrap_or()
  hint: Fix the argument type
   |
22 |         option.unwrap_or(0)).fold
   |                          ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:2:60
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
2 |     let (nrows, ncols) = (list.len(a), list.len(list.first(a)));
  |                                                            ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[A] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:4:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
4 |         option.unwrap_or(0)))
  |                          ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:4:26
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
4 |         option.unwrap_or(0)))
  |                          ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[?2]
  --> /tmp/dojo-matrix-ops-3.almd:11:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
11 |     let ncols = list.len(list.first(m));
   |                                     ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:16:63
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
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[A] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:22:26
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
22 |         option.unwrap_or(0)).fold
   |                          ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:22:26
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
22 |         option.unwrap_or(0)).fold
   |                          ^

23 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
