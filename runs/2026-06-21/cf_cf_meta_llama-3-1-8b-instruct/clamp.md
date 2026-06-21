# clamp

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn clamp(value: Int, low: Int, high: Int) -> Int {
  if value < low {
    low
  } else if value > high {
    high
  } else {
    value
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-clamp-0.almd
error: Missing '=' before function body at line 1:50
  --> /tmp/dojo-clamp-0.almd:1:50
  hint: Almide requires '=' before the body. Write: fn clamp(...) -> Type = { ... }
  |
1 | fn clamp(value: Int, low: Int, high: Int) -> Int {
  |                                                  ^

1 error(s) found
Compile error for /tmp/dojo-clamp-0.almd:
compile failed
FAILED: /tmp/dojo-clamp-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn clamp(value: Int, low: Int, high: Int) -> Int = 
  if value < low then low
  else if value > high then high
  else value
```
