# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(a, (x) => 
        list.map(x, (y, i) => 
            y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
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
    list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc +
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected expression at line 20:1 (got Test 'test')
  --> /tmp/dojo-matrix-ops-0.almd:20:1
   |
20 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:112
  in call to list.get()
  hint: Fix the argument type
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                ^
error[E005]: argument 'i' expects Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:112
  in call to list.get()
  hint: Fix the argument type
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:118
  in call to list.get()
  hint: Fix the argument type
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                      ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-0.almd:4:118
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                      ^
error[E005]: argument 'o' expects Option[A] but got List[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:166
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                                                                      ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[List[Int]], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:166
  in call to list.map()
  hint: Fix the argument type
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                                                                      ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:10:53
  in call to list.len()
  hint: Fix the argument type
   |
10 |     else list.map(list.range(0, list.len(list.first(m))), (i) =>
   |                                                     ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:112
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                ^
error[E001]: type mismatch in call to list.get(): expected Int but got Option[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:112
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:118
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                      ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got List[Int]
  --> /tmp/dojo-matrix-ops-0.almd:4:166
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                                                                      ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[List[Int]], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:4:166
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |             y + list.get(list.get(b, list.get(list.range(0, list.len(a)), list.get(list.range(0, list.len(a)), 0))), i) |> option.unwrap_or([0]) |> option.unwrap_or(0)
  |                                                                                                                                                                      ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:10:53
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
10 |     else list.map(list.range(0, list.len(list.first(m))), (i) =>
   |                                                     ^

14 error(s) found
Compile error for /tmp/dojo-matrix-ops-0.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(list.zip(a, b), (x) => 
        list.map(list.zip(x.0, x.1), (y) => y.0 + y.1)
    )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    if list.is_empty(m) then [] 
    else if list.is_empty(list.first(m)) then [] 
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
Compiling /tmp/dojo-matrix-ops-1.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:8:38
  in call to list.is_empty()
  hint: Fix the argument type
  |
8 |     else if list.is_empty(list.first(m)) then []
  |                                      ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:9:53
  in call to list.len()
  hint: Fix the argument type
  |
9 |     else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                     ^
error[E001]: type mismatch in call to list.is_empty(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:8:38
  in call to list.is_empty()
  hint: Fix the expression type or change the expected type
  |
8 |     else if list.is_empty(list.first(m)) then []
  |                                      ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-1.almd:9:53
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
9 |     else list.map(list.range(0, list.len(list.first(m))), (i) =>
  |                                                     ^

4 error(s) found
Compile error for /tmp/dojo-matrix-ops-1.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(list.zip(a, b), (x) => 
        list.map(list.zip(x.0, x.1), (y) => y.0 + y.1)
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
    list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```
