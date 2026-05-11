# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  in list.fold(
    string.chars(string.to_string(abs_n)), 
    0, 
    (acc, ch) => acc + int.parse(ch).unwrap_or(0)
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-sum-digits-0.almd:4:35
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
4 |     string.chars(string.to_string(abs_n)),
  |                                   ^^^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  in list.fold(
    string.chars(int.to_string(abs_n)), 
    0, 
    (acc, ch) => acc + int.parse(ch).unwrap_or(0)
  )
```
