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
  else list.fold(xs, Int.min_value, (max, x) => some(max.max(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E005]: argument 'f' expects fn(fn(?2) -> ?3, Int) -> fn(?2) -> ?3 but got fn(fn(?2) -> ?3, ?2) -> Option[?3]
  --> /tmp/dojo-max-of-list-0.almd:3:54
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   else list.fold(xs, Int.min_value, (max, x) => some(max.max(x)))
  |                                                      ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(fn(Int) -> ?3, Int) -> fn(Int) -> ?3 but got fn(fn(Int) -> ?3, Int) -> Option[?3]
  --> /tmp/dojo-max-of-list-0.almd:3:54
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, Int.min_value, (max, x) => some(max.max(x)))
  |                                                      ^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got fn(Int) -> ?3
  --> /tmp/dojo-max-of-list-0.almd:3:54
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, Int.min_value, (max, x) => some(max.max(x)))
  |                                                      ^^^

3 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, some(Int.min_value), (max, x) => max.map((x) => max.max(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E005]: argument 'f' expects fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn(fn(?3) -> ?4) -> ?4, ?2) -> ?4
  --> /tmp/dojo-max-of-list-1.almd:3:55
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   else list.fold(xs, some(Int.min_value), (max, x) => max.map((x) => max.max(x)))
  |                                                       ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn(fn(?3) -> ?4) -> ?4, ?2) -> ?4
  --> /tmp/dojo-max-of-list-1.almd:3:55
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, some(Int.min_value), (max, x) => max.map((x) => max.max(x)))
  |                                                       ^^^

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
  else list.fold(xs, some(Int.min_value), (max, x) => max.map(x => max.max(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-max-of-list-2.almd:3:65
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   else list.fold(xs, some(Int.min_value), (max, x) => max.map(x => max.max(x)))
  |                                                                 ^^

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
  else list.fold(xs, some(Int.min_value), (max, x) => (max).map(x => max.max(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-max-of-list-3.almd:3:67
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   else list.fold(xs, some(Int.min_value), (max, x) => (max).map(x => max.max(x)))
  |                                                                   ^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
