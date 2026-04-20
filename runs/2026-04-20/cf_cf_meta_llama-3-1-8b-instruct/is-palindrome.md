# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  fn (s: String) -> Bool = 
    s == string.reverse(s)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-is-palindrome-0.almd:2:3
  |
2 |   fn (s: String) -> Bool =
  |   ^
error: Expected function name at line 2:6 (got LParen '(')
  --> /tmp/dojo-is-palindrome-0.almd:2:6
  |
2 |   fn (s: String) -> Bool =
  |      ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_palindrome(s: String) -> Bool = s == string.reverse(s)
```
