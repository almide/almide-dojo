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
    in if sum == 0 then 0 else sum_digits(sum / 10) + sum % 10
```
