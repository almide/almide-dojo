# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  list.fold(chars, "", (acc, x) => string.concat(x, acc))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-string-reverse-0.almd:3:53
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   list.fold(chars, "", (acc, x) => string.concat(x, acc))
  |                                                     ^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  list.fold(chars, "", (acc, x) => string.concat(acc, x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-string-reverse-1.almd:3:55
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   list.fold(chars, "", (acc, x) => string.concat(acc, x))
  |                                                       ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  list.fold(chars, "", (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  list.reverse(chars)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E001]: type mismatch in fn 'reverse': expected String but got List[String]
  --> /tmp/dojo-string-reverse-3.almd:3:16
  in fn 'reverse'
  hint: Fix the expression type or change the expected type
  |
3 |   list.reverse(chars)
  |                ^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
