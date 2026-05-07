# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, option.none, (acc, x) => 
    if acc.is_none then some(x) 
    else if x > acc.unwrap_or(Int.min_value) then some(x) 
    else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Expected name at line 3:29 (got None 'none')
  --> /tmp/dojo-max-of-list-0.almd:3:29
  |
3 |   else list.fold(xs, option.none, (acc, x) =>
  |                             ^

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
  else list.fold(xs, option.some(Int.min_value), (acc, x) => 
    if x > acc.unwrap_or(Int.min_value) then some(x) 
    else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: Expected name at line 3:29 (got Some 'some')
  --> /tmp/dojo-max-of-list-1.almd:3:29
  |
3 |   else list.fold(xs, option.some(Int.min_value), (acc, x) =>
  |                             ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, option.some(Int.min_value), (acc, x) => 
    if x > acc.unwrap_or(Int.min_value) then option.some(x) 
    else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Expected name at line 3:29 (got Some 'some')
  --> /tmp/dojo-max-of-list-2.almd:3:29
  |
3 |   else list.fold(xs, option.some(Int.min_value), (acc, x) =>
  |                             ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, option.some(Int.min_value), (acc, x) => 
    if x > acc.unwrap_or(Int.min_value) then acc else option.some(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected name at line 3:29 (got Some 'some')
  --> /tmp/dojo-max-of-list-3.almd:3:29
  |
3 |   else list.fold(xs, option.some(Int.min_value), (acc, x) =>
  |                             ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
