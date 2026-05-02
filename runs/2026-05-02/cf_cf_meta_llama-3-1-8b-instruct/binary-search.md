# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.len(xs) == 0 then {
    none
  } else {
    let low = 0
    let high = list.len(xs) - 1
    let result = binary_search_loop(xs, low, high, target)
    result
  }
}

fn binary_search_loop(xs: List[Int], low: Int, high: Int, target: Int) -> Option[Int] = {
  if low > high then {
    none
  } else {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid)
    match mid_val {
      some(mid_val) => {
        if mid_val == target then {
          some(mid)
        } else if mid_val < target then {
          binary_search_loop(xs, mid + 1, high, target)
        } else {
          binary_search_loop(xs, low, mid - 1, target)
        }
      }
      none => {
        none
      }
    }
  }
}
```
