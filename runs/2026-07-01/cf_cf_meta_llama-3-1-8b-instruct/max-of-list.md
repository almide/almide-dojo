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
    list.fold(xs, 
      int.min_value(), 
      (acc, x) => 
        if x > acc then 
          some(x) 
        else 
          acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-0.almd:6:20
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       int.min_value(),
  |                    ^

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
    list.fold(xs, 
      int.min_value(), 
      (acc, x) => 
        if x > acc then 
          some(x) 
        else 
          acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-1.almd:6:20
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       int.min_value(),
  |                    ^

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
    list.fold(xs, 
      int.min_value(), 
      (acc, x) => 
        if x > acc then 
          some(x) 
        else 
          acc)

fn int.min_value() -> Int = 
  -int.MAX_VALUE
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error: Expected LParen at line 13:7 (got Dot '.')
  --> /tmp/dojo-max-of-list-2.almd:13:7
   |
13 | fn int.min_value() -> Int =
   |       ^
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-2.almd:6:20
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       int.min_value(),
  |                    ^

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
    list.fold(xs, 
      int.min_value(), 
      (acc, x) => 
        if x > acc then 
          some(x) 
        else 
          acc)

fn int.min_value() -> Int = 
  int.min_value()

fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then 
    none
  else 
    list.fold(xs, 
      -int.MAX_VALUE, 
      (acc, x) => 
        if x > acc then 
          some(x) 
        else 
          acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error: Expected LParen at line 13:7 (got Dot '.')
  --> /tmp/dojo-max-of-list-3.almd:13:7
   |
13 | fn int.min_value() -> Int =
   |       ^
error[E012]: duplicate function 'max_of_list'
  at line 16
  in fn max_of_list
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn max_of_list(xs: List[Int]) -> Option[Int] =
   | -------------------------------------- first definition of 'max_of_list' here
...
16 | fn max_of_list(xs: List[Int]) -> Option[Int] =
   | ^^^^^^^^^^^^^^
error[E002]: undefined function 'int.min_value'
  --> /tmp/dojo-max-of-list-3.almd:6:20
  in call to int.min_value()
  hint: No function 'min_value' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       int.min_value(),
  |                    ^
error[E003]: undefined variable 'int'
  --> /tmp/dojo-max-of-list-3.almd:21:8
  in variable int
  hint: Check the variable name
   |
21 |       -int.MAX_VALUE,
   |        ^^^

4 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
