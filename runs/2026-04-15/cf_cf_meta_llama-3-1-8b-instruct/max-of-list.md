# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, xs.first(), (max, x) => if x > max then x else max)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Int], Int) -> Option[Int] but got fn(Option[Int], Option[Int]) -> Option[Int]
  --> /tmp/dojo-max-of-list-0.almd:3:69
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, xs.first(), (max, x) => if x > max then x else max)
  |                                                                     ^^^

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
  else list.fold(xs, some(xs.first()), (max, x) => if x > max.some().unwrap() then some(x) else max)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: Expected name at line 3:63 (got Some 'some')
  --> /tmp/dojo-max-of-list-1.almd:3:63
  |
3 |   else list.fold(xs, some(xs.first()), (max, x) => if x > max.some().unwrap() then some(x) else max)
  |                                                               ^

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
  else list.fold(xs, some(xs.first()), (max, x) => if x > max.unwrap() then some(x) else max)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Option[Int]], Int) -> Option[Option[Int]] but got fn(Option[Int], Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:3:90
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, some(xs.first()), (max, x) => if x > max.unwrap() then some(x) else max)
  |                                                                                          ^^^
error[E001]: type mismatch in fn 'max_of_list': expected Option[Int] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-2.almd:3:90
  in fn 'max_of_list'
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, some(xs.first()), (max, x) => if x > max.unwrap() then some(x) else max)
  |                                                                                          ^^^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, none, (max, x) => if max.is_none() then some(x) else if x > max.unwrap() then some(x) else max)
```
