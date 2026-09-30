# matrix-ops

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m))
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:6:21
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                     ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-0.almd:6:53
  in operator +
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Use + with numeric types, String, or List
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:15:26
  in call to list.len()
  here: let ncols = list.len(list.first(m))
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |     let ncols = list.len(list.first(m))
   | -------------------------- fn list.len() defined here
   |
15 |     let ncols = list.len(list.first(m))
   |                          ^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:31:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
31 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-0.almd:6:49
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-0.almd:6:53
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^

6 error(s) found
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:6:21
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                     ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-1.almd:6:53
  in operator +
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Use + with numeric types, String, or List
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:15:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   | -------------------------- fn list.len() defined here
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   |                          ^^^^^^^^^^^^^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-1.almd:15:44
  in operator ??
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: Use '??' only on Option[T] or Result[T, E] values
   |
15 |     let ncols = list.len(list.first(m)) ?? 0
   |                                            ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-1.almd:31:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
31 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-1.almd:6:49
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                 ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-1.almd:6:53
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
6 |         list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                     ^

7 error(s) found
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
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = {
  list.map(a, (row_a) => {
    list.map(row_a, (x) => {
      list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) |> option.unwrap_or(0)
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
}

fn mat_add(a: List[List[Int]], b: List[List[Int]]) ->
```

**Diagnostic:**

```
error: Expected type name at line 436:54 (got Newline '')
  --> /tmp/dojo-matrix-ops-2.almd:436:54
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) ->
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
436 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) ->
    |                                                      ^
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
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |   })
   | -------------------------- fn list.get() defined here
...
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:4:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:11:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |       })
   | -------------------------- fn list.len() defined here
...
11 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
   |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:11:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | }
   | ---------------------------------- fn option.unwrap_or() defined here
...
11 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
   |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:27:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |   })
   | -------------------------- fn list.get() defined here
...
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:27:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:27:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | }
   | ---------------------------------- fn option.unwrap_or() defined here
...
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:33:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |   })
   | -------------------------- fn list.get() defined here
...
33 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:33:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
33 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:40:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |       })
   | -------------------------- fn list.len() defined here
...
40 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
   |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:40:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | }
   | ---------------------------------- fn option.unwrap_or() defined here
...
40 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
   |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:56:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |   })
   | -------------------------- fn list.get() defined here
...
56 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:56:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
56 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:56:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | }
   | ---------------------------------- fn option.unwrap_or() defined here
...
56 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:62:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |   })
   | -------------------------- fn list.get() defined here
...
62 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:62:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
62 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:69:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |       })
   | -------------------------- fn list.len() defined here
...
69 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
   |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:69:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | }
   | ---------------------------------- fn option.unwrap_or() defined here
...
69 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
   |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:85:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |   })
   | -------------------------- fn list.get() defined here
...
85 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:85:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
   |
85 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:85:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | }
   | ---------------------------------- fn option.unwrap_or() defined here
...
85 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
   |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:91:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |   })
   | -------------------------- fn list.get() defined here
...
91 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:91:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
   |
91 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:98:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |       })
   | -------------------------- fn list.len() defined here
...
98 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
   |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:98:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
   |
24 | }
   | ---------------------------------- fn option.unwrap_or() defined here
...
98 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
   |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:114:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
114 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:114:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
114 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:114:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
114 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:120:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
120 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:120:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
120 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:127:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
127 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:127:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
127 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:143:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
143 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:143:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
143 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:143:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
143 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:149:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
149 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:149:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
149 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:156:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
156 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:156:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
156 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:172:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
172 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:172:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
172 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:172:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
172 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:178:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
178 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:178:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
178 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:185:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
185 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:185:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
185 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:201:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
201 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:201:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
201 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:201:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
201 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:207:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
207 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:207:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
207 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:214:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
214 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:214:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
214 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:230:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
230 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:230:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
230 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:230:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
230 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:236:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
236 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:236:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
236 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:243:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
243 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:243:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
243 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:259:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
259 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:259:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
259 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:259:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
259 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:265:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
265 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:265:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
265 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:272:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
272 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:272:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
272 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:288:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
288 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:288:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
288 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:288:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
288 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:294:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
294 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:294:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
294 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:301:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
301 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:301:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
301 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:317:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
317 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:317:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
317 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:317:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
317 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:323:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
323 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:323:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
323 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:330:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
330 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:330:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
330 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:346:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
346 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:346:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
346 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:346:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
346 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:352:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
352 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:352:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
352 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:359:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
359 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:359:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
359 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:375:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
375 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:375:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
375 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:375:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
375 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:381:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
381 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:381:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
381 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:388:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
388 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:388:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
388 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:404:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
404 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:404:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
404 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:404:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
404 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:410:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
410 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-2.almd:410:69
  in operator +
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Use + with numeric types, String, or List
    |
410 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-2.almd:417:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 15 |       })
    | -------------------------- fn list.len() defined here
 ...
417 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                          ^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:417:61
  in call to option.unwrap_or()
  here: let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
417 |     let ncols = list.len(list.first(m)) |> option.unwrap_or(0)
    |                                                             ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:433:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
    |
 23 |   })
    | -------------------------- fn list.get() defined here
 ...
433 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '*' requires numeric types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:433:61
  in operator *
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: Use numeric types (Int or Float)
    |
433 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:433:106
  in call to option.unwrap_or()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
  hint: nothing to unwrap — the value is already Int. In an effect fn, a Result-returning call is auto-propagated (`?`), so its value arrives unwrapped; for a fallback, apply `?? <default>` to the producing call instead
    |
 24 | }
    | ---------------------------------- fn option.unwrap_or() defined here
 ...
433 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) |> option.unwrap_or(0))
    |                                                                                                          ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:4:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:4:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:33:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
33 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:33:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
33 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:62:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
62 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:62:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
62 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:91:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
91 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:91:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
   |
91 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
   |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:120:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
120 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:120:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
120 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:149:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
149 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:149:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
149 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:178:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
178 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:178:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
178 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:207:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
207 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:207:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
207 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:236:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
236 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:236:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
236 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:265:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
265 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:265:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
265 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:294:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
294 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:294:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
294 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:323:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
323 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:323:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
323 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:352:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
352 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:352:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
352 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:381:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
381 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:381:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
381 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:410:64
  in call to option.unwrap_or()
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
410 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-2.almd:410:69
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
  hint: Fix the expression type or change the expected type
    |
410 |       list.get(b, list.index_of(a, row_a)) |> option.unwrap_or(0) + x
    |                                                                     ^

192 error(s) found
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
      list.get(b, list.index_of(a, row_a)) ?? 0 + x
    })
  })
}

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = {
  if list.is_empty(m) then [] else {
    let ncols = list.len(list.first(m)) ?? 0
    list.range(0, ncols) |> list.map((col_idx) => {
      list.map(m, (row) => {
        list.get(row, col_idx) ?? 0
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
  list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
}
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:19
  in call to list.get()
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |   })
   | -------------------------- fn list.get() defined here
...
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                   ^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got List[Int] and Int
  --> /tmp/dojo-matrix-ops-3.almd:4:51
  in operator +
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Use + with numeric types, String, or List
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                   ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:11:26
  in call to list.len()
  here: let ncols = list.len(list.first(m)) ?? 0
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |       })
   | -------------------------- fn list.len() defined here
...
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
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:27:61
  in call to list.get()
  here: list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 |   })
   | -------------------------- fn list.get() defined here
...
27 |   list.fold(row_a, 0, (acc, x) => acc + x * list.get(col_b, list.index_of(row_a, x)) ?? 0)
   |                                                             ^^^^^^^^^^^^^^^^^^^^^^^
error[E001]: type mismatch in ?? fallback: expected List[Int] but got Int
  --> /tmp/dojo-matrix-ops-3.almd:4:47
  in ?? fallback
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                               ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[Int]]]
  --> /tmp/dojo-matrix-ops-3.almd:4:51
  in fn 'mat_add'
  here: list.get(b, list.index_of(a, row_a)) ?? 0 + x
  hint: Fix the expression type or change the expected type
  |
4 |       list.get(b, list.index_of(a, row_a)) ?? 0 + x
  |                                                   ^

7 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
