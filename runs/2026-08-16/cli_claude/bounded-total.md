# bounded-total

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn sum_from(xs: List[Int], i: Int, acc: Int) -> Int =
  if i >= list.len(xs) then acc
  else sum_from(xs, i + 1, acc + list.get_or(xs, i, 0))

effect fn safe_total(xs: List[Int]) -> Int =
  fan.bounded(compute.ms(100)) { sum_from(xs, 0, 0) } ?? -1
```
