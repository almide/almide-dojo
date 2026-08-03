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
  if list.is_empty(xs) then none 
  else list.fold(xs, Int.min_value, (max, x) => int.max(max, x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-0.almd:3:62
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, Int.min_value, (max, x) => int.max(max, x))
  |                                                              ^

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
  else list.fold(xs, some(Int.min_value), (max, x) => some(int.max(max, x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E005]: argument 'f' expects fn(Option[Unknown], Int) -> Option[Unknown] but got fn(Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-1.almd:3:73
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   else list.fold(xs, some(Int.min_value), (max, x) => some(int.max(max, x)))
  |                                                                         ^
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-1.almd:3:73
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, some(Int.min_value), (max, x) => some(int.max(max, x)))
  |                                                                         ^

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
  else list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc, x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E005]: argument 'f' expects fn(Option[Unknown], Int) -> Option[Unknown] but got fn(Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:3:73
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   else list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc, x)))
  |                                                                         ^
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:3:73
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc, x)))
  |                                                                         ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc.unwrap_or(Int.min_value), x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E005]: argument 'f' expects fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn(Unknown) -> Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-3.almd:3:98
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   else list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc.unwrap_or(Int.min_value), x)))
  |                                                                                                  ^
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn(Unknown) -> Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-3.almd:3:98
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, some(Int.min_value), (acc, x) => some(int.max(acc.unwrap_or(Int.min_value), x)))
  |                                                                                                  ^

2 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
