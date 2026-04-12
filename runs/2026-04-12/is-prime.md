# is-prime

- **model**: `claude-sonnet-4-6`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn check(i: Int, n: Int) -> Bool =
  if i * i > n then true
  else if n % i == 0 then false
  else check(i + 1, n)

fn is_prime(n: Int) -> Bool =
  if n < 2 then false
  else check(2, n)
```
