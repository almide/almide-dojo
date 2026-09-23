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
  list.zip_with(a, b, (row_a, row_b) =>
    list.zip_with(row_a, row_b, (x, y) => x + y))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  let nrows = list.len(m)
  let ncols = list.len(list.first(m) |> option.unwrap_or([]))
  list.map(list.range(0, ncols), (j) =>
    list.map(list.range(0, nrows), (i) =>
      list.get(list.get_or(m, i, []), j) |> option.unwrap_or(0)))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.zip_with(row_a, col_b, (x, y) => x * y) |> list.sum
```
