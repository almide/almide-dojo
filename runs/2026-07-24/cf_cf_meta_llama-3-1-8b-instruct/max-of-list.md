# max-of-list

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn max_of_list(xs: List[Int]) -> Option[Int] = 
  if list.is_empty(xs) then none 
  else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |> some
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-0.almd
error: Expected LParen at line 3:84 (got Newline '')
  --> /tmp/dojo-max-of-list-0.almd:3:84
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc) |> some
  |                                                                                    ^

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
  else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-1.almd
error[E003]: undefined variable 'int'
  --> /tmp/dojo-max-of-list-1.almd:3:22
  in variable int
  hint: Check the variable name
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                      ^^^

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
  else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-2.almd
error[E003]: undefined variable 'int'
  --> /tmp/dojo-max-of-list-2.almd:3:22
  in variable int
  hint: Check the variable name
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                      ^^^

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
  else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-max-of-list-3.almd
error[E003]: undefined variable 'int'
  --> /tmp/dojo-max-of-list-3.almd:3:22
  in variable int
  hint: Check the variable name
  |
3 |   else list.fold(xs, int.min_value, (acc, x) => if x > acc then x else acc)
  |                      ^^^

1 error(s) found
Compile error for /tmp/dojo-max-of-list-3.almd:
compile failed
FAILED: /tmp/dojo-max-of-list-3.almd

1/1 test file(s) failed

```
