# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.to_list(s) == list.reverse(string.to_list(s))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error[E002]: undefined function 'string.to_list'
  --> /tmp/dojo-is-palindrome-0.almd:2:18
  in call to string.to_list()
  hint: No function 'to_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   string.to_list(s) == list.reverse(string.to_list(s))
  |                  ^
error[E002]: undefined function 'string.to_list'
  --> /tmp/dojo-is-palindrome-0.almd:2:52
  in call to string.to_list()
  hint: No function 'to_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   string.to_list(s) == list.reverse(string.to_list(s))
  |                                                    ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.to_chars(s) == list.reverse(string.to_chars(s))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error[E002]: undefined function 'string.to_chars'
  --> /tmp/dojo-is-palindrome-1.almd:2:19
  in call to string.to_chars()
  hint: Did you mean `string.chars`?
  try:
      // string.to_chars(...)  →  string.chars(...)
      string.chars(...)
  |
2 |   string.to_chars(s) == list.reverse(string.to_chars(s))
  |                   ^
error[E002]: undefined function 'string.to_chars'
  --> /tmp/dojo-is-palindrome-1.almd:2:54
  in call to string.to_chars()
  hint: Did you mean `string.chars`?
  try:
      // string.to_chars(...)  →  string.chars(...)
      string.chars(...)
  |
2 |   string.to_chars(s) == list.reverse(string.to_chars(s))
  |                                                      ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_palindrome(s: String) -> Bool = 
  string.chars(s) == list.reverse(string.chars(s))
```
