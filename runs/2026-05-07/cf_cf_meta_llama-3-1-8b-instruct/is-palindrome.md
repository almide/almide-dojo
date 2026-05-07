# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  let reversed = string.reverse(s) 
  string.equals(s, reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-is-palindrome-0.almd:3:20
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.equals(s, reversed)
  |                    ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  let reversed = string.reverse(s) 
  string.equals(s, reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-is-palindrome-1.almd:3:20
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.equals(s, reversed)
  |                    ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  let reversed = string.reverse(s) 
  string.equals(s, reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-is-palindrome-2.almd:3:20
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.equals(s, reversed)
  |                    ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  let reversed = string.reverse(s) 
  string.equals(s, reversed)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-3.almd
error[E002]: undefined function 'string.equals'
  --> /tmp/dojo-is-palindrome-3.almd:3:20
  in call to string.equals()
  hint: No function 'equals' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.equals(s, reversed)
  |                    ^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
