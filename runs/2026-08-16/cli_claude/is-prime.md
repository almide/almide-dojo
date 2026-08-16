# is-prime

- **model**: `cli:claude`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_prime(n: Int) -> Bool =
  if n <= 1 then false
  else if n <= 3 then true
  else if n % 2 == 0 then false
  else has_no_divisor(n, 3, float.to_int(float.sqrt(int.to_float(n))))

fn has_no_divisor(n: Int, d: Int, limit: Int) -> Bool =
  if d > limit then true
  else if n % d == 0 then false
  else has_no_divisor(n, d + 2, limit)
```
