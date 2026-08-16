# binary-search

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
  bsearch_go(xs, target, 0, list.len(xs) - 1)

fn bsearch_go(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] =
  if lo > hi then
    none
  else
    let mid = lo + (hi - lo) / 2
    let mid_val = option.unwrap_or(list.get(xs, mid), 0)
    if mid_val == target then
      some(mid)
    else if mid_val < target then
      bsearch_go(xs, target, mid + 1, hi)
    else
      bsearch_go(xs, target, lo, mid - 1)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-binary-search-0.almd:8:5
  in let-in
  here: let mid = lo + (hi - lo) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let mid = lo + (hi - lo) / 2
  |     ^^^

1 error(s) found
FAILED: /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-binary-search-0.almd
Compile error for /var/folders/cy/5m78zrxs6w3bb5mfjvf9b_wh0000gn/T//dojo-binary-search-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
  bsearch_go(xs, target, 0, list.len(xs) - 1)

fn bsearch_go(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] =
  if lo > hi then
    none
  else
    {
      let mid = lo + (hi - lo) / 2
      let mid_val = option.unwrap_or(list.get(xs, mid), 0)
      if mid_val == target then
        some(mid)
      else if mid_val < target then
        bsearch_go(xs, target, mid + 1, hi)
      else
        bsearch_go(xs, target, lo, mid - 1)
    }
```
