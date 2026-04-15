# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let n = int.abs(n)
  in 
  if n < 10 then n
  else (n % 10) + sum_digits(n / 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected expression at line 3:3 (got In 'in')
  --> /tmp/dojo-sum-digits-0.almd:3:3
  |
3 |   in
  |   ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let n = int.abs(n) 
  in if n < 10 then n else (n % 10) + sum_digits(n / 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected expression at line 3:3 (got In 'in')
  --> /tmp/dojo-sum-digits-1.almd:3:3
  |
3 |   in if n < 10 then n else (n % 10) + sum_digits(n / 10)
  |   ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-1.almd:2:19
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let n = int.abs(n)
  |                   ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n) 
  in if abs_n < 10 then abs_n else (abs_n % 10) + sum_digits(abs_n / 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected expression at line 3:3 (got In 'in')
  --> /tmp/dojo-sum-digits-2.almd:3:3
  |
3 |   in if abs_n < 10 then abs_n else (abs_n % 10) + sum_digits(abs_n / 10)
  |   ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-2.almd:2:23
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let abs_n = int.abs(n)
  |                       ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n) 
  in if abs_n < 10 then abs_n else (abs_n % 10) + sum_digits(abs_n / 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected expression at line 3:3 (got In 'in')
  --> /tmp/dojo-sum-digits-3.almd:3:3
  |
3 |   in if abs_n < 10 then abs_n else (abs_n % 10) + sum_digits(abs_n / 10)
  |   ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-3.almd:2:23
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let abs_n = int.abs(n)
  |                       ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
