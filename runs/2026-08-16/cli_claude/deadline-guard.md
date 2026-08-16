# deadline-guard

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn square_plus_one(n: Int) -> Int = n * n + 1

effect fn within_deadline(n: Int) -> Int =
  fan.timeout(duration.s(2)) { square_plus_one(n) } ?? 0
```
