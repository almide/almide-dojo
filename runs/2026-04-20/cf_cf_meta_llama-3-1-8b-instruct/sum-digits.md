# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    if n == 0 then 0 
    else let n = int.abs(n) in 
      let sum = n % 10 in 
      sum + sum_digits(n / 10) 
  in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:4:10
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     else let n = int.abs(n) in
  |          ^^^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-sum-digits-0.almd:7:3
  |
7 |   in
  |   ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else let n = int.abs(n) in 
    let sum = n % 10 in 
    sum + sum_digits(n / 10)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:3:8
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |   else let n = int.abs(n) in
  |        ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0 
  else int.abs(n) % 10 + sum_digits(int.abs(n) / 10)
```
