# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = int.fold(int.abs(n), 0, (acc, x) => acc + x % 10) 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'int.fold'
  --> /tmp/dojo-sum-digits-0.almd:2:59
  in call to int.fold()
  hint: No function 'fold' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   let sum = int.fold(int.abs(n), 0, (acc, x) => acc + x % 10)
  |                                                           ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(int.abs(n).to_string().chars(), 0, (acc, x) => acc + int.parse(x).unwrap_or(0))
  sum
```
