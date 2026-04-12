# flatten-nested

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn flatten(xss: List[List[Int]]) -> List[Int] = xss.fold([], (acc, xs) => acc + xs)
```
