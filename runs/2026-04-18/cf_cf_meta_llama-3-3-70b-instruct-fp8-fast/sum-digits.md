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
    in list.fold(string.chars(int.to_string(abs_n)), 0, (acc, ch) => acc + int.parse(ch).unwrap_or(0))
```
