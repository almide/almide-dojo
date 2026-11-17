# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) -> int
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
}
```

**Diagnostic:**

```
error: Expected expression at line 4:51 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-0.almd:4:51
  here: list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  |                                                   ^
error: Expected expression at line 11:41 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-0.almd:11:41
  here: let ncols = list.len(list.first(m)) -> int
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     let ncols = list.len(list.first(m)) -> int
   |                                         ^
error: Expected expression at line 12:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-0.almd:12:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |     list.range(0, ncols) -> (col_idx) => {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-0.almd:18:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 | }
   | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:11:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) -> int
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
11 |     let ncols = list.len(list.first(m)) -> int
   |                          ^^^^^^^^^^^^^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-0.almd:14:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
   |
14 |         list.get(row, col_idx) ?? 0
   |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:27:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-0.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => {
  |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-0.almd:10:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
   |
10 |   if list.is_empty(m) then [] else {
   |                            ^

10 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
  parse error: Expected expression at line 4:51 (got Arrow '->')
  parse error: Expected expression at line 11:41 (got Arrow '->')
  parse error: Expected expression at line 12:26 (got Arrow '->')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}
```

**Diagnostic:**

```
error: Expected expression at line 4:51 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-1.almd:4:51
  here: list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  |                                                   ^
error: Expected expression at line 12:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-1.almd:12:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |     list.range(0, ncols) -> (col_idx) => {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-1.almd:18:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 | }
   | ^
error: Expected expression at line 33:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-1.almd:33:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
33 |     list.range(0, ncols) -> (col_idx) => {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 39:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-1.almd:39:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
39 | }
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 30
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------------- first definition of 'mat_transpose' here
...
30 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 41
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ------------------------------------ first definition of 'mat_scale' here
...
41 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:11:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
11 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-1.almd:11:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
11 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-1.almd:14:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
   |
14 |         list.get(row, col_idx) ?? 0
   |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:27:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:32:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
32 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-1.almd:32:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
32 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-1.almd:35:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
   |
35 |         list.get(row, col_idx) ?? 0
   |                       ^^^^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-1.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => {
  |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-1.almd:10:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
   |
10 |   if list.is_empty(m) then [] else {
   |                            ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-1.almd:31:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
   |
31 |   if list.is_empty(m) then [] else {
   |                            ^

18 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
  parse error: Expected expression at line 4:51 (got Arrow '->')
  parse error: Expected expression at line 12:26 (got Arrow '->')
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:1 (got RBrace '}')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
```

**Diagnostic:**

```
error: Expected expression at line 4:51 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:4:51
  here: list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  |                                                   ^
error: Expected expression at line 12:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:12:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |     list.range(0, ncols) -> (col_idx) => {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:18:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 | }
   | ^
error: Expected expression at line 33:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:33:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
33 |     list.range(0, ncols) -> (col_idx) => {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 39:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:39:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
39 | }
   | ^
error: Expected expression at line 50:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:50:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
50 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
   |                                                 ^
error: Expected expression at line 58:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:58:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
58 |     list.range(0, ncols) -> (col_idx) => {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 64:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:64:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
64 | }
   | ^
error: Expected expression at line 75:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:75:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
75 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
   |                                                 ^
error: Expected expression at line 83:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:83:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
83 |     list.range(0, ncols) -> (col_idx) => {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 89:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:89:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
89 | }
   | ^
error: Expected expression at line 100:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:100:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
100 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 108:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:108:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
108 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 114:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:114:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
114 | }
    | ^
error: Expected expression at line 125:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:125:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
125 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 133:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:133:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
133 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 139:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:139:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
139 | }
    | ^
error: Expected expression at line 150:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:150:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
150 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 158:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:158:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
158 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 164:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:164:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
164 | }
    | ^
error: Expected expression at line 175:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:175:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
175 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 183:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:183:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
183 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 189:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:189:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
189 | }
    | ^
error: Expected expression at line 200:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:200:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
200 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 208:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:208:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
208 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 214:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:214:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
214 | }
    | ^
error: Expected expression at line 225:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:225:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
225 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 233:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:233:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
233 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 239:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:239:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
239 | }
    | ^
error: Expected expression at line 250:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:250:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
250 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 258:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:258:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
258 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 264:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:264:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
264 | }
    | ^
error: Expected expression at line 275:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:275:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
275 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 283:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:283:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
283 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 289:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:289:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
289 | }
    | ^
error: Expected expression at line 300:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:300:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
300 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 308:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:308:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
308 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 314:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:314:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
314 | }
    | ^
error: Expected expression at line 325:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:325:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
325 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 333:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:333:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
333 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 339:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:339:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
339 | }
    | ^
error: Expected expression at line 350:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:350:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
350 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 358:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:358:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
358 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 364:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:364:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
364 | }
    | ^
error: Expected expression at line 375:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:375:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
375 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 383:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:383:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
383 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 389:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:389:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
389 | }
    | ^
error: Expected expression at line 400:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:400:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
400 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 408:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:408:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
408 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 414:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:414:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
414 | }
    | ^
error: Expected expression at line 425:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:425:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
425 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 433:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:433:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
433 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 439:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:439:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
439 | }
    | ^
error: Expected expression at line 450:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:450:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
450 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                                 ^
error: Expected expression at line 458:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-2.almd:458:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
458 |     list.range(0, ncols) -> (col_idx) => {
    |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 464:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-2.almd:464:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
464 | }
    | ^
error: Expected expression at line 468:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-2.almd:468:1
  here: test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
468 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 30
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------------- first definition of 'mat_transpose' here
...
30 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 41
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ------------------------------------ first definition of 'mat_scale' here
...
41 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_add'
  at line 47
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------- first definition of 'mat_add' here
...
47 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 55
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------------- first definition of 'mat_transpose' here
...
55 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 66
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ------------------------------------ first definition of 'mat_scale' here
...
66 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_add'
  at line 72
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------- first definition of 'mat_add' here
...
72 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 80
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------------- first definition of 'mat_transpose' here
...
80 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 91
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ------------------------------------ first definition of 'mat_scale' here
...
91 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_add'
  at line 97
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------- first definition of 'mat_add' here
...
97 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 105
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
105 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 116
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
116 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 122
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
122 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 130
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
130 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 141
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
141 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 147
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
147 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 155
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
155 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 166
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
166 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 172
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
172 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 180
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
180 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 191
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
191 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 197
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
197 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 205
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
205 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 216
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
216 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 222
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
222 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 230
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
230 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 241
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
241 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 247
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
247 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 255
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
255 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 266
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
266 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 272
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
272 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 280
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
280 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 291
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
291 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 297
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
297 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 305
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
305 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 316
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
316 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 322
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
322 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 330
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
330 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 341
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
341 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 347
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
347 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 355
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
355 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 366
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
366 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 372
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
372 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 380
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
380 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 391
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
391 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 397
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
397 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 405
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
405 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 416
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
416 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 422
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
422 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 430
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
430 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 441
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
441 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 447
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
447 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 455
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
455 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 466
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
466 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
    | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x + list.get(b, list.index_of(a, row_a)) ?? [0] -> [0] -> x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:11:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
11 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:11:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
11 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:14:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
   |
14 |         list.get(row, col_idx) ?? 0
   |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:27:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:32:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
32 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:32:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
32 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:35:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
   |
35 |         list.get(row, col_idx) ?? 0
   |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:50:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
50 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:57:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
57 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:57:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
57 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:60:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
   |
60 |         list.get(row, col_idx) ?? 0
   |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:75:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
75 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:82:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
82 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:82:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
82 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:85:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
   |
85 |         list.get(row, col_idx) ?? 0
   |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:100:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
100 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:107:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
107 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:107:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
107 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:110:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
110 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:125:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
125 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:132:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
132 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:132:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
132 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:135:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
135 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:150:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
150 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:157:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
157 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:157:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
157 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:160:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
160 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:175:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
175 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:182:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
182 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:182:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
182 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:185:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
185 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:200:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
200 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:207:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
207 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:207:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
207 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:210:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
210 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:225:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
225 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:232:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
232 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:232:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
232 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:235:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
235 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:250:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
250 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:257:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
257 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:257:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
257 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:260:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
260 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:275:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
275 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:282:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
282 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:282:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
282 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:285:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
285 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:300:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
300 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:307:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
307 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:307:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
307 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:310:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
310 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:325:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
325 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:332:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
332 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:332:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
332 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:335:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
335 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:350:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
350 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:357:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
357 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:357:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
357 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:360:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
360 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:375:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
375 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:382:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
382 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:382:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
382 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:385:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
385 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:400:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
400 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:407:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
407 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:407:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
407 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:410:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
410 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:425:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
425 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:432:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
432 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:432:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
432 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:435:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
435 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:450:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
450 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:457:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
457 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:457:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
457 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-2.almd:460:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
    |
460 |         list.get(row, col_idx) ?? 0
    |                       ^^^^^^^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => {
  |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:10:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
   |
10 |   if list.is_empty(m) then [] else {
   |                            ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:31:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
   |
31 |   if list.is_empty(m) then [] else {
   |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:50:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
   |
50 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
   |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:48:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
   |
48 |   list.map(a, (row_a) => {
   |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:56:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
   |
56 |   if list.is_empty(m) then [] else {
   |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:75:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
   |
75 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
   |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:73:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
   |
73 |   list.map(a, (row_a) => {
   |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:81:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
   |
81 |   if list.is_empty(m) then [] else {
   |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:100:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
100 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:98:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
   |
98 |   list.map(a, (row_a) => {
   |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:106:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
106 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:125:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
125 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:123:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
123 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:131:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
131 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:150:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
150 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:148:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
148 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:156:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
156 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:175:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
175 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:173:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
173 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:181:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
181 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:200:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
200 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:198:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
198 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:206:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
206 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:225:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
225 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:223:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
223 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:231:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
231 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:250:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
250 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:248:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
248 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:256:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
256 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:275:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
275 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:273:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
273 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:281:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
281 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:300:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
300 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:298:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
298 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:306:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
306 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:325:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
325 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:323:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
323 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:331:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
331 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:350:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
350 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:348:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
348 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:356:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
356 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:375:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
375 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:373:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
373 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:381:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
381 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:400:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
400 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:398:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
398 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:406:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
406 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:425:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
425 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:423:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
423 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:431:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
431 |   if list.is_empty(m) then [] else {
    |                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:450:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
    |
450 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-2.almd:448:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
448 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-2.almd:456:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
    |
456 |   if list.is_empty(m) then [] else {
    |                            ^

240 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
  parse error: Expected expression at line 4:51 (got Arrow '->')
  parse error: Expected expression at line 12:26 (got Arrow '->')
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:1 (got RBrace '}')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) -> (col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
      })
    }
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
}
```

**Diagnostic:**

```
error: Expected expression at line 4:49 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-3.almd:4:49
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  |                                                 ^
error: Expected expression at line 12:26 (got Arrow '->')
  --> /tmp/dojo-matrix-ops-3.almd:12:26
  here: list.range(0, ncols) -> (col_idx) => {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |     list.range(0, ncols) -> (col_idx) => {
   |                          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:1 (got RBrace '}')
  --> /tmp/dojo-matrix-ops-3.almd:18:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 | }
   | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:11:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
11 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:11:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
11 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E003]: undefined variable 'col_idx'
  --> /tmp/dojo-matrix-ops-3.almd:14:23
  in variable col_idx
  here: list.get(row, col_idx) ?? 0
  hint: Check the variable name
   |
14 |         list.get(row, col_idx) ?? 0
   |                       ^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:27:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:4:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 -> x + list.get(b, list.index_of(a, row_a)) ?? 0 -> x
  |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[Unit]]
  --> /tmp/dojo-matrix-ops-3.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => {
  |           ^
error[E001]: type mismatch in fn 'mat_transpose': expected List[List[Int]] but got List[Int]
  --> /tmp/dojo-matrix-ops-3.almd:10:28
  in fn 'mat_transpose'
  here: if list.is_empty(m) then [] else {
  hint: Fix the expression type or change the expected type
   |
10 |   if list.is_empty(m) then [] else {
   |                            ^

11 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
  parse error: Expected expression at line 4:49 (got Arrow '->')
  parse error: Expected expression at line 12:26 (got Arrow '->')
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 18:1 (got RBrace '}')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
