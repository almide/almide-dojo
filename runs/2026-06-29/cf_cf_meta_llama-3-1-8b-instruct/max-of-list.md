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
  else list.fold(xs, 
    (acc, x) => 
      if x > acc then x else acc, 
    xs.first())
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E005]: argument 'f' expects fn(fn(?2, ?2) -> ?2, Int) -> fn(?2, ?2) -> ?2 but got Option[Int]
  --> /tmp/dojo-max-of-list-0.almd:6:5
  in call to list.fold()
  hint: Fix the argument type
  |
6 |     xs.first())
  |     ^^
error[E001]: type mismatch in call to list.fold(): expected fn(fn(?2, ?2) -> ?2, Int) -> fn(?2, ?2) -> ?2 but got Option[Int]
  --> /tmp/dojo-max-of-list-0.almd:6:5
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |     xs.first())
  |     ^^
error[E001]: type mismatch in if branches: expected Option[Int] but got fn(?2, ?2) -> ?2
  --> /tmp/dojo-max-of-list-0.almd:6:5
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
6 |     xs.first())
  |     ^^

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
  else list.fold(xs, 
    (acc, x) => 
      if x > acc then x else acc, 
    int.min_value())
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-1.almd:6:18
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |     int.min_value())
  |                  ^
error[E001]: type mismatch in if branches: expected Option[Int] but got fn(?2, ?2) -> ?2
  --> /tmp/dojo-max-of-list-1.almd:6:18
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
6 |     int.min_value())
  |                  ^

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
  else list.fold(xs, 
    (acc, x) => 
      if x > acc then x else acc, 
    list.first(xs))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E005]: argument 'f' expects fn(fn(?2, ?2) -> ?2, Int) -> fn(?2, ?2) -> ?2 but got Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:6:16
  in call to list.fold()
  hint: Fix the argument type
  |
6 |     list.first(xs))
  |                ^^
error[E001]: type mismatch in call to list.fold(): expected fn(fn(?2, ?2) -> ?2, Int) -> fn(?2, ?2) -> ?2 but got Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:6:16
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |     list.first(xs))
  |                ^^
error[E001]: type mismatch in if branches: expected Option[Int] but got fn(?2, ?2) -> ?2
  --> /tmp/dojo-max-of-list-2.almd:6:16
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
6 |     list.first(xs))
  |                ^^

3 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none
  else list.fold(xs, 
    (acc, x) => 
      if x > acc then some(x) else some(acc), 
    some(list.first(xs)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E005]: argument 'f' expects fn(fn(?2, ?2) -> Option[?2], Int) -> fn(?2, ?2) -> Option[?2] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-3.almd:6:21
  in call to list.fold()
  hint: Fix the argument type
  |
6 |     some(list.first(xs)))
  |                     ^^
error[E001]: type mismatch in call to list.fold(): expected fn(fn(?2, ?2) -> Option[?2], Int) -> fn(?2, ?2) -> Option[?2] but got Option[Option[Int]]
  --> /tmp/dojo-max-of-list-3.almd:6:21
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |     some(list.first(xs)))
  |                     ^^
error[E001]: type mismatch in if branches: expected Option[Int] but got fn(?2, ?2) -> Option[?2]
  --> /tmp/dojo-max-of-list-3.almd:6:21
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
6 |     some(list.first(xs)))
  |                     ^^

3 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
