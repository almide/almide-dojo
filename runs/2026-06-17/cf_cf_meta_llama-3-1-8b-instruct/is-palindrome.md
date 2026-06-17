# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool {
  string.chars(s) == string.chars(s) |> list.reverse
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error: Missing '=' before function body at line 1:37
  --> /tmp/dojo-is-palindrome-0.almd:1:37
  hint: Almide requires '=' before the body. Write: fn is_palindrome(...) -> Type = { ... }
  |
1 | fn is_palindrome(s: String) -> Bool {
  |                                     ^

1 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_palindrome(s: String) -> Bool = string.chars(s) == string.chars(s) |> list.reverse
```
