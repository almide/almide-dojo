# binary-search

- **model**: `cli:claude`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search_helper(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] =
  if lo > hi then none
  else
    let mid = (lo + hi) / 2
    let v = option.unwrap_or(list.get(xs, mid), 0)
    if v == target then some(mid)
    else if v < target then binary_search_helper(xs, target, mid + 1, hi)
    else binary_search_helper(xs, target, lo, mid - 1)

fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
  if list.is_empty(xs) then none
  else binary_search_helper(xs, target, 0, list.len(xs) - 1)
```

**Diagnostic:**

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-0.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let mid = (lo + hi) / 2
  |     ^^^

1 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-0.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn binary_search_helper(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] =
  if lo > hi then none
  else {
    let mid = (lo + hi) / 2
    let v = option.unwrap_or(list.get(xs, mid), 0)
    if v == target then some(mid)
    else if v < target then binary_search_helper(xs, target, mid + 1, hi)
    else binary_search_helper(xs, target, lo, mid - 1)
  }

fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
  if list.is_empty(xs) then none
  else binary_search_helper(xs, target, 0, list.len(xs) - 1)
```
