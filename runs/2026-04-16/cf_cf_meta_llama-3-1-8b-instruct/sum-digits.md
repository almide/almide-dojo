# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n.abs()
  let digits = sum / 10
  let last_digit = sum % 10
  if digits == 0 then last_digit else digits + last_digit
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
  let sum = n.abs()
  let digits = sum / 10
  let last_digit = sum % 10
  if digits == 0 then last_digit else digits + last_digit
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
  let sum = n.abs()
  let digits = sum / 10
  let last_digit = sum % 10
  if digits == 0 then last_digit else digits + last_digit
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
  let sum = n.abs()
  let digits = sum / 10
  let last_digit = sum % 10
  if digits == 0 then last_digit else digits + last_digit
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
