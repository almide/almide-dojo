# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => list.map(x, (y) => y.0 + y.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
                (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'f' expects fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-0.almd:2:60
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(list.zip(a, b), (x) => list.map(x, (y) => y.0 + y.1))
  |                                                            ^
error[E001]: type mismatch in call to list.map(): expected fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-0.almd:2:60
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(list.zip(a, b), (x) => list.map(x, (y) => y.0 + y.1))
  |                                                            ^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), (x, y) => x + y))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
                (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E005]: argument 'f' expects fn(Int) -> B but got fn(?2, ?3) -> ?2
  --> /tmp/dojo-matrix-ops-1.almd:2:134
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), (x, y) => x + y))
  |                                                                                                                                      ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(?2, ?3) -> ?2
  --> /tmp/dojo-matrix-ops-1.almd:2:134
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), (x, y) => x + y))
  |                                                                                                                                      ^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), (x) => x + list.get(row_a, list.index_of(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), x) |> option.unwrap_or(0)) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
                (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a:
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected type name at line 13:22 (got Newline '')
  --> /tmp/dojo-matrix-ops-2.almd:13:22
   |
13 | fn mat_dot_row(row_a:
   |                      ^
error: operator '+' requires numeric, String, or List types but got Int and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:2:269
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), (x) => x + list.get(row_a, list.index_of(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), x) |> option.unwrap_or(0)) |> option.unwrap_or(0)))
  |                                                                                                                                                                                                                                                                             ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:2:293
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), (x) => x + list.get(row_a, list.index_of(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), x) |> option.unwrap_or(0)) |> option.unwrap_or(0)))
  |                                                                                                                                                                                                                                                                                                     ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-matrix-ops-2.almd:2:293
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), (x) => x + list.get(row_a, list.index_of(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), x) |> option.unwrap_or(0)) |> option.unwrap_or(0)))
  |                                                                                                                                                                                                                                                                                                     ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), 
                (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x,
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Expected expression at line 14:49 (got Newline '')
  --> /tmp/dojo-matrix-ops-3.almd:14:49
   |
14 |   list.fold(list.zip(row_a, col_b), 0, (acc, (x,
   |                                                 ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:2:150
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                      ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:2:173
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                                             ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:2:173
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                                                             ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
