# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    if n == 0 then 0 
    else 
      let sum = sum_digits(int.abs(n) / 10) 
      int.abs(n) % 10 + sum 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let sum = sum_digits(int.abs(n) / 10)
  |       ^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:6:25
  in variable sum
  hint: Check the variable name
  |
6 |       int.abs(n) % 10 + sum
  |                         ^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:7:3
  in variable sum
  hint: Check the variable name
  |
7 |   sum
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
  if n == 0 then 0 
  else 
    letkinson = sum_digits(int.abs(n) / 10) 
    int.abs(n) % 10 + letkinson
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:5 (got Ident 'int')
  --> /tmp/dojo-sum-digits-1.almd:5:5
  |
5 |     int.abs(n) % 10 + letkinson
  |     ^
error[E001]: type mismatch in if branches: expected Int but got Unit
  --> /tmp/dojo-sum-digits-1.almd:4:41
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `letkinson = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Int.
      // Rewrite as a rebinding of `letkinson`:
      //
      //   let new_letkinson = if cond then <new-value-for-letkinson> else letkinson
      //
      // Or, if letkinson is a loop-like accumulator, use recursion instead of mutation.
  |
4 |     letkinson = sum_digits(int.abs(n) / 10)
  |                                         ^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else 
    letkinson = sum_digits(int.abs(n) / 10) 
    letkinson + int.abs(n) % 10
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:5 (got Ident 'letkinson')
  --> /tmp/dojo-sum-digits-2.almd:5:5
  |
5 |     letkinson + int.abs(n) % 10
  |     ^
error[E001]: type mismatch in if branches: expected Int but got Unit
  --> /tmp/dojo-sum-digits-2.almd:4:41
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `letkinson = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Int.
      // Rewrite as a rebinding of `letkinson`:
      //
      //   let new_letkinson = if cond then <new-value-for-letkinson> else letkinson
      //
      // Or, if letkinson is a loop-like accumulator, use recursion instead of mutation.
  |
4 |     letkinson = sum_digits(int.abs(n) / 10)
  |                                         ^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else 
    letkinson = sum_digits(int.abs(n) / 10) 
    letkinson + int.abs(n) % 10
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:5 (got Ident 'letkinson')
  --> /tmp/dojo-sum-digits-3.almd:5:5
  |
5 |     letkinson + int.abs(n) % 10
  |     ^
error[E001]: type mismatch in if branches: expected Int but got Unit
  --> /tmp/dojo-sum-digits-3.almd:4:41
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `letkinson = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Int.
      // Rewrite as a rebinding of `letkinson`:
      //
      //   let new_letkinson = if cond then <new-value-for-letkinson> else letkinson
      //
      // Or, if letkinson is a loop-like accumulator, use recursion instead of mutation.
  |
4 |     letkinson = sum_digits(int.abs(n) / 10)
  |                                         ^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
