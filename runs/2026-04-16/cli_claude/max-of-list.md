# max-of-list

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = if list.is_empty(xs) then none else list.reduce(xs, (a, b) => int.max(a, b))
```
