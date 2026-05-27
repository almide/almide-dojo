# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = (int.abs(n) / 10) + (int.abs(n) % 10) 
  in if n == 0 then 0 else sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = (int.abs(n) / 10) + (int.abs(n) % 10) 
  in if int.abs(n) == 0 then 0 else sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = (int.abs(n) / 10) + (int.abs(n) % 10)
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = (int.abs(n) / 10) + (int.abs(n) % 10)
  in int.to_int(float.to_int(float.from_int(sum)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-3.almd:3:42
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   int.to_int(float.to_int(float.from_int(sum)))
  |                                          ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
