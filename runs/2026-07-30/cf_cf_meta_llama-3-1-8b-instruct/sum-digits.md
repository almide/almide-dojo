# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    if n == 0 then 0
    else let digit = n % 10 in 
       digit + sum_digits(n / 10)
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:4:10
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     else let digit = n % 10 in
  |          ^^^
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-sum-digits-0.almd:6:3
  |
6 |   in sum
  |   ^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-0.almd:5:8
  in variable digit
  hint: Check the variable name
  |
5 |        digit + sum_digits(n / 10)
  |        ^^^^^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-0.almd:5:31
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
5 |        digit + sum_digits(n / 10)
  |                               ^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0
  else let digit = n % 10 in 
       digit + sum_digits(int.abs(n / 10))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:3:8
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |   else let digit = n % 10 in
  |        ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0
  else n % 10 + sum_digits(int.abs(n / 10))
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
  if n == 0 then 0
  else n % 10 + sum_digits(int.abs(n / 10))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
