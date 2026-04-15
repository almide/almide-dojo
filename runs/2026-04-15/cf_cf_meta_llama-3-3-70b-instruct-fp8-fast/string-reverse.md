# string-reverse

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.from_code_points(
    list.reverse(
      string.to_code_points(s)
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error[E002]: undefined function 'string.to_code_points'
  --> /tmp/dojo-string-reverse-0.almd:4:29
  in call to string.to_code_points()
  hint: No function 'to_code_points' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |       string.to_code_points(s)
  |                             ^
error[E002]: undefined function 'string.from_code_points'
  --> /tmp/dojo-string-reverse-0.almd:4:29
  in call to string.from_code_points()
  hint: Did you mean `string.from_codepoint`?
  |
4 |       string.to_code_points(s)
  |                             ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.from_codepoint_list(
    list.reverse(
      string.to_codepoint_list(s)
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'string.to_codepoint_list'
  --> /tmp/dojo-string-reverse-1.almd:4:32
  in call to string.to_codepoint_list()
  hint: No function 'to_codepoint_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |       string.to_codepoint_list(s)
  |                                ^
error[E002]: undefined function 'string.from_codepoint_list'
  --> /tmp/dojo-string-reverse-1.almd:4:32
  in call to string.from_codepoint_list()
  hint: Did you mean `string.from_codepoint`?
  |
4 |       string.to_codepoint_list(s)
  |                                ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.from_char_list(
    list.reverse(
      string.to_char_list(s)
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'string.to_char_list'
  --> /tmp/dojo-string-reverse-2.almd:4:27
  in call to string.to_char_list()
  hint: No function 'to_char_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |       string.to_char_list(s)
  |                           ^
error[E002]: undefined function 'string.from_char_list'
  --> /tmp/dojo-string-reverse-2.almd:4:27
  in call to string.from_char_list()
  hint: No function 'from_char_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |       string.to_char_list(s)
  |                           ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = 
  string.from_code_points(
    list.reverse(
      string.to_code_points(s)
    )
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'string.to_code_points'
  --> /tmp/dojo-string-reverse-3.almd:4:29
  in call to string.to_code_points()
  hint: No function 'to_code_points' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |       string.to_code_points(s)
  |                             ^
error[E002]: undefined function 'string.from_code_points'
  --> /tmp/dojo-string-reverse-3.almd:4:29
  in call to string.from_code_points()
  hint: Did you mean `string.from_codepoint`?
  |
4 |       string.to_code_points(s)
  |                             ^

2 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
