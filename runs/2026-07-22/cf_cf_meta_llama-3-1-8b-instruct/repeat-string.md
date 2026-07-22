# repeat-string

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String {
  if n == 0 {
    return ""
  }
  if n == 1 {
    return s
  }
  return s + repeat(s, n - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-0.almd
error: Missing '=' before function body at line 1:40
  --> /tmp/dojo-repeat-string-0.almd:1:40
  hint: Almide requires '=' before the body. Write: fn repeat(...) -> Type = { ... }
  |
1 | fn repeat(s: String, n: Int) -> String {
  |                                        ^

1 error(s) found
Compile error for /tmp/dojo-repeat-string-0.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String = 
  if n == 0 {
    return ""
  }
  if n == 1 {
    return s
  }
  return s + repeat(s, n - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-1.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-repeat-string-1.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n == 0 {
  |             ^

1 error(s) found
Compile error for /tmp/dojo-repeat-string-1.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String = 
  if n == 0 {
    ""
  } else if n == 1 {
    s
  } else {
    s + repeat(s, n - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-2.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-repeat-string-2.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n == 0 {
  |             ^

1 error(s) found
Compile error for /tmp/dojo-repeat-string-2.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn repeat(s: String, n: Int) -> String = 
  if n == 0 {
    ""
  } else if n == 1 {
    s
  } else {
    s + repeat(s, n - 1)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-repeat-string-3.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-repeat-string-3.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n == 0 {
  |             ^

1 error(s) found
Compile error for /tmp/dojo-repeat-string-3.almd:
compile failed
FAILED: /tmp/dojo-repeat-string-3.almd

1/1 test file(s) failed

```
