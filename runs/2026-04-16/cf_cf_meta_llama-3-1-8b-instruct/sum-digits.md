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
  let sum = 0 in 
  let n = int.abs(n) in 
  if n == 0 then 
    sum 
  else 
    sum_digits(int.div(n, 10)) + n % 10
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'int.div'
  --> /tmp/dojo-sum-digits-0.almd:7:27
  in call to int.div()
  hint: Did you mean `int.min`?
  try:
      // int.div(...)  →  int.min(...)
      int.min(...)
  |
7 |     sum_digits(int.div(n, 10)) + n % 10
  |                           ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 0 in 
  let n = int.abs(n) in 
  if n == 0 then 
    sum 
  else 
    sum_digits(int.div(n, 10)) + n % 10
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E002]: undefined function 'int.div'
  --> /tmp/dojo-sum-digits-1.almd:7:27
  in call to int.div()
  hint: Did you mean `int.min`?
  try:
      // int.div(...)  →  int.min(...)
      int.min(...)
  |
7 |     sum_digits(int.div(n, 10)) + n % 10
  |                           ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 0 in 
  let n = int.abs(n) in 
  if n == 0 then 
    sum 
  else 
    sum_digits(int.div(n, 10)) + n % 10
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E002]: undefined function 'int.div'
  --> /tmp/dojo-sum-digits-2.almd:7:27
  in call to int.div()
  hint: Did you mean `int.min`?
  try:
      // int.div(...)  →  int.min(...)
      int.min(...)
  |
7 |     sum_digits(int.div(n, 10)) + n % 10
  |                           ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 0 in 
  let n = int.abs(n) in 
  if n == 0 then 
    sum 
  else 
    sum_digits(int.div(n, 10)) + n % 10
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined function 'int.div'
  --> /tmp/dojo-sum-digits-3.almd:7:27
  in call to int.div()
  hint: Did you mean `int.min`?
  try:
      // int.div(...)  →  int.min(...)
      int.min(...)
  |
7 |     sum_digits(int.div(n, 10)) + n % 10
  |                           ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
