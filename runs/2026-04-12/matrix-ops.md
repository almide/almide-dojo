# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-matrix-ops-3.almd
error: operator '+' requires numeric, String, or List types but got ?2 and Option[Int]
  --> /tmp/dojo-matrix-ops-3.almd:4:66
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |             x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                  ^
error[E005]: argument 'f' expects fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:4:89
  in call to list.map()
  hint: Fix the argument type
  |
4 |             x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                         ^
error[E005]: argument 'f' expects fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-3.almd:4:89
  in call to list.map()
  hint: Fix the argument type
  |
4 |             x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                         ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got fn(Option[Int], Int) -> Int
  --> /tmp/dojo-matrix-ops-3.almd:4:89
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |             x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                         ^
error[E001]: type mismatch in call to list.map(): expected fn(List[Int]) -> B but got fn(List[A], Int) -> List[?6]
  --> /tmp/dojo-matrix-ops-3.almd:4:89
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
4 |             x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
  |                                                                                         ^

5 error(s) found
Compile error for /tmp/dojo-matrix-ops-3.almd:
compile failed
FAILED: /tmp/dojo-matrix-ops-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
    list.map(a, (row, i) => 
        list.map(row, (x, j) => 
            x + list.get(list.get(b, i) |> option.unwrap_or([]), j) |> option.unwrap_or(0)
        )
    )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
    if m == [] then [] else 
    list.range(0, list.len(list.get(m, 0) |> option.unwrap_or([]))).map((i) => 
        list.map(m, (x) => list.get(x, i) |> option.unwrap_or(0))
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
    list.map(m, (row) => 
        list.map(row, (x) => x * s)
    )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
    list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```
