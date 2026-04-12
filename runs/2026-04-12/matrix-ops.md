# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd:7:52
  in call to list.len()
  hint: Fix the argument type
  |
7 |   else if list.len(m) > 0 and list.len(list.get(m, 0)) == 0 then
  |                                                    ^
error[E005]: argument 'xs' expects List[A] but got Option[List[Int]]
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd:10:40
  in call to list.len()
  hint: Fix the argument type
   |
10 |     list.range(0, list.len(list.get(m, 0))) |> list.map((x) => list.map(m, (y) => list.get(y, x) |> option.unwrap_or(0)))
   |                                        ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd:7:52
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
7 |   else if list.len(m) > 0 and list.len(list.get(m, 0)) == 0 then
  |                                                    ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got Option[List[Int]]
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd:10:40
  in call to list.len()
  hint: Fix the expression type or change the expected type
   |
10 |     list.range(0, list.len(list.get(m, 0))) |> list.map((x) => list.map(m, (y) => list.get(y, x) |> option.unwrap_or(0)))
   |                                        ^

4 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(list.zip(a, b), (x) => list.map(list.zip(x.0, x.1), (y) => y.0 + y.1))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.len(m) == 0 then 
    [] 
  else if list.len(m) > 0 and list.len(list.get(m, 0)) == 0 then 
    [] 
  else 
    list.range(0, list.len(list.get(m, 0))) |> list.map((x) => list.map(m, (y) => list.get(y, x) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (x) => list.map(x, (y) => y * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list.fold(list.zip(row_a, col_b), 0, (acc, x) => acc + x.0 * x.1)
```
