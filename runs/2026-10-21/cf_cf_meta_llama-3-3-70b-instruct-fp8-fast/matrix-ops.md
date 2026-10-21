# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => (y) => list.map(x, (i) => int.parse(int.to_string(y) + int.to_string(i)) |> result.unwrap_or(0)), b)

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(pair.0, pair.1), (pair2) => pair2.0 + pair2.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(m.0)), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```

**Diagnostic:**

```
error[E012]: duplicate function 'mat_add'
  at line 7
  in fn mat_add
  here: fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  | ---------------------------------- first definition of 'mat_add' here
...
7 | fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = list.map(
  | ^
error[E004]: list.map() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-0.almd:4:3
  in call to list.map()
  here: b,
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 3
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
  |
4 |   b,
  |   ^
error[E045]: tuple index .0 on non-tuple type List[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:13:38
  in tuple index
  here: else list.map(list.range(0, list.len(m.0)), (i) => list.map(m, (row) => list.get(row, i) ?? 0))
  hint: only tuple values support positional .k access
   |
13 | else list.map(list.range(0, list.len(m.0)), (i) => list.map(m, (row) => list.get(row, i) ?? 0))
   |                                      ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[fn(Int) -> List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:3
  in fn 'mat_add'
  here: b,
  hint: Fix the expression type or change the expected type
  |
4 |   b,
  |   ^

4 error(s) found
FAILED: /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => list.map(list.zip(pair.0, pair.1), (pair2) => pair2.0 + pair2.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(m.0)), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```

**Diagnostic:**

```
error[E045]: tuple index .0 on non-tuple type List[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:7:38
  in tuple index
  here: else list.map(list.range(0, list.len(m.0)), (i) => list.map(m, (row) => list.get(row, i) ?? 0))
  hint: only tuple values support positional .k access
  |
7 | else list.map(list.range(0, list.len(m.0)), (i) => list.map(m, (row) => list.get(row, i) ?? 0))
  |                                      ^

1 error(s) found
FAILED: /tmp/dojo-matrix-ops-1.almd
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:3:33
  in call to list.map()
  here: (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) ?? [], j) ?? 0),
  hint: Fix the argument type
...
3 |   (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) ?? [], j) ?? 0),
  |                                 ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[Int], Int) -> List[?7]
  --> /tmp/dojo-matrix-ops-2.almd:3:3
  in call to list.map()
  here: (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) ?? [], j) ?? 0),
  hint: Fix the argument type
...
3 |   (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) ?? [], j) ?? 0),
  |   ^
error[E025]: cannot infer a concrete type for this expression (type List[?7])
  --> /tmp/dojo-matrix-ops-2.almd:3:17
  in this expression with an unconstrained type
  here: (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) ?? [], j) ?? 0),
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: List[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
3 |   (row_a, i) => list.map(row_a, (x, j) => x + list.get(list.get(b, i) ?? [], j) ?? 0),
  |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get_or(a, 0, [])), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```

**Diagnostic:**

```
error[E005]: argument 'i' expects Int but got List[Int]
  --> /tmp/dojo-matrix-ops-3.almd:3:65
  in call to list.get()
  here: (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get_or(a, 0, [])), i) ?? 0),
  hint: Fix the argument type
   |
23 | test "mat_add 2x2" {
   | -------------------------- fn list.get() defined here
...
3 |   (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get_or(a, 0, [])), i) ?? 0),
  |                                                                 ^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-3.almd:3:53
  in call to list.get()
  here: (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get_or(a, 0, [])), i) ?? 0),
  hint: the argument is an Option[List[Int]] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
   |
23 | test "mat_add 2x2" {
   | -------------------------- fn list.get() defined here
...
3 |   (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get_or(a, 0, [])), i) ?? 0),
  |                                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Int, Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:3:30
  in call to list.map()
  here: (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get_or(a, 0, [])), i) ?? 0),
  hint: Fix the argument type
...
3 |   (row_a) => list.map(row_a, (x, i) => x + list.get(list.get(b, list.get_or(a, 0, [])), i) ?? 0),
  |                              ^

3 error(s) found
FAILED: /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
