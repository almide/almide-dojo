# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:6:56
  in call to list.get()
  here: list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | -------------------------- fn list.get() defined here
...
6 |       list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))),
  |                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:6:19
  in call to list.get()
  here: list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))),
  hint: the argument is an Option[Int] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | -------------------------- fn list.get() defined here
...
6 |       list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))),
  |                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:6:7
  in call to list.get()
  here: list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))),
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = list.fold(
   | -------------------------- fn list.get() defined here
...
6 |       list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))),
  |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and List[Int]
  --> /tmp/dojo-matrix-ops-0.almd:8:11
  in operator +
  here: ) ?? [0]) ?? 0,
  hint: Use + with numeric types, String, or List
  |
8 |     ) ?? [0]) ?? 0,
  |           ^
error[E034]: operator '??' requires Option or Result type but got Int
  --> /tmp/dojo-matrix-ops-0.almd:8:18
  in operator ??
  here: ) ?? [0]) ?? 0,
  hint: Use '??' only on Option[T] or Result[T, E] values
  |
8 |     ) ?? [0]) ?? 0,
  |                  ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:5:5
  in call to list.map()
  here: (y, i) => (y + list.get(
  hint: Fix the argument type
...
5 |     (y, i) => (y + list.get(
  |     ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:14:26
  in call to list.len()
  here: list.range(0, list.len(list.first(m))),
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
15 |   (i) => list.map(m, (x) => list.get(x, i) ?? 0),
   | -------------------------- fn list.len() defined here
...
14 |   list.range(0, list.len(list.first(m))),
   |                          ^^^^^^^^^^^^^

7 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(pair.0, pair.1), (pair) => pair.0 + pair.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```
