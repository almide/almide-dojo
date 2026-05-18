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
  else list.fold(xs, Int.min_value, (acc, x) => some(max(acc, x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E002]: undefined function 'max'
  --> /tmp/dojo-max-of-list-0.almd:3:63
  in call to max()
  hint: Did you mean `x`?
  try:
      // max(...)  →  x(...)
      x(...)
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => some(max(acc, x)))
  |                                                               ^

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
  else list.fold(xs, Int.min_value, (acc, x) => some(maximum(acc, x)))

fn maximum(a: Int, b: Int) -> Int = 
  if a > b then a else b
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-1.almd:3:67
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => some(maximum(acc, x)))
  |                                                                   ^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, Int) -> Int but got fn(Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-1.almd:3:67
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => some(maximum(acc, x)))
  |                                                                   ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-1.almd:3:67
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   else list.fold(xs, Int.min_value, (acc, x) => some(maximum(acc, x)))
  |                                                                   ^

3 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, some(Int.min_value), (acc, x) => some(maximum(acc.unwrap_or(Int.min_value), x)))

fn maximum(a: Int, b: Int) -> Int = 
  if a > b then a else b
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E005]: argument 'f' expects fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn(Unknown) -> Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:3:98
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   else list.fold(xs, some(Int.min_value), (acc, x) => some(maximum(acc.unwrap_or(Int.min_value), x)))
  |                                                                                                  ^
error[E001]: type mismatch in call to list.fold(): expected fn(Option[Unknown], Int) -> Option[Unknown] but got fn(fn(Unknown) -> Int, Int) -> Option[Int]
  --> /tmp/dojo-max-of-list-2.almd:3:98
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   else list.fold(xs, some(Int.min_value), (acc, x) => some(maximum(acc.unwrap_or(Int.min_value), x)))
  |                                                                                                  ^

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
  else list.fold(xs, some(Int.min_value), (acc, x) => match acc { some(a) => some(maximum(a, x)); none => some(x) })

fn maximum(a: Int, b: Int) -> Int = 
  if a > b then a else b
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected pattern at line 3:97 (got Semicolon ';')
  --> /tmp/dojo-max-of-list-3.almd:3:97
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |   else list.fold(xs, some(Int.min_value), (acc, x) => match acc { some(a) => some(maximum(a, x)); none => some(x) })
  |                                                                                                 ^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
