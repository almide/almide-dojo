# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  list.fold(chars, "", (acc, x) => acc + [x])
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E005]: argument 'f' expects fn(String, String) -> String but got fn(List[?1], ?1) -> List[?1]
  --> /tmp/dojo-string-reverse-0.almd:3:43
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   list.fold(chars, "", (acc, x) => acc + [x])
  |                                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(String, String) -> String but got fn(List[?1], ?1) -> List[?1]
  --> /tmp/dojo-string-reverse-0.almd:3:43
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   list.fold(chars, "", (acc, x) => acc + [x])
  |                                           ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  list.fold(chars, "", (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  list.fold(chars, "", (acc, x) => acc + string.to_char(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'string.to_char'
  --> /tmp/dojo-string-reverse-2.almd:3:57
  in call to string.to_char()
  hint: No function 'to_char' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   list.fold(chars, "", (acc, x) => acc + string.to_char(x))
  |                                                         ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  list.fold(chars, "", (acc, x) => acc + string.to_char(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'string.to_char'
  --> /tmp/dojo-string-reverse-3.almd:3:57
  in call to string.to_char()
  hint: No function 'to_char' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   list.fold(chars, "", (acc, x) => acc + string.to_char(x))
  |                                                         ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
