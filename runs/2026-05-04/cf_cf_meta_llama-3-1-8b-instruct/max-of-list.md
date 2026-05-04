# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, Int.min_value, (acc, x) => max(acc, x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E002]: undefined function 'max'
  --> /tmp/dojo-max-of-list-0.almd:3:58
  in call to max()
  hint: Did you mean `x`?
  try:
      // max(...)  →  x(...)
      x(...)
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => max(acc, x))
  |                                                          ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, Int.min_value, (acc, x) => int.max(acc, x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-1.almd:3:62
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => int.max(acc, x))
  |                                                              ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, none, (acc, x) => match acc {
    none => some(x),
    some(max) => some(int.max(max, x))
  })
```
