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
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0)
}
```

**Diagnostic:**

```
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-0.almd:4:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:11:26
  in call to list.len()
  here: let ncols = list.len(list.first(m))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
11 |     let ncols = list.len(list.first(m))
   |                          ^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:27:75
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0)
   |                                                                           ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:27:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:4:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => {
  |           ^

8 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0)
}
```

**Diagnostic:**

```
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:4:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:4:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                                           ^
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
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:27:75
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0)
   |                                                                           ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:27:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:4:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => {
  |           ^

9 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}
```

**Diagnostic:**

```
error[E012]: duplicate function 'mat_add'
  at line 30
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------- first definition of 'mat_add' here
...
30 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 38
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------------- first definition of 'mat_transpose' here
...
38 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 49
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ------------------------------------ first definition of 'mat_scale' here
...
49 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 55
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   | -------------------------------------- first definition of 'mat_dot_row' here
...
55 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   | ^
error[E012]: duplicate function 'mat_add'
  at line 59
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------- first definition of 'mat_add' here
...
59 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 67
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------------- first definition of 'mat_transpose' here
...
67 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 78
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ------------------------------------ first definition of 'mat_scale' here
...
78 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 84
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   | -------------------------------------- first definition of 'mat_dot_row' here
...
84 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:4:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:4:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                                           ^
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
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:27:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:27:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:33:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
33 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:33:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
33 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:33:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
   |
33 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:40:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
40 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:40:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
40 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:56:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
56 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:56:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
56 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:62:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
62 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:62:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
62 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:62:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
   |
62 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:69:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
69 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-2.almd:69:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
69 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:85:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
85 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:85:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
85 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => {
  |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:33:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
   |
33 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:31:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
   |
31 |   list.map(a, (row_a) => {
   |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:62:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
   |
62 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:60:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
   |
60 |   list.map(a, (row_a) => {
   |           ^

35 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s)
  })
}

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.map(list.range(0, ncols), (i) => {
      list.map(m, (row) => {
        list.get(row, i) ?? 0
      })
    })
  }
}

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  list.map(m, (row) => {
    list.map(row, (x) => x * s
```

**Diagnostic:**

```
error: Expected ')' to close function call opened at line 457:13
  --> /tmp/dojo-matrix-ops-3.almd:459:1
  here: test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
  hint: Add ')' or check for a missing delimiter inside the function call
    |
457 |     list.map(row, (x) => x * s
    |             --------------- '(' opened here
 ...
459 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
    | ^^^^
error: Expected ')' to close function call opened at line 456:11
  --> /tmp/dojo-matrix-ops-3.almd:460:1
  here: test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
  hint: Add ')' or check for a missing delimiter inside the function call
    |
456 |   list.map(m, (row) => {
    |           --------------- '(' opened here
 ...
460 | test "mat_add 1x1" { assert_eq(mat_add([[1]], [[2]]), [[3]]) }
    | ^^^^
error[E012]: duplicate function 'mat_add'
  at line 30
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------- first definition of 'mat_add' here
...
30 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 38
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------------- first definition of 'mat_transpose' here
...
38 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 49
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ------------------------------------ first definition of 'mat_scale' here
...
49 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 55
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   | -------------------------------------- first definition of 'mat_dot_row' here
...
55 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   | ^
error[E012]: duplicate function 'mat_add'
  at line 59
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------- first definition of 'mat_add' here
...
59 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 67
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------------- first definition of 'mat_transpose' here
...
67 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 78
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ------------------------------------ first definition of 'mat_scale' here
...
78 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 84
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   | -------------------------------------- first definition of 'mat_dot_row' here
...
84 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
   | ^
error[E012]: duplicate function 'mat_add'
  at line 88
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------- first definition of 'mat_add' here
...
88 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_transpose'
  at line 96
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ---------------------------------------- first definition of 'mat_transpose' here
...
96 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
   | ^
error[E012]: duplicate function 'mat_scale'
  at line 107
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
107 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 113
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
113 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 117
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
117 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 125
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
125 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 136
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
136 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 142
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
142 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 146
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
146 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 154
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
154 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 165
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
165 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 171
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
171 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 175
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
175 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 183
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
183 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 194
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
194 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 200
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
200 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 204
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
204 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 212
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
212 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 223
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
223 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 229
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
229 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 233
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
233 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 241
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
241 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 252
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
252 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 258
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
258 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 262
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
262 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 270
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
270 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 281
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
281 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 287
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
287 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 291
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
291 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 299
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
299 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 310
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
310 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 316
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
316 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 320
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
320 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 328
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
328 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 339
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
339 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 345
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
345 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 349
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
349 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 357
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
357 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 368
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
368 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 374
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
374 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 378
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
378 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 386
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
386 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 397
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
397 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 403
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
403 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 407
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
407 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 415
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
415 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 426
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
426 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_dot_row'
  at line 432
  in fn mat_dot_row
  here: fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 26 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | -------------------------------------- first definition of 'mat_dot_row' here
 ...
432 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = {
    | ^
error[E012]: duplicate function 'mat_add'
  at line 436
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------- first definition of 'mat_add' here
 ...
436 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_transpose'
  at line 444
  in fn mat_transpose
  here: fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  9 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ---------------------------------------- first definition of 'mat_transpose' here
 ...
444 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
    | ^
error[E012]: duplicate function 'mat_scale'
  at line 455
  in fn mat_scale
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
 20 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ------------------------------------ first definition of 'mat_scale' here
 ...
455 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    | ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:4:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:4:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                                           ^
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
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:27:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:27:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:33:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
33 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:33:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
33 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:33:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
   |
33 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:40:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
40 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:40:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
40 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:56:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
56 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:56:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
56 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:62:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
62 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:62:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
62 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:62:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
   |
62 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:69:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
69 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:69:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
69 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:85:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
85 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:85:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
85 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
   |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:91:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
91 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:91:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
91 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:91:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
   |
91 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:98:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
98 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:98:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
98 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:114:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
114 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:114:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
114 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:120:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
120 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:120:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
120 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:120:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
120 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:127:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
127 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:127:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
127 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:143:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
143 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:143:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
143 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:149:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
149 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:149:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
149 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:149:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
149 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:156:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
156 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:156:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
156 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:172:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
172 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:172:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
172 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:178:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
178 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:178:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
178 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:178:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
178 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:185:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
185 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:185:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
185 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:201:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
201 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:201:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
201 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:207:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
207 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:207:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
207 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:207:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
207 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:214:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
214 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:214:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
214 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:230:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
230 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:230:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
230 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:236:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
236 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:236:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
236 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:236:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
236 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:243:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
243 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:243:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
243 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:259:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
259 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:259:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
259 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:265:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
265 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:265:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
265 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:265:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
265 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:272:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
272 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:272:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
272 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:288:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
288 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:288:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
288 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:294:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
294 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:294:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
294 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:294:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
294 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:301:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
301 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:301:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
301 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:317:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
317 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:317:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
317 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:323:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
323 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:323:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
323 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:323:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
323 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:330:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
330 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:330:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
330 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:346:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
346 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:346:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
346 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:352:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
352 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:352:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
352 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:352:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
352 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:359:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
359 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:359:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
359 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:375:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
375 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:375:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
375 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:381:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
381 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:381:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
381 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:381:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
381 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:388:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
388 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:388:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
388 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:404:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
404 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:404:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
404 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:410:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
410 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:410:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
410 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:410:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
410 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:417:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
417 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:417:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
417 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:433:76
  in call to list.index_of()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
433 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                                            ^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:433:62
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
433 |   list.fold(row_a, 0, (acc, x) => acc + x * (list.get(col_b, list.index_of(list.first(col_b), x)) ?? 0))
    |                                                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:439:33
  in call to list.index_of()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
439 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                 ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:439:19
  in call to list.get()
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
439 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:439:59
  in operator +
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Use + with numeric types, String, List, or Bytes
    |
439 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                           ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:446:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
446 |     let ncols = list.len(list.first(m)) ?? 0
    |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-3.almd:446:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
    |
446 |     let ncols = list.len(list.first(m)) ?? 0
    |                                            ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:4:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:2:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => {
  |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:33:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
   |
33 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:31:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
   |
31 |   list.map(a, (row_a) => {
   |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:62:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
   |
62 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:60:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
   |
60 |   list.map(a, (row_a) => {
   |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:91:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
   |
91 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
   |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:89:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
   |
89 |   list.map(a, (row_a) => {
   |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:120:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
120 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:118:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
118 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:149:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
149 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:147:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
147 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:178:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
178 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:176:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
176 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:207:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
207 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:205:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
205 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:236:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
236 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:234:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
234 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:265:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
265 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:263:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
263 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:294:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
294 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:292:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
292 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:323:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
323 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:321:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
321 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:352:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
352 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:350:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
350 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:381:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
381 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:379:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
379 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:410:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
410 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:408:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
408 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:439:55
  in ?? fallback
  here: list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
  hint: Fix the expression type or change the expected type
    |
439 |       list.get(b, list.index_of(list.first(b), x)) ?? 0 + x
    |                                                       ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:437:11
  in fn 'mat_add'
  here: list.map(a, (row_a) => {
  hint: Fix the expression type or change the expected type
    |
437 |   list.map(a, (row_a) => {
    |           ^
error[E001]: type mismatch in fn 'mat_scale': expected List[List[Int]] but got Unit
  --> /tmp/dojo-matrix-ops-3.almd:455:63
  in fn 'mat_scale'
  here: fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
  hint: Fix the expression type or change the expected type. Or Got Unit where a List was expected. `list.push`/`pop`/`clear` mutate and return Unit — use `xs + [item]` for an immutable append. `for x in xs { ... }` is a side-effect loop (Unit); for element transforms, use `list.map(xs, (x) => ...)`.
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to List[List[Int]]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type List[List[Int]]
    |
455 | fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = {
    |                                                               ^

204 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
  parse error: Expected ')' to close function call opened at line 457:13
  parse error: Expected ')' to close function call opened at line 456:11
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-matrix-ops-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
