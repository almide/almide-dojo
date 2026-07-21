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
  let sum = n > 0 ? 
    (n % 10 + sum_digits(n / 10)) 
  : 
    0
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected expression at line 4:3 (got Colon ':')
  --> /tmp/dojo-sum-digits-0.almd:4:3
  |
4 |   :
  |   ^
error: operator '?' requires Option or Result type but got Int
  --> /tmp/dojo-sum-digits-0.almd:2:17
  in operator ?
  hint: Use '?' only on Option[T] or Result[T, E] values
  |
2 |   let sum = n > 0 ?
  |                 ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Bool
  --> /tmp/dojo-sum-digits-0.almd:6:3
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  |
6 |   sum
  |   ^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n > 0 then 
    n % 10 + sum_digits(n / 10) 
  else 
    0
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
  if n == 0 then 
    0 
  else 
    n % 10 + sum_digits(int.abs(n) / 10)
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
  if n == 0 then 
    0 
  else 
    n % 10 + sum_digits(int.abs(n) / 10 |> int.to_int)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-3.almd:5:38
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |     n % 10 + sum_digits(int.abs(n) / 10 |> int.to_int)
  |                                      ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
