# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n.abs() 
  let digits = 
    if sum == 0 then [] 
    else 
      let digit = sum % 10 
      let rest = sum / 10 
      [digit] + list.map(rest, fn(x) => x % 10) 
  list.fold(digits, 0, fn(acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:6:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let digit = sum % 10
  |       ^^^
error: Expected expression at line 8:32 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-0.almd:8:32
  |
8 |       [digit] + list.map(rest, fn(x) => x % 10)
  |                                ^
error: Expected expression at line 9:24 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-0.almd:9:24
  |
9 |   list.fold(digits, 0, fn(acc, x) => acc + x)
  |                        ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-0.almd:7:24
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
7 |       let rest = sum / 10
  |                        ^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  list.fold(
    if n == 0 then [] 
    else 
      let digit = n % 10 
      let rest = n / 10 
      [digit] + list.map(rest, fn(x) => x % 10) 
    , 0
    , fn(acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let digit = n % 10
  |       ^^^
error: Expected function name at line 7:34 (got LParen '(')
  --> /tmp/dojo-sum-digits-1.almd:7:34
  |
7 |       [digit] + list.map(rest, fn(x) => x % 10)
  |                                  ^
error: Expected function name at line 9:9 (got LParen '(')
  --> /tmp/dojo-sum-digits-1.almd:9:9
  |
9 |     , fn(acc, x) => acc + x)
  |         ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  list.fold(
    if n == 0 then [] 
    else 
      let digit = n % 10 
      { let rest = n / 10; list.map(rest, fn(x) => x % 10) } + [digit]
    , 0
    , fn(acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let digit = n % 10
  |       ^^^
error: Expected function name at line 6:45 (got LParen '(')
  --> /tmp/dojo-sum-digits-2.almd:6:45
  |
6 |       { let rest = n / 10; list.map(rest, fn(x) => x % 10) } + [digit]
  |                                             ^
error: Expected function name at line 8:9 (got LParen '(')
  --> /tmp/dojo-sum-digits-2.almd:8:9
  |
8 |     , fn(acc, x) => acc + x)
  |         ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  list.fold(
    if n == 0 then [] 
    else 
      let digit = n % 10 
      { let rest = n / 10 } 
      + list.map(
        n / 10
        , fn(x) => x % 10
      ) 
      + [digit]
    , 0
    , fn(acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-3.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let digit = n % 10
  |       ^^^
error: Expected function name at line 9:13 (got LParen '(')
  --> /tmp/dojo-sum-digits-3.almd:9:13
  |
9 |         , fn(x) => x % 10
  |             ^
error: Expected function name at line 13:9 (got LParen '(')
  --> /tmp/dojo-sum-digits-3.almd:13:9
   |
13 |     , fn(acc, x) => acc + x)
   |         ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
