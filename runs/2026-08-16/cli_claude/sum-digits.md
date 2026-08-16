# sum-digits

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn sum_digits(n: Int) -> Int =
  let m = int.abs(n)
  if m < 10 then m else m % 10 + sum_digits(m / 10)
```
