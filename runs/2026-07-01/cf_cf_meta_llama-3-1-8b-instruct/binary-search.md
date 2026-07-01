# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let len = list.len(xs)
    let low = 0
    let high = len - 1
    let result = binary_search_helper(xs, target, low, high)
    option.unwrap_or(result, none)
  }
}

fn binary_search_helper(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = {
  if low > high then none
  else {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid)
    match mid_val {
      some(val) => {
        if val == target then some(mid)
        else {
          if val < target then binary_search_helper(xs, target, mid + 1, high)
          else binary_search_helper(xs, target, low, mid - 1)
        }
      }
      none => none
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error[E001]: type mismatch in call to option.unwrap_or(): expected Int but got Option[?1]
  --> /tmp/dojo-binary-search-0.almd:8:30
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
8 |     option.unwrap_or(result, none)
  |                              ^^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-binary-search-0.almd:8:30
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
8 |     option.unwrap_or(result, none)
  |                              ^^^^

2 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let len = list.len(xs)
    let low = 0
    let high = len - 1
    let result = binary_search_helper(xs, target, low, high)
    result
  }
}

fn binary_search_helper(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = {
  if low > high then none
  else {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid)
    match mid_val {
      some(val) => {
        if val == target then some(mid)
        else {
          if val < target then binary_search_helper(xs, target, mid + 1, high)
          else binary_search_helper(xs, target, low, mid - 1)
        }
      }
      none => none
    }
  }
}
```
