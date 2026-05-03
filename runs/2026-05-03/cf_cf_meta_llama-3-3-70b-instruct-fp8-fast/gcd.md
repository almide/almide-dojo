# gcd

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn gcd(a: Int, b: Int) -> Int = 
    if b == 0 then a
    else gcd(b, a % b)
```
