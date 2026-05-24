# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn sum_digits(n: Int) -> Int =
  let abs_n = int.abs(n)
  in
  if abs_n < 10 then
    abs_n
  else
    (abs_n % 10) + sum_digits(abs_n / 10)
```
