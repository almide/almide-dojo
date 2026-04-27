# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0609`

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    list.range(0, list.get(m, 0) |> option.unwrap_or([]) |> list.len) 
    |> list.map((i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:2:116
  in call to list.get()
  hint: Fix the argument type
  |
2 |     list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                    ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-0.almd:2:116
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |     list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                    ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:2:139
  in call to list.map()
  hint: Fix the argument type
  |
2 |     list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                           ^
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-0.almd:12:69
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
12 |     list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
   |                                                                     ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:2:116
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
2 |     list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                    ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:2:139
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |     list.map(a, (x) => list.map(x, (y, i) => y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)))
  |                                                                                                                                           ^

6 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(list.zip(a, b), (x) => list.map(list.zip(x._1, x._2), (y) => y._1 + y._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    list.range(0, list.first(m) |> option.unwrap_or([]) |> list.len) 
    |> list.map((i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E003]: undefined variable 'y'
  --> /tmp/dojo-matrix-ops-1.almd:12:69
  in variable y
  hint: Did you mean `x`?
  try:
      // y  →  x
      x
   |
12 |     list.fold(list.zip(row_a, col_b), 0, (acc, (x, y)) => acc + x * y)
   |                                                                     ^

1 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.first(b) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    list.range(0, list.first(m) |> option.unwrap_or([]) |> list.len) 
    |> list.map((i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x._1 * x._2)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-2.almd:2:106
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |     list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.first(b) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                          ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:2:129
  in call to list.map()
  hint: Fix the argument type
  |
2 |     list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.first(b) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                 ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-2.almd:2:129
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |     list.map(a, (row_a) => list.map(row_a, (x, i) => x + list.get(list.first(b) |> option.unwrap_or([]), i) |> option.unwrap_or(0)))
  |                                                                                                                                 ^

3 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(list.zip(a, b), (pair) => list.map(list.zip(pair._1, pair._2), (x) => x._1 + x._2))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    list.range(0, list.len(list.first(m) |> option.unwrap_or([]))) 
    |> list.map((i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x._1 * x._2)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-3.almd
Compile error for /tmp/dojo-matrix-ops-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0609]: no field `_1` on type `(Vec<i64>, Vec<i64>)`
   --> <generated.rs>:268:116
    |
268 | ...ter().map(move |pair| (almide_rt_list_zip((pair.clone()._1).to_vec(), (pair._2).to_vec())).into_iter().map(move |x| {
    |                                                            ^^ unknown field
    |
help: a field with a similar name exists
    |
268 -     (almide_rt_list_zip((a).to_vec(), (b).to_vec())).into_iter().map(move |pair| (almide_rt_list_zip((pair.clone()._1).to_vec(), (pair._2).to_vec())).into_iter().map(move |x| {
268 +     (almide_rt_list_zip((a).to_vec(), (b).to_vec())).into_iter().map(move |pair| (almide_rt_list_zip((pair.clone().1).to_vec(), (pair._2).to_vec())).into_iter().map(move |x| {
    |


error[E0609]: no field `_2` on type `(Vec<i64>, Vec<i64>)`
   --> <generated.rs>:268:136
    |
268 | ...| (almide_rt_list_zip((pair.clone()._1).to_vec(), (pair._2).to_vec())).into_iter().map(move |x| {
    |                                                            ^^ unknown field
    |
    = note: available fields are: `0`, `1`


error[E0609]: no field `_1` on type `(_, _)`
   --> <generated.rs>:270:12
    |
270 |         (x._1 + x._2)
    |            ^^ unknown field
    |
help: a field with a similar name exists
    |
270 -         (x._1 + x._2)
270 +         (x.1 + x._2)
    |


error[E0609]: no field `_2` on type `(_, _)`
   --> <generated.rs>:270:19
    |
270 |         (x._1 + x._2)
    |                   ^^ unknown field
    |
    = note: available fields are: `0`, `1`


error[E0609]: no field `_1` on type `(i64, i64)`
   --> <generated.rs>:291:19
    |
291 |         (acc + (x._1 * x._2))
    |                   ^^ unknown field
    |
help: a field with a similar name exists
    |
291 -         (acc + (x._1 * x._2))
291 +         (acc + (x.1 * x._2))
    |


error[E0609]: no field `_2` on type `(i64, i64)`
   --> <generated.rs>:291:26
    |
291 |         (acc + (x._1 * x._2))
    |                          ^^ unknown field
    |
    = note: available fields are: `0`, `1`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 6 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
