# matrix-ops

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.zip_with(a, b, (row_a, row_b) => list.zip_with(row_a, row_b, (x, y) => x + y))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  let first_row = list.first(m) |> option.unwrap_or([])
  let ncols = list.len(first_row)
  list.range(0, ncols)
    |> list.map((i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.zip_with(row_a, col_b, (x, y) => x * y) |> list.sum
```
