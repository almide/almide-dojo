# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (x) => list.map(x, (y, i) => 
    y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), 0) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  ))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b),
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 18:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-0.almd:18:1
   |
18 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E004]: list.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-matrix-ops-0.almd:3:132
  in call to list.get()
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 3
      list.get(<xs: List[A]>, <i: Int>)
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), 0) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                                                                    ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:3:132
  in call to list.get()
  hint: Fix the argument type
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), 0) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                                                                    ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:3:160
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), 0) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                                                                                                ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:3:183
  in call to list.map()
  hint: Fix the argument type
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), 0) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                                                                                                                       ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:3:132
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), 0) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                                                                    ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:3:183
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
3 |     y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0) |> option.unwrap_or(0)), 0) |> option.unwrap_or([]), i) |> option.unwrap_or(0)
  |                                                                                                                                                                                       ^

7 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (pair) => 
    list.map(list.zip(pair.0, pair.1), (x) => x.0 + x.1)
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.is_empty(list.first(m) |> option.unwrap_or([])) then [] 
  else list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
    list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
  )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, pair) => acc + pair.0 * pair.1)
```
