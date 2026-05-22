# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => 
    list.map(list.zip(x.0, x.1), (y) => y.0 + y.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(m.0)), (i) => 
    list.map(m, (row) => 
      list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
Compile error for /tmp/dojo-matrix-ops-0.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `0` on type `Vec<Vec<i64>>`
   --> <generated.rs>:278:67
    |
278 |         (almide_rt_list_range(0i64, almide_rt_list_len(&m.clone().0))).into_iter().map({
    |                                                                   ^ unknown field


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 2 warnings emitted

FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(b, (row_b) => 
      list.map(list.zip(row_a, row_b), (x) => x.0 + x.1)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(m.0)), (i) => 
    list.map(m, (row) => 
      list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[?5]]]
  --> /tmp/dojo-matrix-ops-1.almd:4:53
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
4 |       list.map(list.zip(row_a, row_b), (x) => x.0 + x.1)))
  |                                                     ^

1 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => 
    list.map(list.zip(x.0, x.1), (y) => y.0 + y.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(m.0) then [] 
  else list.map(list.range(0, list.len(m.0)), (i) => 
    list.map(m, (row) => 
      list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
Compile error for /tmp/dojo-matrix-ops-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `0` on type `Vec<Vec<i64>>`
   --> <generated.rs>:278:47
    |
278 |         if almide_rt_list_is_empty(&m.clone().0) {
    |                                               ^ unknown field


error[E0609]: no field `0` on type `Vec<Vec<i64>>`
   --> <generated.rs>:281:71
    |
281 |             (almide_rt_list_range(0i64, almide_rt_list_len(&m.clone().0))).into_iter().map({
    |                                                                       ^ unknown field


error: could not compile `almide-generated` (bin "almide-generated" test) due to 2 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(list.zip(row_a, list.get(b, list.index_of(a, row_a) |> option.unwrap_or(0)), (x) => x.0 + x.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (row) => 
      list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: Missing ',' between function arguments at line 5:1
  --> /tmp/dojo-matrix-ops-3.almd:5:1
  hint: Add a comma after the previous element. Example: f(a, b, c)
  |
5 | fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  | ^
error: Expected ')' to close function call opened at line 17:12
  --> /tmp/dojo-matrix-ops-3.almd:19:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
17 |   list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0
   |            --------------- '(' opened here
...
19 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
