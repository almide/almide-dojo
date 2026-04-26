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
  else if list.len(xs) == 1 then list.first(xs) 
  else list.fold(xs, list.first(xs), (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Int], Int) -> Option[Int] but got fn(Option[Int], Option[Int]) -> Option[Int]
  --> /tmp/dojo-max-of-list-0.almd:4:73
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |   else list.fold(xs, list.first(xs), (acc, x) => if x > acc then x else acc)
  |                                                                         ^^^

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
  else list.fold(xs, none, (acc, x) => if list.is_none(acc) then some(x) else if x > list.unwrap_or(acc, 0) then some(x) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E002]: undefined function 'list.is_none'
  --> /tmp/dojo-max-of-list-1.almd:3:56
  in call to list.is_none()
  hint: No function 'is_none' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, none, (acc, x) => if list.is_none(acc) then some(x) else if x > list.unwrap_or(acc, 0) then some(x) else acc)
  |                                                        ^^^
error[E002]: undefined function 'list.unwrap_or'
  --> /tmp/dojo-max-of-list-1.almd:3:106
  in call to list.unwrap_or()
  hint: No function 'unwrap_or' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(xs, none, (acc, x) => if list.is_none(acc) then some(x) else if x > list.unwrap_or(acc, 0) then some(x) else acc)
  |                                                                                                          ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, option.none, (acc, x) => if option.is_none(acc) then some(x) else if x > option.unwrap_or(acc, 0) then some(x) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Expected name at line 3:29 (got None 'none')
  --> /tmp/dojo-max-of-list-2.almd:3:29
  |
3 |   else list.fold(xs, option.none, (acc, x) => if option.is_none(acc) then some(x) else if x > option.unwrap_or(acc, 0) then some(x) else acc)
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
  else list.fold(xs, option.some(0), (acc, x) => if x > option.unwrap_or(acc, 0) then option.some(x) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected name at line 3:29 (got Some 'some')
  --> /tmp/dojo-max-of-list-3.almd:3:29
  |
3 |   else list.fold(xs, option.some(0), (acc, x) => if x > option.unwrap_or(acc, 0) then option.some(x) else acc)
  |                             ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
