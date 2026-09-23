# fibonacci

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn fib_pair(a: Int, b: Int, steps: Int) -> Int =
  if steps == 0 then a else fib_pair(b, a + b, steps - 1)

fn fibonacci(n: Int) -> Int = fib_pair(0, 1, n)
```
