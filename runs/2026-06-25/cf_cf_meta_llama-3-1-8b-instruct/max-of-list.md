# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.reduce(xs, (x, y) => max(x, y))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E002]: undefined function 'max'
  --> /tmp/dojo-max-of-list-0.almd:3:41
  in call to max()
  hint: Did you mean `x`?
  try:
      // max(...)  →  x(...)
      x(...)
  |
3 |   else list.reduce(xs, (x, y) => max(x, y))
  |                                         ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.reduce(xs, (x, y) => if x > y then x else y)
```
