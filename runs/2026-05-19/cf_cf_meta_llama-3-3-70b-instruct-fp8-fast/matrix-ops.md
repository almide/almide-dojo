# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => list.map(x, (pair) => pair.0 + pair.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(m.0)), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'f' expects fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-0.almd:2:66
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(list.zip(a, b), (x) => list.map(x, (pair) => pair.0 + pair.1))
  |                                                                  ^^^^
error[E001]: type mismatch in call to list.map(): expected fn((List[Int], List[Int])) -> B but got fn(List[?1]) -> List[?2]
  --> /tmp/dojo-matrix-ops-0.almd:2:66
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(list.zip(a, b), (x) => list.map(x, (pair) => pair.0 + pair.1))
  |                                                                  ^^^^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a).unwrap_or(0)).unwrap_or([]), (x, y) => x + y))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(m.0) then [] 
  else list.map(list.range(0, list.len(m.0)), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E005]: argument 'f' expects fn(Int) -> B but got fn(?2, ?3) -> ?2
  --> /tmp/dojo-matrix-ops-1.almd:2:114
  in call to list.map()
  hint: Fix the argument type
  |
2 |   list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a).unwrap_or(0)).unwrap_or([]), (x, y) => x + y))
  |                                                                                                                  ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(?2, ?3) -> ?2
  --> /tmp/dojo-matrix-ops-1.almd:2:114
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   list.map(a, (row_a) => list.map(list.get(b, list.index_of(a, row_a).unwrap_or(0)).unwrap_or([]), (x, y) => x + y))
  |                                                                                                                  ^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(pair.0, pair.1), (pair) => pair.0 + pair.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m).unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m).unwrap_or([]))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```
