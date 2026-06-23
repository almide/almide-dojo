# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
    let chars = string.chars(s) in
    list.equal(list.map(chars, (x) => x), list.reverse(chars))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error[E002]: undefined function 'list.equal'
  --> /tmp/dojo-is-palindrome-0.almd:3:56
  in call to list.equal()
  hint: No function 'equal' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
3 |     list.equal(list.map(chars, (x) => x), list.reverse(chars))
  |                                                        ^^^^^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_palindrome(s: String) -> Bool = 
    let chars = string.chars(s) in
    list.map(chars, (x) => x) == list.reverse(chars)
```
