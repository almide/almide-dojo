# string-reverse

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn reverse(s: String) -> String = 
    let chars = string.to_list(s)
    in string.join(list.reverse(chars), "")
```

**Diagnostic:**

```
error[E002]: undefined function 'string.join'
  --> /tmp/dojo-string-reverse-0.almd:3:5
  in call to string.join()
  here: string.join(list.reverse(chars), "")
  hint: `string.join` was removed at dialect epoch 15: rewrite as `list.join(xs, sep)`: the list is the receiver (R-string-01)
  |
3 |     string.join(list.reverse(chars), "")
  |     ^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-string-reverse-0.almd
Compile error for /tmp/dojo-string-reverse-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn reverse(s: String) -> String = 
    let chars = string.to_list(s)
    in list.join(list.reverse(chars), "")
```
