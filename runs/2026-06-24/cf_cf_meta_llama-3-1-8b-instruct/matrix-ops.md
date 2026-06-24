# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, fn(row_a) => {
    list.map(b, fn(row_b) => {
      list.zip(row_a, row_b, fn(x, y) => x + y)
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols, fn(i) => {
      list.map(m, fn(row) => {
        list.get(row, i) |> option.unwrap_or(0)
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => {
    list.map(row, fn(x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(list.zip(row_a, col_b, fn(x, y) => x * y), 0, fn(acc, x) => acc + x)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:2:15
  |
2 |   list.map(a, fn(row_a) => {
  |               ^
error: Expected expression at line 3:17 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:3:17
  |
3 |     list.map(b, fn(row_b) => {
  |                 ^
error: Expected expression at line 4:30 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:4:30
  |
4 |       list.zip(row_a, row_b, fn(x, y) => x + y)
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-0.almd:5:6
  |
5 |     })
  |      ^
error: Expected expression at line 12:26 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:12:26
   |
12 |     list.range(0, ncols, fn(i) => {
   |                          ^
error: Expected expression at line 13:19 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:13:19
   |
13 |       list.map(m, fn(row) => {
   |                   ^
error: Expected expression at line 15:8 (got RParen ')')
  --> /tmp/dojo-matrix-ops-0.almd:15:8
   |
15 |       })
   |        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-0.almd:16:6
   |
16 |     })
   |      ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:21:15
   |
21 |   list.map(m, fn(row) => {
   |               ^
error: Expected expression at line 22:19 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:22:19
   |
22 |     list.map(row, fn(x) => x * s)
   |                   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:4 (got RParen ')')
  --> /tmp/dojo-matrix-ops-0.almd:23:4
   |
23 |   })
   |    ^
error: Expected expression at line 27:38 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:27:38
   |
27 |   list.reduce(list.zip(row_a, col_b, fn(x, y) => x * y), 0, fn(acc, x) => acc + x)
   |                                      ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:11:37
  in call to list.len()
  hint: Fix the argument type
   |
11 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E003]: undefined variable 'row'
  --> /tmp/dojo-matrix-ops-0.almd:14:18
  in variable row
  hint: Check the variable name
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                  ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-matrix-ops-0.almd:14:23
  in variable i
  hint: Did you mean `m`?
  try:
      // i  →  m
      m
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                       ^
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
  --> /tmp/dojo-matrix-ops-0.almd:11:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
11 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:14:46
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                                              ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:20:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:26:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

20 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, fn(row_a) => {
    list.map(b, fn(row_b) => {
      list.zip(row_a, row_b, fn(x, y) => x + y)
    })
  }) |> list.flatten
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols, fn(i) => {
      list.map(m, fn(row) => {
        list.get(row, i) |> option.unwrap_or(0)
      })
    }) |> list.map(fn(xs) => xs)
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => {
    list.map(row, fn(x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(list.zip(row_a, col_b, fn(x, y) => x * y), 0, fn(acc,
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  |
2 |   list.map(a, fn(row_a) => {
  |               ^
error: Expected expression at line 3:17 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:3:17
  |
3 |     list.map(b, fn(row_b) => {
  |                 ^
error: Expected expression at line 4:30 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:4:30
  |
4 |       list.zip(row_a, row_b, fn(x, y) => x + y)
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-1.almd:5:6
  |
5 |     })
  |      ^
error: Expected expression at line 12:26 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:12:26
   |
12 |     list.range(0, ncols, fn(i) => {
   |                          ^
error: Expected expression at line 13:19 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:13:19
   |
13 |       list.map(m, fn(row) => {
   |                   ^
error: Expected expression at line 15:8 (got RParen ')')
  --> /tmp/dojo-matrix-ops-1.almd:15:8
   |
15 |       })
   |        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-1.almd:16:6
   |
16 |     }) |> list.map(fn(xs) => xs)
   |      ^
error: Expected function name at line 16:22 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:16:22
   |
16 |     }) |> list.map(fn(xs) => xs)
   |                      ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:21:15
   |
21 |   list.map(m, fn(row) => {
   |               ^
error: Expected expression at line 22:19 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:22:19
   |
22 |     list.map(row, fn(x) => x * s)
   |                   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:4 (got RParen ')')
  --> /tmp/dojo-matrix-ops-1.almd:23:4
   |
23 |   })
   |    ^
error: Expected expression at line 27:38 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:27:38
   |
27 |   list.reduce(list.zip(row_a, col_b, fn(x, y) => x * y), 0, fn(acc,
   |                                      ^
error: Expected expression at line 29:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-1.almd:29:1
   |
29 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:11:37
  in call to list.len()
  hint: Fix the argument type
   |
11 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E003]: undefined variable 'row'
  --> /tmp/dojo-matrix-ops-1.almd:14:18
  in variable row
  hint: Check the variable name
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                  ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-matrix-ops-1.almd:14:23
  in variable i
  hint: Did you mean `m`?
  try:
      // i  →  m
      m
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                       ^
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
  --> /tmp/dojo-matrix-ops-1.almd:11:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
11 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:14:46
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                                              ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:20:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:26:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

22 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, fn(row_a) => {
    list.map(b, fn(row_b) => {
      list.zip(row_a, row_b, fn(x, y) => x + y)
    }) |> list.flatten
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols, fn(i) => {
      list.map(m, fn(row) => {
        list.get(row, i) |> option.unwrap_or(0)
      })
    }) |> list.map(fn(xs) => xs)
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => {
    list.map(row, fn(x) => x * s)
  }) |> list.flatten
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(list.zip(row_a, col_b, fn(x, y) => x * y), 0
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   list.map(a, fn(row_a) => {
  |               ^
error: Expected expression at line 3:17 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:3:17
  |
3 |     list.map(b, fn(row_b) => {
  |                 ^
error: Expected expression at line 4:30 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:4:30
  |
4 |       list.zip(row_a, row_b, fn(x, y) => x + y)
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-2.almd:5:6
  |
5 |     }) |> list.flatten
  |      ^
error: Expected expression at line 12:26 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:12:26
   |
12 |     list.range(0, ncols, fn(i) => {
   |                          ^
error: Expected expression at line 13:19 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:13:19
   |
13 |       list.map(m, fn(row) => {
   |                   ^
error: Expected expression at line 15:8 (got RParen ')')
  --> /tmp/dojo-matrix-ops-2.almd:15:8
   |
15 |       })
   |        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-2.almd:16:6
   |
16 |     }) |> list.map(fn(xs) => xs)
   |      ^
error: Expected function name at line 16:22 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:16:22
   |
16 |     }) |> list.map(fn(xs) => xs)
   |                      ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:21:15
   |
21 |   list.map(m, fn(row) => {
   |               ^
error: Expected expression at line 22:19 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:22:19
   |
22 |     list.map(row, fn(x) => x * s)
   |                   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:4 (got RParen ')')
  --> /tmp/dojo-matrix-ops-2.almd:23:4
   |
23 |   }) |> list.flatten
   |    ^
error: Expected expression at line 27:38 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:27:38
   |
27 |   list.reduce(list.zip(row_a, col_b, fn(x, y) => x * y), 0
   |                                      ^
error: Expected expression at line 29:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:29:1
   |
29 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:11:37
  in call to list.len()
  hint: Fix the argument type
   |
11 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E003]: undefined variable 'row'
  --> /tmp/dojo-matrix-ops-2.almd:14:18
  in variable row
  hint: Check the variable name
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                  ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-matrix-ops-2.almd:14:23
  in variable i
  hint: Did you mean `m`?
  try:
      // i  →  m
      m
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                       ^
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
  --> /tmp/dojo-matrix-ops-2.almd:11:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
11 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:14:46
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                                              ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:20:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:26:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

22 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, fn(row_a) => {
    list.map(b, fn(row_b) => {
      list.zip(row_a, row_b, fn(x, y) => x + y)
    }) |> list.flatten
  }) |> list.map(fn(xs) => xs)
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols, fn(i) => {
      list.map(m, fn(row) => {
        list.get(row, i) |> option.unwrap_or(0)
      }) |> list.flatten
    }) |> list.map(fn(xs) => xs)
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => {
    list.map(row, fn(x) => x * s)
  }) |> list.flatten
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(list.zip(row_a, col_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 2:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   list.map(a, fn(row_a) => {
  |               ^
error: Expected expression at line 3:17 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:3:17
  |
3 |     list.map(b, fn(row_b) => {
  |                 ^
error: Expected expression at line 4:30 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:4:30
  |
4 |       list.zip(row_a, row_b, fn(x, y) => x + y)
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-3.almd:5:6
  |
5 |     }) |> list.flatten
  |      ^
error: Expected function name at line 6:20 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:6:20
  |
6 |   }) |> list.map(fn(xs) => xs)
  |                    ^
error: Expected expression at line 12:26 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:12:26
   |
12 |     list.range(0, ncols, fn(i) => {
   |                          ^
error: Expected expression at line 13:19 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:13:19
   |
13 |       list.map(m, fn(row) => {
   |                   ^
error: Expected expression at line 15:8 (got RParen ')')
  --> /tmp/dojo-matrix-ops-3.almd:15:8
   |
15 |       }) |> list.flatten
   |        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-3.almd:16:6
   |
16 |     }) |> list.map(fn(xs) => xs)
   |      ^
error: Expected function name at line 16:22 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:16:22
   |
16 |     }) |> list.map(fn(xs) => xs)
   |                      ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:21:15
   |
21 |   list.map(m, fn(row) => {
   |               ^
error: Expected expression at line 22:19 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:22:19
   |
22 |     list.map(row, fn(x) => x * s)
   |                   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:4 (got RParen ')')
  --> /tmp/dojo-matrix-ops-3.almd:23:4
   |
23 |   }) |> list.flatten
   |    ^
error: Expected ')' to close function call opened at line 27:23
  --> /tmp/dojo-matrix-ops-3.almd:29:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
27 |   list.reduce(list.zip(row_a, col_b
   |                       --------------- '(' opened here
...
29 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:11:37
  in call to list.len()
  hint: Fix the argument type
   |
11 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E003]: undefined variable 'row'
  --> /tmp/dojo-matrix-ops-3.almd:14:18
  in variable row
  hint: Check the variable name
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                  ^^^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-matrix-ops-3.almd:14:23
  in variable i
  hint: Did you mean `m`?
  try:
      // i  →  m
      m
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                       ^
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
  --> /tmp/dojo-matrix-ops-3.almd:11:37
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
11 |     let ncols = list.len(list.first(m))
   |                                     ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:14:46
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
14 |         list.get(row, i) |> option.unwrap_or(0)
   |                                              ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:20:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:26:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

22 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
