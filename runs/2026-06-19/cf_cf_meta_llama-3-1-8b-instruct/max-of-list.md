# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
  then none 
  else 
    match list.reduce(xs, (a, b) => if a > b then a else b) 
    { some(result) => some(result) }
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E010]: non-exhaustive match: missing none
  --> /tmp/dojo-max-of-list-0.almd:5:58
  in match
  hint: Add arms for none, or use '_'
  |
5 |     match list.reduce(xs, (a, b) => if a > b then a else b)
  |                                                          ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
  then none 
  else 
    match list.reduce(xs, (a, b) => if a > b then a else b) 
    { some(result) => some(result), none => none }
```
