# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n / 10 in 
  if n % 10 == 0 then sum else sum + n % 10 end
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E003]: undefined variable 'end'
  --> /tmp/dojo-sum-digits-0.almd:3:45
  in variable end
  hint: Did you mean `n`?
  try:
      // end  →  n
      n
  |
3 |   if n % 10 == 0 then sum else sum + n % 10 end
  |                                             ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n / 10 in 
  if n % 10 == 0 then sum else sum + n % 10 end
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E003]: undefined variable 'end'
  --> /tmp/dojo-sum-digits-1.almd:3:45
  in variable end
  hint: Did you mean `n`?
  try:
      // end  →  n
      n
  |
3 |   if n % 10 == 0 then sum else sum + n % 10 end
  |                                             ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n / 10 in 
  if n % 10 == 0 then sum else sum + n % 10 end
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E003]: undefined variable 'end'
  --> /tmp/dojo-sum-digits-2.almd:3:45
  in variable end
  hint: Did you mean `n`?
  try:
      // end  →  n
      n
  |
3 |   if n % 10 == 0 then sum else sum + n % 10 end
  |                                             ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n / 10 in 
  if n % 10 == 0 then sum else sum + n % 10 end
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E003]: undefined variable 'end'
  --> /tmp/dojo-sum-digits-3.almd:3:45
  in variable end
  hint: Did you mean `n`?
  try:
      // end  →  n
      n
  |
3 |   if n % 10 == 0 then sum else sum + n % 10 end
  |                                             ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
