# is-palindrome

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
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
  --> /tmp/dojo-is-palindrome-0.almd:2:20
  in call to string.to_list()
  hint: No function 'to_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |     string.to_list(s) == list.reverse(string.to_list(s))
  |                    ^
error[E002]: undefined function 'string.to_list'
  --> /tmp/dojo-is-palindrome-0.almd:2:54
  in call to string.to_list()
  hint: No function 'to_list' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |     string.to_list(s) == list.reverse(string.to_list(s))
  |                                                      ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_palindrome(s: String) -> Bool = 
    string.chars(s) == list.reverse(string.chars(s))
```
