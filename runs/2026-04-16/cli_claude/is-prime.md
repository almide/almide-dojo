# is-prime

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn has_divisor(n: Int, i: Int) -> Bool =
  if i * i > n then false
  else if n % i == 0 then true
  else has_divisor(n, i + 1)

fn is_prime(n: Int) -> Bool =
  if n < 2 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else if has_divisor(n, 3) then false
  else true
```
