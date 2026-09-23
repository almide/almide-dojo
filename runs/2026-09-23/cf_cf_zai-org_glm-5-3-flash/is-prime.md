# is-prime

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_prime(n: Int) -> Bool =
  if n < 2 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else if n < 9 then true
  else list.all(list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1), (d) => n % d > 0)
```
