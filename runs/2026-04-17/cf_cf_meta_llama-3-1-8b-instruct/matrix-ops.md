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
    list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  }
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(m).get(0)
    list.range(0, ncols).map(fn(col_idx) => {
      list.map(m, fn(row) => row.get(col_idx) |> option.unwrap_or(0))
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(row_a.zip(col_b), fn((x, y), (a, b)) => a + x * b)
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
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-0.almd:4:5
  |
4 |   } else {
  |     ^
error: Expected function name at line 5:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:5:19
  |
5 |     list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                   ^
error: Expected function name at line 5:44 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:5:44
  |
5 |     list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                                            ^
error: Expected Then at line 10:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-0.almd:10:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-0.almd:12:5
   |
12 |   } else {
   |     ^
error: Expected function name at line 14:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:14:32
   |
14 |     list.range(0, ncols).map(fn(col_idx) => {
   |                                ^
error: Expected function name at line 15:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-0.almd:15:21
   |
15 |       list.map(m, fn(row) => row.get(col_idx) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:21:15
   |
21 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 25:33 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-0.almd:25:33
   |
25 |   list.reduce(row_a.zip(col_b), fn((x, y), (a, b)) => a + x * b)
   |                                 ^
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
  --> /tmp/dojo-matrix-ops-0.almd:9:59
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
  --> /tmp/dojo-matrix-ops-0.almd:24:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
24 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

14 error(s) found
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
    list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  }
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(m).get(0)
    list.range(0, ncols).map(fn(col_idx) => {
      list.map(m, fn(row) => row.get(col_idx) |> option.unwrap_or(0))
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(row_a.zip(col_b), fn((x, y), (a, b)) => a + x * b)
}
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
error: Expected function name at line 5:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:5:19
  |
5 |     list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                   ^
error: Expected function name at line 5:44 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:5:44
  |
5 |     list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                                            ^
error: Expected Then at line 10:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-1.almd:10:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
10 |   if list.is_empty(m) {
   |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-1.almd:12:5
   |
12 |   } else {
   |     ^
error: Expected function name at line 14:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:14:32
   |
14 |     list.range(0, ncols).map(fn(col_idx) => {
   |                                ^
error: Expected function name at line 15:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-1.almd:15:21
   |
15 |       list.map(m, fn(row) => row.get(col_idx) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:21:15
   |
21 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 25:33 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-1.almd:25:33
   |
25 |   list.reduce(row_a.zip(col_b), fn((x, y), (a, b)) => a + x * b)
   |                                 ^
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
  --> /tmp/dojo-matrix-ops-1.almd:9:59
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
  --> /tmp/dojo-matrix-ops-1.almd:24:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
24 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

14 error(s) found
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
    list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  }
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(m).get(0)
    list.range(0, ncols).map(fn(col_idx) => {
      list.map(m, fn(row) => row.get(col_idx) |> option.unwrap_or(0))
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(row_a.zip(col_b), fn((x, y), (a, b)) => a + x * b)
}
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
error: Expected function name at line 5:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:5:19
  |
5 |     list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                   ^
error: Expected function name at line 5:44 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:5:44
  |
5 |     list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                                            ^
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
error: Expected function name at line 14:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:14:32
   |
14 |     list.range(0, ncols).map(fn(col_idx) => {
   |                                ^
error: Expected function name at line 15:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-2.almd:15:21
   |
15 |       list.map(m, fn(row) => row.get(col_idx) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:21:15
   |
21 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 25:33 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-2.almd:25:33
   |
25 |   list.reduce(row_a.zip(col_b), fn((x, y), (a, b)) => a + x * b)
   |                                 ^
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
  --> /tmp/dojo-matrix-ops-2.almd:24:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
24 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

14 error(s) found
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
    list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  }
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(m).get(0)
    list.range(0, ncols).map(fn(col_idx) => {
      list.map(m, fn(row) => row.get(col_idx) |> option.unwrap_or(0))
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, fn(row) => list.map(row, fn(x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.reduce(row_a.zip(col_b), fn((x, y), (a, b)) => a + x * b)
}
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
error: Expected function name at line 5:19 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:5:19
  |
5 |     list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                   ^
error: Expected function name at line 5:44 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:5:44
  |
5 |     list.map(a, fn(row_a) => list.map(b, fn(row_b) => row_a + row_b))
  |                                            ^
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
error: Expected function name at line 14:32 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:14:32
   |
14 |     list.range(0, ncols).map(fn(col_idx) => {
   |                                ^
error: Expected function name at line 15:21 (got LParen '(')
  --> /tmp/dojo-matrix-ops-3.almd:15:21
   |
15 |       list.map(m, fn(row) => row.get(col_idx) |> option.unwrap_or(0))
   |                     ^
error: Expected expression at line 21:15 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:21:15
   |
21 |   list.map(m, fn(row) => list.map(row, fn(x) => x * s))
   |               ^
error: Expected expression at line 25:33 (got Fn 'fn')
  --> /tmp/dojo-matrix-ops-3.almd:25:33
   |
25 |   list.reduce(row_a.zip(col_b), fn((x, y), (a, b)) => a + x * b)
   |                                 ^
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
  --> /tmp/dojo-matrix-ops-3.almd:24:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
   |
24 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

14 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
