# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn fizzbuzz(n: Int) -> String =
  if int.to_float(n) % 15.0 == 0.0 then "FizzBuzz"
  else if int.to_float(n) % 3.0 == 0.0 then "Fizz"
  else if int.to_float(n) % 5.0 == 0.0 then "Buzz"
  else int.to_string(n)
```
