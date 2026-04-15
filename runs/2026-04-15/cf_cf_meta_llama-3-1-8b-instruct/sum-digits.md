# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    if n == 0 then 0 
    else n.abs() % 10 + sum_digits(n.abs() / 10) 
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-sum-digits-0.almd:5:3
  |
5 |   in sum
  |   ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-0.almd:4:46
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  |
4 |     else n.abs() % 10 + sum_digits(n.abs() / 10)
  |                                              ^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else n.abs() % 10 + sum_digits(n.abs() / 10)
```
