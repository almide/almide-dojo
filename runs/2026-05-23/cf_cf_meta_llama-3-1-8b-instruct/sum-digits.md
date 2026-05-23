# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 0 in 
  let x = int.abs(n) in 
  if x < 10 then 
    x 
  else 
    sum_digits(x / 10) + x % 10
```
