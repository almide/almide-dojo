# sum-digits

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn sum_digits_helper(n: Int) -> Int =
  if n == 0 then 0
  else (n % 10) + sum_digits_helper(n / 10)

fn sum_digits(n: Int) -> Int =
  let abs_n = int.abs(n)
  if abs_n == 0 then 0 else sum_digits_helper(abs_n)
```
