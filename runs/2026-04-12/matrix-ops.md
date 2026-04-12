# matrix-ops

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd
error[E003]: undefined variable 'list'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd:26:3
  in variable list
  hint: Check the variable name
   |
26 |   list
   |   ^^^^

1 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-matrix-ops-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] = 
  list.map(a, (row_a) => 
    list.map(list.zip(row_a, list.get(b, list.index_of(a, row_a) ?? 0) |> option.unwrap_or([])), (pair) => 
      pair.0 + pair.1
    )
  )

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] = 
  if list.is_empty(m) then [] 
  else if list.get(m, 0) |> option.is_none then [] 
  else list.range(0, list.len(list.get(m, 0) |> option.unwrap_or([]))) 
    |> list.map((i) => 
      list.map(m, (row) => 
        list.get(row, i) |> option.unwrap_or(0)
      )
    )

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] = 
  list.map(m, (row) => 
    list.map(row, (x) => 
      x * s
    )
  )

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int = 
  list
```
