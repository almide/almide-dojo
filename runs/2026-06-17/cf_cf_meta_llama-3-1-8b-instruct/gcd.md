# gcd

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn gcd(a: Int, b: Int) -> Int = {
  if b == 0 then a
  else {
    let (q, r) = (a / b, a % b)
    gcd(b, r)
  }
}
```
