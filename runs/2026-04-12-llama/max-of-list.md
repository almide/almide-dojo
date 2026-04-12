# max-of-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Final code

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = {
  if list.is_empty(xs) then none
  else list.reduce(xs, (a, b) => if a > b then a else b)
}
```
