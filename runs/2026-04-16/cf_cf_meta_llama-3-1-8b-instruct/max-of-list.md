# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none 
  else 
    list.fold(xs, Int.min_value, (max, x) => max.max(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got fn(Int) -> ?3
  --> /tmp/dojo-max-of-list-0.almd:5:46
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
5 |     list.fold(xs, Int.min_value, (max, x) => max.max(x))
  |                                              ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none 
  else 
    list.fold(xs, Int.min_value, (max, x) => max.max(x)).some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: Expected name at line 5:58 (got Some 'some')
  --> /tmp/dojo-max-of-list-1.almd:5:58
  |
5 |     list.fold(xs, Int.min_value, (max, x) => max.max(x)).some
  |                                                          ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none 
  else 
    list.fold(xs, Int.min_value, (max, x) => max.max(x)).some()
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Expected name at line 5:58 (got Some 'some')
  --> /tmp/dojo-max-of-list-2.almd:5:58
  |
5 |     list.fold(xs, Int.min_value, (max, x) => max.max(x)).some()
  |                                                          ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none 
  else 
    list.fold(xs, Int.min_value, (max, x) => max.max(x)).some()
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected name at line 5:58 (got Some 'some')
  --> /tmp/dojo-max-of-list-3.almd:5:58
  |
5 |     list.fold(xs, Int.min_value, (max, x) => max.max(x)).some()
  |                                                          ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
