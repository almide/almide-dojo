# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => 
    list.map(x, (y, i) => 
      y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:97
  in call to list.get()
  hint: Fix the argument type
  |
4 |       y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                                 ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-0.almd:4:97
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |       y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                                 ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:120
  in call to list.map()
  hint: Fix the argument type
  |
4 |       y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                                                        ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:10:51
  in call to list.len()
  hint: Fix the argument type
   |
10 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
   |                                                   ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:97
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |       y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                                 ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:120
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |       y + list.get(list.get(b, list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), i) |> option.unwrap_or(0)
  |                                                                                                                        ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:10:51
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
10 |   else list.map(list.range(0, list.len(list.first(m))), (i) =>
   |                                                   ^

7 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => 
    list.map(list.zip(x.0, x.1), (y) => y.0 + y.1)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```
