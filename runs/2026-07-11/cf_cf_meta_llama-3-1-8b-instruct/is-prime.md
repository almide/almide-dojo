# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then 
    false 
  else if n == 2 then 
    true 
  else if n % 2 == 0 then 
    false 
  else 
    (2 .. n - 1).all((x) => n % x != 0)
```
