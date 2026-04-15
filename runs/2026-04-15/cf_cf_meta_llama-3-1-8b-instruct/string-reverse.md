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
  let reversed = list.fold(chars, [], (acc, x) => acc + [x])
  string.from_chars(reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-0.almd:4:21
  in call to string.from_chars()
  hint: No function 'from_chars' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |   string.from_chars(reversed)
  |                     ^^^^^^^^

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
  let reversed = list.fold(chars, [], (acc, x) => acc + [x])
  string.from_chars(reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-1.almd:4:21
  in call to string.from_chars()
  hint: No function 'from_chars' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |   string.from_chars(reversed)
  |                     ^^^^^^^^

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
  let reversed = list.fold(chars, [], (acc, x) => acc + [x])
  string.from_chars(reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-2.almd:4:21
  in call to string.from_chars()
  hint: No function 'from_chars' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |   string.from_chars(reversed)
  |                     ^^^^^^^^

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
  let reversed = list.fold(chars, [], (acc, x) => acc + [x])
  string.from_chars(reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'string.from_chars'
  --> /tmp/dojo-string-reverse-3.almd:4:21
  in call to string.from_chars()
  hint: No function 'from_chars' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |   string.from_chars(reversed)
  |                     ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
