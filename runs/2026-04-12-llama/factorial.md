# factorial

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 0

## Final code

```almide
fn factorial(n: Int) -> Int = 
  match n {
    0 => 1,
    _ => n * factorial(n - 1)
  }
```
