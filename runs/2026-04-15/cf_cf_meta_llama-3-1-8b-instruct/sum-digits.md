# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n.abs() / 10 
  let carry = n.abs() % 10 
  if carry == 0 then 0 else carry + sum_digits(sum)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else n.abs() % 10 + sum_digits(n.abs() / 10)
```
