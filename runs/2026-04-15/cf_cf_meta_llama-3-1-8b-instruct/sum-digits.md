# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 0
  in 
    if n == 0 then 
      sum 
    else 
      sum_digits(int.abs(n) / 10) + int.abs(n) % 10
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected expression at line 3:3 (got In 'in')
  --> /tmp/dojo-sum-digits-0.almd:3:3
  |
3 |   in
  |   ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 0
  if n == 0 then 
    sum 
  else 
    sum_digits(int.abs(n) / 10) + int.abs(n) % 10
```
