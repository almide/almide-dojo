# fibonacci

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn fibonacci(n: Int) -> Int {
  if n == 0 {
    0
  } else if n == 1 {
    1
  } else {
    fibonacci(n - 1) + fibonacci(n - 2)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-0.almd
error: Missing '=' before function body at line 1:29
  --> /tmp/dojo-fibonacci-0.almd:1:29
  hint: Almide requires '=' before the body. Write: fn fibonacci(...) -> Type = { ... }
  |
1 | fn fibonacci(n: Int) -> Int {
  |                             ^

1 error(s) found
Compile error for /tmp/dojo-fibonacci-0.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 {
    0
  } else if n == 1 {
    1
  } else {
    fibonacci(n - 1) + fibonacci(n - 2)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-1.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-fibonacci-1.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n == 0 {
  |             ^

1 error(s) found
Compile error for /tmp/dojo-fibonacci-1.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 then 0 else if n == 1 then 1 else fibonacci(n - 1) + fibonacci(n - 2)
```
