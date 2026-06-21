# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let len = list.len(xs)
    let low = 0
    let high = len - 1
    let (found, index) = binary_search_recursive(xs, target, low, high)
    if found then some(index) else none
  }
}

fn binary_search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> (Bool, Int) = {
  if low > high then (false, -1)
  else {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid)
    if mid_val == none then (false, -1)
    else {
      let mid_val = option.unwrap_or(mid_val, -1)
      if mid_val == target then (true, mid)
      else {
        if target < mid_val then binary_search_recursive(xs, target, low, mid - 1)
        else binary_search_recursive(xs, target, mid + 1, high)
      }
    }
  }
}
```
