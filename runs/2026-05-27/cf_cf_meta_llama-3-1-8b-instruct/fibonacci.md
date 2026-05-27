# fibonacci

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn fibonacci(n: Int) -> Int = 
  if n <= 1 then 0 else 
  if n == 2 then 1 else 
  fibonacci(n - 1) + fibonacci(n - 2)
```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-0.almd
FAILED: /tmp/dojo-fibonacci-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 then 0 else 
  if n == 1 then 1 else 
  fibonacci(n - 1) + fibonacci(n - 2)
```
