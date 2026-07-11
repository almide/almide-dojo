# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n.abs() / 10 in 
  let remainder = n.abs() % 10 in 
  if remainder == 0 then 
    sum 
  else 
    sum + remainder
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
  let sum = n.abs() / 10 in 
  let remainder = n.abs() % 10 in 
  if remainder == 0 then 
    sum 
  else 
    sum + remainder 
  |> list.fold(0, (acc, _) => acc + _)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 'xs' expects List[A] but got Int
  --> /tmp/dojo-sum-digits-1.almd:8:37
  in call to list.fold()
  hint: Fix the argument type
  |
8 |   |> list.fold(0, (acc, _) => acc + _)
  |                                     ^
error[E001]: type mismatch in call to list.fold(): expected List[?1] but got Int
  --> /tmp/dojo-sum-digits-1.almd:8:37
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
8 |   |> list.fold(0, (acc, _) => acc + _)
  |                                     ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n.abs() / 10 in 
  let remainder = n.abs() % 10 in 
  if remainder == 0 then 
    sum 
  else 
    sum + remainder
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
  let sum = n.abs() / 10 in 
  let remainder = n.abs() % 10 in 
  let next_digit = if remainder == 0 then 0 else remainder in 
  sum + next_digit
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
