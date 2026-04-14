# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  a.map((row_a, row_b) => row_a.map((x, y) => x + y))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if m == [] then [] else {
    let ncols = m.get(0).len()
    list.range(0, ncols).map((col_idx) => {
      list.range(0, m.len()).map((row_idx) => {
        m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  m.map((row) => row.map((x) => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  row_a.map((x, y) => x * y).fold(0, (acc, x) => acc + x)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(fn(fn(?2, ?3) -> ?2) -> ?4, ?1) -> ?4
  --> /tmp/dojo-matrix-ops-0.almd:2:3
  in call to list.map()
  hint: Fix the argument type
  |
2 |   a.map((row_a, row_b) => row_a.map((x, y) => x + y))
  |   ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(fn(fn(?13) -> ?13) -> ?14) -> ?14
  --> /tmp/dojo-matrix-ops-0.almd:17:3
  in call to list.map()
  hint: Fix the argument type
   |
17 |   m.map((row) => row.map((x) => x * s))
   |   ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(?18, ?19) -> ?18
  --> /tmp/dojo-matrix-ops-0.almd:21:3
  in call to list.map()
  hint: Fix the argument type
   |
21 |   row_a.map((x, y) => x * y).fold(0, (acc, x) => acc + x)
   |   ^^^^^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(fn(fn(?2, ?3) -> ?2) -> ?4, ?1) -> ?4
  --> /tmp/dojo-matrix-ops-0.almd:2:3
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   a.map((row_a, row_b) => row_a.map((x, y) => x + y))
  |   ^
error[E001]: type mismatch in method call: expected Option[List[Int]] but got fn() -> Int
  --> /tmp/dojo-matrix-ops-0.almd:7:17
  in method call
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = m.get(0).len()
  |                 ^
error[E001]: type mismatch in method call: expected Option[List[Int]] but got fn(Int) -> Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:10:9
  in method call
  hint: Fix the expression type or change the expected type
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |         ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(fn(fn(?13) -> ?13) -> ?14) -> ?14
  --> /tmp/dojo-matrix-ops-0.almd:17:3
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
17 |   m.map((row) => row.map((x) => x * s))
   |   ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(?18, ?19) -> ?18
  --> /tmp/dojo-matrix-ops-0.almd:21:3
  in call to list.map()
  hint: Fix the expression type or change the expected type
   |
21 |   row_a.map((x, y) => x * y).fold(0, (acc, x) => acc + x)
   |   ^^^^^

8 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  a.map(row_a => row_a.map((x, y) => x + y))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if m == [] then [] else {
    let ncols = m.get(0).len()
    list.range(0, ncols).map(col_idx => {
      list.range(0, m.len()).map(row_idx => {
        m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  m.map(row => row.map(x => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  row_a.map(x => x * 1).fold(0, (acc, x) => acc + x)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   a.map(row_a => row_a.map((x, y) => x + y))
  |               ^^
error: Lambda parameter must be wrapped in parentheses at line 2:15
  --> /tmp/dojo-matrix-ops-1.almd:2:15
  |
2 |   a.map(row_a => row_a.map((x, y) => x + y))
  |               ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-1.almd:8:38
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
8 |     list.range(0, ncols).map(col_idx => {
  |                                      ^^
error: Lambda parameter must be wrapped in parentheses at line 8:38
  --> /tmp/dojo-matrix-ops-1.almd:8:38
  |
8 |     list.range(0, ncols).map(col_idx => {
  |                                      ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-1.almd:9:42
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
9 |       list.range(0, m.len()).map(row_idx => {
  |                                          ^^
error: Lambda parameter must be wrapped in parentheses at line 9:42
  --> /tmp/dojo-matrix-ops-1.almd:9:42
  |
9 |       list.range(0, m.len()).map(row_idx => {
  |                                          ^
error: Expected expression at line 11:8 (got RParen ')')
  --> /tmp/dojo-matrix-ops-1.almd:11:8
   |
11 |       })
   |        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-1.almd:12:6
   |
12 |     })
   |      ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-1.almd:17:13
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
17 |   m.map(row => row.map(x => x * s))
   |             ^^
error: Lambda parameter must be wrapped in parentheses at line 17:13
  --> /tmp/dojo-matrix-ops-1.almd:17:13
   |
17 |   m.map(row => row.map(x => x * s))
   |             ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-1.almd:21:15
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
21 |   row_a.map(x => x * 1).fold(0, (acc, x) => acc + x)
   |               ^^
error: Lambda parameter must be wrapped in parentheses at line 21:15
  --> /tmp/dojo-matrix-ops-1.almd:21:15
   |
21 |   row_a.map(x => x * 1).fold(0, (acc, x) => acc + x)
   |               ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-1.almd:10:28
  in variable col_idx
  hint: Check the variable name
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |                            ^^^^^^^
error[E003]: undefined variable 'row_idx'
  --> /tmp/dojo-matrix-ops-1.almd:10:15
  in variable row_idx
  hint: Check the variable name
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |               ^^^^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:1:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  |                                                                         ^
error[E001]: type mismatch in method call: expected Option[List[Int]] but got fn() -> ?2
  --> /tmp/dojo-matrix-ops-1.almd:7:17
  in method call
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = m.get(0).len()
  |                 ^
error[E001]: type mismatch in method call: expected Option[List[Int]] but got fn(Unknown) -> Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:10:9
  in method call
  hint: Fix the expression type or change the expected type
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |         ^
error[E001]: type mismatch in if branches: expected List[?1] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:10:57
  in if branches
  hint: Fix the expression type or change the expected type
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |                                                         ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:10:57
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |                                                         ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:16:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
   |
16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-1.almd:20:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
20 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

21 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  a.map(row_a => row_a.map((x, y) => x + y))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if m == [] then [] else {
    let ncols = m.get(0).len()
    list.range(0, ncols).map(col_idx => {
      list.range(0, m.len()).map(row_idx => {
        m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  m.map(row => row.map(x => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  row_a.map(x => x * 1).fold(0, (acc, x) => acc + x)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   a.map(row_a => row_a.map((x, y) => x + y))
  |               ^^
error: Lambda parameter must be wrapped in parentheses at line 2:15
  --> /tmp/dojo-matrix-ops-2.almd:2:15
  |
2 |   a.map(row_a => row_a.map((x, y) => x + y))
  |               ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-2.almd:8:38
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
8 |     list.range(0, ncols).map(col_idx => {
  |                                      ^^
error: Lambda parameter must be wrapped in parentheses at line 8:38
  --> /tmp/dojo-matrix-ops-2.almd:8:38
  |
8 |     list.range(0, ncols).map(col_idx => {
  |                                      ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-2.almd:9:42
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
9 |       list.range(0, m.len()).map(row_idx => {
  |                                          ^^
error: Lambda parameter must be wrapped in parentheses at line 9:42
  --> /tmp/dojo-matrix-ops-2.almd:9:42
  |
9 |       list.range(0, m.len()).map(row_idx => {
  |                                          ^
error: Expected expression at line 11:8 (got RParen ')')
  --> /tmp/dojo-matrix-ops-2.almd:11:8
   |
11 |       })
   |        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-2.almd:12:6
   |
12 |     })
   |      ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-2.almd:17:13
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
17 |   m.map(row => row.map(x => x * s))
   |             ^^
error: Lambda parameter must be wrapped in parentheses at line 17:13
  --> /tmp/dojo-matrix-ops-2.almd:17:13
   |
17 |   m.map(row => row.map(x => x * s))
   |             ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-2.almd:21:15
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
21 |   row_a.map(x => x * 1).fold(0, (acc, x) => acc + x)
   |               ^^
error: Lambda parameter must be wrapped in parentheses at line 21:15
  --> /tmp/dojo-matrix-ops-2.almd:21:15
   |
21 |   row_a.map(x => x * 1).fold(0, (acc, x) => acc + x)
   |               ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:10:28
  in variable col_idx
  hint: Check the variable name
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |                            ^^^^^^^
error[E003]: undefined variable 'row_idx'
  --> /tmp/dojo-matrix-ops-2.almd:10:15
  in variable row_idx
  hint: Check the variable name
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |               ^^^^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:1:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  |                                                                         ^
error[E001]: type mismatch in method call: expected Option[List[Int]] but got fn() -> ?2
  --> /tmp/dojo-matrix-ops-2.almd:7:17
  in method call
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = m.get(0).len()
  |                 ^
error[E001]: type mismatch in method call: expected Option[List[Int]] but got fn(Unknown) -> Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:10:9
  in method call
  hint: Fix the expression type or change the expected type
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |         ^
error[E001]: type mismatch in if branches: expected List[?1] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:10:57
  in if branches
  hint: Fix the expression type or change the expected type
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |                                                         ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:10:57
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |                                                         ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:16:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
   |
16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-2.almd:20:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
20 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

21 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  a.map(row_a => row_a.map((x, y) => x + y))
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if m == [] then [] else {
    let ncols = m.get(0).len()
    list.range(0, ncols).map(col_idx => {
      list.range(0, m.len()).map(row_idx => {
        m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  m.map(row => row.map(x => x * s))
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  row_a.map(x => x * 1).fold(0, (acc, x) => acc + x)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   a.map(row_a => row_a.map((x, y) => x + y))
  |               ^^
error: Lambda parameter must be wrapped in parentheses at line 2:15
  --> /tmp/dojo-matrix-ops-3.almd:2:15
  |
2 |   a.map(row_a => row_a.map((x, y) => x + y))
  |               ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-3.almd:8:38
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
8 |     list.range(0, ncols).map(col_idx => {
  |                                      ^^
error: Lambda parameter must be wrapped in parentheses at line 8:38
  --> /tmp/dojo-matrix-ops-3.almd:8:38
  |
8 |     list.range(0, ncols).map(col_idx => {
  |                                      ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-3.almd:9:42
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
9 |       list.range(0, m.len()).map(row_idx => {
  |                                          ^^
error: Lambda parameter must be wrapped in parentheses at line 9:42
  --> /tmp/dojo-matrix-ops-3.almd:9:42
  |
9 |       list.range(0, m.len()).map(row_idx => {
  |                                          ^
error: Expected expression at line 11:8 (got RParen ')')
  --> /tmp/dojo-matrix-ops-3.almd:11:8
   |
11 |       })
   |        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:6 (got RParen ')')
  --> /tmp/dojo-matrix-ops-3.almd:12:6
   |
12 |     })
   |      ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-3.almd:17:13
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
17 |   m.map(row => row.map(x => x * s))
   |             ^^
error: Lambda parameter must be wrapped in parentheses at line 17:13
  --> /tmp/dojo-matrix-ops-3.almd:17:13
   |
17 |   m.map(row => row.map(x => x * s))
   |             ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-matrix-ops-3.almd:21:15
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
   |
21 |   row_a.map(x => x * 1).fold(0, (acc, x) => acc + x)
   |               ^^
error: Lambda parameter must be wrapped in parentheses at line 21:15
  --> /tmp/dojo-matrix-ops-3.almd:21:15
   |
21 |   row_a.map(x => x * 1).fold(0, (acc, x) => acc + x)
   |               ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-3.almd:10:28
  in variable col_idx
  hint: Check the variable name
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |                            ^^^^^^^
error[E003]: undefined variable 'row_idx'
  --> /tmp/dojo-matrix-ops-3.almd:10:15
  in variable row_idx
  hint: Check the variable name
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |               ^^^^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:1:73
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  |                                                                         ^
error[E001]: type mismatch in method call: expected Option[List[Int]] but got fn() -> ?2
  --> /tmp/dojo-matrix-ops-3.almd:7:17
  in method call
  hint: Fix the expression type or change the expected type
  |
7 |     let ncols = m.get(0).len()
  |                 ^
error[E001]: type mismatch in method call: expected Option[List[Int]] but got fn(Unknown) -> Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:10:9
  in method call
  hint: Fix the expression type or change the expected type
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |         ^
error[E001]: type mismatch in if branches: expected List[?1] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:10:57
  in if branches
  hint: Fix the expression type or change the expected type
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |                                                         ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:10:57
  in fn 'mat_transpose'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
   |
10 |         m.get(row_idx).get(col_idx) |> option.unwrap_or(0)
   |                                                         ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:16:63
  in fn 'mat_scale'
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
   |
16 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   |                                                               ^
error[E001]: type mismatch in fn 'mat_dot_row': expected Int but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:20:61
  in fn 'mat_dot_row'
  hint: Fix the expression type or change the expected type
   |
20 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   |                                                             ^

21 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
