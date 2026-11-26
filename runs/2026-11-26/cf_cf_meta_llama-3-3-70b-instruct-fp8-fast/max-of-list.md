# max-of-list

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] =
  if list.is_empty(xs) then
    none
  else
    some(list.reduce(xs, (x) => (y) => if x > y then x else y) ?? 0)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Int) -> fn(Int) -> Int
  --> /tmp/dojo-max-of-list-0.almd:5:26
  in call to list.reduce()
  here: some(list.reduce(xs, (x) => (y) => if x > y then x else y) ?? 0)
  hint: Fix the argument type
  |
5 |     some(list.reduce(xs, (x) => (y) => if x > y then x else y) ?? 0)
  |                          ^

1 error(s) found
FAILED: /tmp/dojo-max-of-list-0.almd
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] =
  if list.is_empty(xs) then
    none
  else
    some(list.reduce(xs, (x, y) => if x > y then x else y) ?? 0)
```
