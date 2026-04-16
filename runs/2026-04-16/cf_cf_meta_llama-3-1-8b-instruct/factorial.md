# factorial

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn factorial(n: Int) -> Int {
  if n == 0 {
    1
  } else {
    n * factorial(n - 1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-factorial-0.almd
error: Missing '=' before function body at line 1:29
  --> /tmp/dojo-factorial-0.almd:1:29
  hint: Almide requires '=' before the body. Write: fn factorial(...) -> Type = { ... }
  |
1 | fn factorial(n: Int) -> Int {
  |                             ^

1 error(s) found
Compile error for /tmp/dojo-factorial-0.almd:
compile failed
FAILED: /tmp/dojo-factorial-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn factorial(n: Int) -> Int = 
  if n == 0 then 1 else n * factorial(n - 1)
```
