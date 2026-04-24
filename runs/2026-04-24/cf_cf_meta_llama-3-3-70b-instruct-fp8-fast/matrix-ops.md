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
  list.map(a, (row) => 
    list.map(row, (val, i) => 
      val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)
  ))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (val) => val * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:81
  in call to list.get()
  hint: Fix the argument type
  |
4 |       val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                 ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-0.almd:4:81
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                 ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:104
  in call to list.map()
  hint: Fix the argument type
  |
4 |       val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                                        ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:10:51
  in call to list.len()
  hint: Fix the argument type
   |
10 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
   |                                                   ^
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-0.almd:18:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
18 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:81
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |       val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                 ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:104
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       val + list.get(list.get(b, list.index_of(a, row) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                                        ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:10:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
10 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
   |                                                   ^

8 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => 
    list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m)) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (val) => val * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-1.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:8:36
  in call to list.is_empty()
  hint: Fix the argument type
  |
8 |   else if list.is_empty(list.first(m)) then []
  |                                    ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:9:51
  in call to list.len()
  hint: Fix the argument type
  |
9 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                   ^
error[E003]: undefined variable 'b'
  --> /tmp/dojo-matrix-ops-1.almd:17:67
  in variable b
  hint: Did you mean `a`?
  try:
      // b  →  a
      a
   |
17 |   list.fold(list.zip(row_a, col_b), 0, (acc, (a, b)) => acc + a * b)
   |                                                                   ^
error[E001]: type mismatch in call to list.is_empty(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:8:36
  in call to list.is_empty()
  hint: Fix the expression type or change the expected type
  |
8 |   else if list.is_empty(list.first(m)) then []
  |                                    ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:9:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
9 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                   ^

5 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(b, (row_b) => 
      list.map(list.zip(row_a, row_b), (pair) => pair._1 + pair._2)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (val) => val * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair._1 * pair._
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-2.almd
error: Expected name at line 19:76 (got Underscore '_')
  --> /tmp/dojo-matrix-ops-2.almd:19:76
   |
19 |   list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair._1 * pair._
   |                                                                            ^
error[E001]: type mismatch in fn 'mat_add': expected List[List[Int]] but got List[List[List[?5]]]
  --> /tmp/dojo-matrix-ops-2.almd:4:60
  in fn 'mat_add'
  hint: Fix the expression type or change the expected type
  |
4 |       list.map(list.zip(row_a, row_b), (pair) => pair._1 + pair._2)
  |                                                            ^^^^

2 error(s) found
Compile error for /tmp/dojo-matrix-ops-2.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => 
    list.map(list.zip(pair._1, pair._2), (pair) => pair._1 + pair._2)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => list.map(row, (val) => val * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair._1 * pair._2)
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
268 | ...ter().map(move |pair| (almide_rt_list_zip((pair.clone()._1).to_vec(), (pair._2).to_vec())).into_iter().map(move |pair| {
    |                                                            ^^ unknown field
    |
help: a field with a similar name exists
    |
268 -     (almide_rt_list_zip((a).to_vec(), (b).to_vec())).into_iter().map(move |pair| (almide_rt_list_zip((pair.clone()._1).to_vec(), (pair._2).to_vec())).into_iter().map(move |pair| {
268 +     (almide_rt_list_zip((a).to_vec(), (b).to_vec())).into_iter().map(move |pair| (almide_rt_list_zip((pair.clone().1).to_vec(), (pair._2).to_vec())).into_iter().map(move |pair| {
    |


error[E0609]: no field `_2` on type `(Vec<i64>, Vec<i64>)`
   --> <generated.rs>:268:136
    |
268 | ...| (almide_rt_list_zip((pair.clone()._1).to_vec(), (pair._2).to_vec())).into_iter().map(move |pair| {
    |                                                            ^^ unknown field
    |
    = note: available fields are: `0`, `1`


error[E0609]: no field `_1` on type `(_, _)`
   --> <generated.rs>:270:15
    |
270 |         (pair._1 + pair._2)
    |               ^^ unknown field
    |
help: a field with a similar name exists
    |
270 -         (pair._1 + pair._2)
270 +         (pair.1 + pair._2)
    |


error[E0609]: no field `_2` on type `(_, _)`
   --> <generated.rs>:270:25
    |
270 |         (pair._1 + pair._2)
    |                         ^^ unknown field
    |
    = note: available fields are: `0`, `1`


error[E0609]: no field `_1` on type `(i64, i64)`
   --> <generated.rs>:299:22
    |
299 |         (acc + (pair._1 * pair._2))
    |                      ^^ unknown field
    |
help: a field with a similar name exists
    |
299 -         (acc + (pair._1 * pair._2))
299 +         (acc + (pair.1 * pair._2))
    |


error[E0609]: no field `_2` on type `(i64, i64)`
   --> <generated.rs>:299:32
    |
299 |         (acc + (pair._1 * pair._2))
    |                                ^^ unknown field
    |
    = note: available fields are: `0`, `1`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 6 previous errors; 2 warnings emitted

FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```
