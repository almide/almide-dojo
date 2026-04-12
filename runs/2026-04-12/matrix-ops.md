# matrix-ops

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.range(0, list.len(row_a))
  |> list.map((i) =>
    (list.get(row_a, i) |> option.unwrap_or(0)) *
    (list.get(col_b, i) |> option.unwrap_or(0))
  )
  |> list.fold(0, (acc, x) => acc + x)

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  m |> list.map((row) => row |> list.map((x) => x * s))

fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.range(0, list.len(a)) |> list.map((i) => {
    let row_a = list.get(a, i) |> option.unwrap_or([]);
    let row_b = list.get(b, i) |> option.unwrap_or([]);
    list.range(0, list.len(row_a)) |> list.map((j) =>
      (list.get(row_a, j) |> option.unwrap_or(0)) +
      (list.get(row_b, j) |> option.unwrap_or(0))
    )
  })

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  if list.len(m) == 0 then []
  else {
    let ncols = list.len(list.get(m, 0) |> option.unwrap_or([]));
    if ncols == 0 then []
    else
      list.range(0, ncols) |> list.map((i) =>
        m |> list.map((row) => list.get(row, i) |> option.unwrap_or(0))
      )
  }
```
