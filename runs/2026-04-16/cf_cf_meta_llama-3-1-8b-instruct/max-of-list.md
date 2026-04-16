# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none 
  else 
    list.fold(xs, Int.min_value, (acc, x) => int.max(acc, x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-0.almd:5:59
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
5 |     list.fold(xs, Int.min_value, (acc, x) => int.max(acc, x))
  |                                                           ^

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
    list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc, x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E005]: argument 'f' expects fn(Option[Unknown], Int) -> Option[Unknown] but got fn(Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-1.almd:5:70
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc, x)))
  |                                                                      ^
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-1.almd:5:70
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc, x)))
  |                                                                      ^

2 error(s) found
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
    list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc.unwrap(), x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E005]: argument 'f' expects fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn() -> Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:5:79
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc.unwrap(), x)))
  |                                                                               ^
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn() -> Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:5:79
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc.unwrap(), x)))
  |                                                                               ^

2 error(s) found
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
    list.fold(xs, some(Int.min_value), (acc, x) => int.max(acc.unwrap(), x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E005]: argument 'f' expects fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn() -> Int, Int) -> Int
  --> /tmp/dojo-max-of-list-3.almd:5:74
  in call to list.fold()
  hint: Fix the argument type
  |
5 |     list.fold(xs, some(Int.min_value), (acc, x) => int.max(acc.unwrap(), x))
  |                                                                          ^
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn() -> Int, Int) -> Int
  --> /tmp/dojo-max-of-list-3.almd:5:74
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
5 |     list.fold(xs, some(Int.min_value), (acc, x) => int.max(acc.unwrap(), x))
  |                                                                          ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
