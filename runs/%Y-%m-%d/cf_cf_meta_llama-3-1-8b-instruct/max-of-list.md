# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
  then none 
  else 
    let max = list.fold(xs, int.min_value(), (max, x) => max.max(x))
    some(max)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-max-of-list-0.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let max = list.fold(xs, int.min_value(), (max, x) => max.max(x))
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-0.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
  then none 
  else 
    let max = list.fold(xs, int.min_value(), (max, x) => max.max(x))
    some(max)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-max-of-list-1.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let max = list.fold(xs, int.min_value(), (max, x) => max.max(x))
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-1.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
  then none 
  else 
    list.fold(xs, int.min_value(), (max, x) => max.max(x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:59 (got RParen ')')
  --> /tmp/dojo-max-of-list-2.almd:5:59
  |
5 |     list.fold(xs, int.min_value(), (max, x) => max.max(x)))
  |                                                           ^
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-2.almd:5:32
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |     list.fold(xs, int.min_value(), (max, x) => max.max(x)))
  |                                ^
error[E001]: type mismatch in if branches: expected Option[Int] but got fn(Int) -> ?3
  --> /tmp/dojo-max-of-list-2.almd:5:48
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
5 |     list.fold(xs, int.min_value(), (max, x) => max.max(x)))
  |                                                ^^^

3 error(s) found
Compile error for /tmp/dojo-max-of-list-2.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) 
  then none 
  else 
    list.fold(xs, int.min_value(), (max, x) => int.max(max, x)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:64 (got RParen ')')
  --> /tmp/dojo-max-of-list-3.almd:5:64
  |
5 |     list.fold(xs, int.min_value(), (max, x) => int.max(max, x)))
  |                                                                ^
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-3.almd:5:32
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |     list.fold(xs, int.min_value(), (max, x) => int.max(max, x)))
  |                                ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int
  --> /tmp/dojo-max-of-list-3.almd:5:61
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
5 |     list.fold(xs, int.min_value(), (max, x) => int.max(max, x)))
  |                                                             ^

3 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
