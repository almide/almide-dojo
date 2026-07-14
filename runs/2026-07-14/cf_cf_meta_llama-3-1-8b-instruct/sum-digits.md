# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n.abs() 
  let digit = sum % 10 
  let rest = sum / 10 
  if rest == 0 then digit 
  else digit + sum_digits(rest)
```
