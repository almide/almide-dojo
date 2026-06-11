# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (j) => list.map(m, (row) => list.get(row, j) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => list.map(row, (x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected Then at line 6:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-0.almd:6:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |   if list.is_empty(m) {
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-0.almd:8:5
  |
8 |   } else {
  |     ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:84
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                    ^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:19:86
  in call to list.get()
  hint: Fix the argument type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:19:86
  in operator *
  hint: Use numeric types (Int or Float)
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:19:112
  in call to list.fold()
  hint: Fix the argument type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                                                ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:2:84
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                    ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:2:110
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                                              ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:2:115
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                                                   ^^^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-0.almd:5:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
5 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  |                                                           ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:19:86
  in call to list.get()
  hint: Fix the expression type or change the expected type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, Int) -> Int but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:19:112
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                                                ^

12 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (j) => list.map(m, (row) => list.get(row, j) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => list.map(row, (x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
}

fn mat_add(a:
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Expected Then at line 6:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-1.almd:6:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |   if list.is_empty(m) {
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-1.almd:8:5
  |
8 |   } else {
  |     ^
error: Expected type name at line 22:14 (got Newline '')
  --> /tmp/dojo-matrix-ops-1.almd:22:14
   |
22 | fn mat_add(a:
   |              ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:2:84
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                    ^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:19:86
  in call to list.get()
  hint: Fix the argument type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:19:86
  in operator *
  hint: Use numeric types (Int or Float)
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:19:112
  in call to list.fold()
  hint: Fix the argument type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                                                ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:2:84
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                    ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:2:110
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                                              ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:2:115
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                                                   ^^^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:5:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
5 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  |                                                           ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:19:86
  in call to list.get()
  hint: Fix the expression type or change the expected type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, Int) -> Int but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-1.almd:19:112
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                                                ^

13 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (j) => list.map(m, (row) => list.get(row, j) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => list.map(row, (x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
}

fn mat_add(a:
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected Then at line 6:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-2.almd:6:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |   if list.is_empty(m) {
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-2.almd:8:5
  |
8 |   } else {
  |     ^
error: Expected type name at line 22:14 (got Newline '')
  --> /tmp/dojo-matrix-ops-2.almd:22:14
   |
22 | fn mat_add(a:
   |              ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:2:84
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                    ^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:19:86
  in call to list.get()
  hint: Fix the argument type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:19:86
  in operator *
  hint: Use numeric types (Int or Float)
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:19:112
  in call to list.fold()
  hint: Fix the argument type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                                                ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:2:84
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                    ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:2:110
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                                              ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:2:115
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                                                   ^^^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:5:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
5 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  |                                                           ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:19:86
  in call to list.get()
  hint: Fix the expression type or change the expected type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, Int) -> Int but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:19:112
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                                                ^

13 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) {
    []
  } else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (j) => list.map(m, (row) => list.get(row, j) |> option.unwrap_or(0)))
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => list.map(row, (x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
}

fn mat_add(a:
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected Then at line 6:23 (got LBrace '{')
  --> /tmp/dojo-matrix-ops-3.almd:6:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
6 |   if list.is_empty(m) {
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:5 (got Else 'else')
  --> /tmp/dojo-matrix-ops-3.almd:8:5
  |
8 |   } else {
  |     ^
error: Expected type name at line 22:14 (got Newline '')
  --> /tmp/dojo-matrix-ops-3.almd:22:14
   |
22 | fn mat_add(a:
   |              ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:2:84
  in call to list.get()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                    ^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:19:86
  in call to list.get()
  hint: Fix the argument type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:19:86
  in operator *
  hint: Use numeric types (Int or Float)
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:19:112
  in call to list.fold()
  hint: Fix the argument type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                                                ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:2:84
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                    ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:2:110
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                                              ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:2:115
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x_a) => list.get(b, list.index_of(row_a, x_a)) |> option.unwrap_or(0) + x_a))
  |                                                                                                                   ^^^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:5:59
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
  |
5 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  |                                                           ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:19:86
  in call to list.get()
  hint: Fix the expression type or change the expected type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                      ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, Int) -> Int but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:19:112
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
19 |   list.fold(row_a, 0, (acc, x_a) => acc + x_a * list.get(col_b, list.index_of(row_a, x_a)) |> option.unwrap_or(0))
   |                                                                                                                ^

13 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
