# matrix-ops

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn mat_add(a: List[List[Int]], b: List[List[Int]]) -> List[List[Int]] =
  list.zip_with(a, b, (row_a, row_b) => list.zip_with(row_a, row_b, (x, y) => x + y))

fn mat_scale(m: List[List[Int]], s: Int) -> List[List[Int]] =
  list.map(m, (row) => list.map(row, (x) => x * s))

fn mat_dot_row(row_a: List[Int], col_b: List[Int]) -> Int =
  list.sum(list.zip_with(row_a, col_b, (x, y) => x * y))

fn mat_transpose(m: List[List[Int]]) -> List[List[Int]] =
  match list.first(m) {
    none => [],
    some(first_row) => {
      let ncols = list.len(first_row)
      if ncols == 0 then [] else list.map(
        list.range(0, ncols),
        (i) => list.map(m, (row) => list.get(row, i) |> option.unwrap_or(0))
      )
    }
  }
```
