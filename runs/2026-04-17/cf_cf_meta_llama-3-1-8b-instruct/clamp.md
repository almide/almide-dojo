# clamp

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
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

### Attempt 2 (FAIL)

```almide
fn clamp(value: Int, low: Int, high: Int) -> Int = {
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
Compiling /tmp/dojo-clamp-1.almd
error: Expected Then at line 2:18 (got LBrace '{')
  --> /tmp/dojo-clamp-1.almd:2:18
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if value < low {
  |                  ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-clamp-1.almd:4:5
  |
4 |   } else if value > high {
  |     ^

2 error(s) found
Compile error for /tmp/dojo-clamp-1.almd:
compile failed
FAILED: /tmp/dojo-clamp-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn clamp(value: Int, low: Int, high: Int) -> Int = {
  if value < low then low
  else if value > high then high
  else value
}
```
