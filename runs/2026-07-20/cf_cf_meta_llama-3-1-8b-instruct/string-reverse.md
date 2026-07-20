# string-reverse

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  string.join(chars, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-string-reverse-0.almd
FAILED: /tmp/dojo-string-reverse-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn reverse(s: String) -> String = 
  let chars = string.chars(s)
  string.reverse(string.join(chars, ""))
```
