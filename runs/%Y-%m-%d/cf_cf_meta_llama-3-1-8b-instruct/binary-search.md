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
    let lo = 0
    let hi = list.len(xs) - 1
    let index = binary_search_helper(xs, target, lo, hi)
    option.unwrap_or(index, none)
  }
}

fn binary_search_helper(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
  if lo > hi then none
  else {
    let mid = (lo + hi) / 2
    let mid_value = list.get(xs, mid)
    match mid_value {
      some(x) => {
        if x == target then some(mid)
        else if x > target then binary_search_helper(xs, target, lo, mid - 1)
        else binary_search_helper(xs, target, mid + 1, hi)
      }
      none => binary_search_helper(xs, target, lo, mid - 1)
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error[E001]: type mismatch in call to option.unwrap_or(): expected Int but got Option[?1]
  --> /tmp/dojo-binary-search-0.almd:7:29
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |     option.unwrap_or(index, none)
  |                             ^^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-binary-search-0.almd:7:29
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
7 |     option.unwrap_or(index, none)
  |                             ^^^^

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
    let lo = 0
    let hi = list.len(xs) - 1
    let index = binary_search_helper(xs, target, lo, hi)
    match index {
      some(x) => some(x)
      none => none
    }
  }
}

fn binary_search_helper(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
  if lo > hi then none
  else {
    let mid = (lo + hi) / 2
    let mid_value = list.get(xs, mid)
    match mid_value {
      some(x) => {
        if x == target then some(mid)
        else if x > target then binary_search_helper(xs, target, lo, mid - 1)
        else binary_search_helper(xs, target, mid + 1, hi)
      }
      none => binary_search_helper(xs, target, lo, mid - 1)
    }
  }
}
```
