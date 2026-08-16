# matrix-ops

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.zip(a, b)
  |> list.map((pair) => list.zip_with(pair.0, pair.1, (x, y) => x + y))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  let ncols = list.first(m) |> option.map((r) => list.len(r)) |> option.unwrap_or(0)
  list.range(0, ncols)
  |> list.map((j) => list.map(m, (row) => list.get(row, j) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.zip_with(row_a, col_b, (x, y) => x * y) |> list.sum
```
