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
            y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i) 
            |> option.unwrap_or(0)
        )
    )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    if list.is_empty(m) then 
        []
    else 
        list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
            list.map(m, (x) => 
                list.get(x, i) |> option.unwrap_or(0)
            )
        )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (x) => 
        list.map(x, (y) => y * s)
    )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc
```

**Diagnostic:**

```
Compiling /tmp/dojo-matrix-ops-0.almd
error: Expected ')' to close function call opened at line 25:14
  --> /tmp/dojo-matrix-ops-0.almd:27:1
  hint: Add ')' or check for a missing delimiter inside the function call
   |
25 |     list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc
   |              --------------- '(' opened here
...
27 | test "mat_add 2x2" { assert_eq(mat_add([[1, 2], [3, 4]], [[5, 6], [7, 8]]), [[6, 8], [10, 12]]) }
   | ^^^^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:83
  in call to list.get()
  hint: Fix the argument type
  |
4 |             y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i)
  |                                                                                   ^
error: operator '+' requires numeric, String, or List types but got ?1 and Option[?3]
  --> /tmp/dojo-matrix-ops-0.almd:4:83
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |             y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i)
  |                                                                                   ^
error[E005]: argument 'f' expects fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:5:33
  in call to list.map()
  hint: Fix the argument type
  |
5 |             |> option.unwrap_or(0)
  |                                 ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[List[Int]]
  --> /tmp/dojo-matrix-ops-0.almd:4:83
  in call to list.get()
  hint: Fix the expression type or change the expected type
  |
4 |             y + list.get(list.get(b, list.index_of(a, x) |> option.unwrap_or(0)), i)
  |                                                                                   ^
error[E001]: type mismatch in call to list.map(): expected fn(Int) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-0.almd:5:33
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |             |> option.unwrap_or(0)
  |                                 ^

6 error(s) found
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
    if list.is_empty(m) then 
        []
    else 
        list.map(list.range(0, list.len(list.first(m) |> option.unwrap_or([]))), (i) => 
            list.map(m, (x) => 
                list.get(x, i) |> option.unwrap_or(0)
            )
        )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (x) => 
        list.map(x, (y) => y * s)
    )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```
