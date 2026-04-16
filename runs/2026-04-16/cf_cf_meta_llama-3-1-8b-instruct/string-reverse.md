# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String {
  var result = ""
  for c in string.chars(s) {
    result = string.concat(result, c)
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
error: Missing '=' before function body at line 1:33
  --> /tmp/dojo-string-reverse-0.almd:1:33
  hint: Almide requires '=' before the body. Write: fn reverse(...) -> Type = { ... }
  |
1 | fn reverse(s: String) -> String {
  |                                 ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn reverse(s: String) -> String = {
  var result = ""
  for c in string.chars(s) {
    result = string.concat(result, c)
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-1.almd
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-string-reverse-1.almd:4:36
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |     result = string.concat(result, c)
  |                                    ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-1.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn reverse(s: String) -> String = {
  var result = ""
  for c in string.chars(s) {
    result = string.concat(result, c)
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-2.almd
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-string-reverse-2.almd:4:36
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |     result = string.concat(result, c)
  |                                    ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-2.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn reverse(s: String) -> String = {
  var result = ""
  for c in string.chars(s) {
    result = string.concat(result, c)
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-3.almd
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-string-reverse-3.almd:4:36
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |     result = string.concat(result, c)
  |                                    ^

1 error(s) found
Compile error for /tmp/dojo-string-reverse-3.almd:
compile failed
FAILED: /tmp/dojo-string-reverse-3.almd

1/1 test file(s) failed

```
