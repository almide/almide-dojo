# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.len(xs) == 0 then none
  else {
    let low = 0
    let high = list.len(xs) - 1
    let result = binary_search_recursive(xs, target, low, high)
    result
  }
}

fn binary_search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = {
  if low > high then none
  else {
    let mid = (low + high) / 2
    let x = list.get(xs, mid)
    match x {
      some(x) => {
        if x == target then some(mid)
        else if x < target then binary_search_recursive(xs, target, mid + 1, high)
        else binary_search_recursive(xs, target, low, mid - 1)
      }
      none => binary_search_recursive(xs, target, low, mid - 1)
    }
  }
}
```
