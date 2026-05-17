# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = n.abs() / 10 in 
  n.abs() % 10 + digits * 9
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
  let digits = n.abs() / 10 in 
  n.abs() % 10 + if digits == 0 then 0 else digits * 9
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
  let digits = n.abs() / 10 in 
  let sum = n.abs() % 10 in 
  if digits == 0 then sum else sum + digits * 9
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
  let digits = n.abs() / 10 in 
  let sum = n.abs() % 10 in 
  if digits == 0 then sum else sum + sum_digits(digits) * 9
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
