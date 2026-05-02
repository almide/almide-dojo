# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = if n == 0 then 0 else 
    let digits = if n < 0 then int.abs(n) else n 
    in 
      if digits < 10 then digits 
      else int.sum(int.map(int.to_list(digits), int.to_digit)) 
  in 
    sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let digits = if n < 0 then int.abs(n) else n
  |     ^^^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-sum-digits-0.almd:7:3
  |
7 |   in
  |   ^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:5:10
  in variable digits
  hint: Check the variable name
  |
5 |       if digits < 10 then digits
  |          ^^^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:5:27
  in variable digits
  hint: Check the variable name
  |
5 |       if digits < 10 then digits
  |                           ^^^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:6:40
  in variable digits
  hint: Check the variable name
  |
6 |       else int.sum(int.map(int.to_list(digits), int.to_digit))
  |                                        ^^^^^^
error[E002]: undefined function 'int.to_list'
  --> /tmp/dojo-sum-digits-0.almd:6:40
  in call to int.to_list()
  hint: No function 'to_list' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       else int.sum(int.map(int.to_list(digits), int.to_digit))
  |                                        ^^^^^^
error[E003]: undefined variable 'int'
  --> /tmp/dojo-sum-digits-0.almd:6:49
  in variable int
  hint: Did you mean `n`?
  try:
      // int  →  n
      n
  |
6 |       else int.sum(int.map(int.to_list(digits), int.to_digit))
  |                                                 ^^^
error[E002]: undefined function 'int.map'
  --> /tmp/dojo-sum-digits-0.almd:6:49
  in call to int.map()
  hint: Did you mean `int.max`?
  try:
      // int.map(...)  →  int.max(...)
      int.max(...)
  |
6 |       else int.sum(int.map(int.to_list(digits), int.to_digit))
  |                                                 ^^^
error[E002]: undefined function 'int.sum'
  --> /tmp/dojo-sum-digits-0.almd:6:49
  in call to int.sum()
  hint: No function 'sum' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       else int.sum(int.map(int.to_list(digits), int.to_digit))
  |                                                 ^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-0.almd:8:5
  in variable sum
  hint: Check the variable name
  |
8 |     sum
  |     ^^^

10 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = if n == 0 then 0 else 
    let digits = if n < 0 then int.abs(n) else n 
    in 
      if digits < 10 then digits 
      else int.to_list(digits) |> list.map(int.to_digit) |> list.sum
  in 
    sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let digits = if n < 0 then int.abs(n) else n
  |     ^^^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-sum-digits-1.almd:7:3
  |
7 |   in
  |   ^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-1.almd:5:10
  in variable digits
  hint: Check the variable name
  |
5 |       if digits < 10 then digits
  |          ^^^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-1.almd:5:27
  in variable digits
  hint: Check the variable name
  |
5 |       if digits < 10 then digits
  |                           ^^^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-1.almd:6:24
  in variable digits
  hint: Check the variable name
  |
6 |       else int.to_list(digits) |> list.map(int.to_digit) |> list.sum
  |                        ^^^^^^
error[E002]: undefined function 'int.to_list'
  --> /tmp/dojo-sum-digits-1.almd:6:24
  in call to int.to_list()
  hint: No function 'to_list' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       else int.to_list(digits) |> list.map(int.to_digit) |> list.sum
  |                        ^^^^^^
error[E003]: undefined variable 'int'
  --> /tmp/dojo-sum-digits-1.almd:6:44
  in variable int
  hint: Did you mean `n`?
  try:
      // int  →  n
      n
  |
6 |       else int.to_list(digits) |> list.map(int.to_digit) |> list.sum
  |                                            ^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-1.almd:8:5
  in variable sum
  hint: Check the variable name
  |
8 |     sum
  |     ^^^

8 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = if n == 0 then 0 else 
    let digits = if n < 0 then int.abs(n) else n 
    in 
      if digits < 10 then digits 
      else list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  in 
    sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let digits = if n < 0 then int.abs(n) else n
  |     ^^^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-sum-digits-2.almd:7:3
  |
7 |   in
  |   ^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-2.almd:5:10
  in variable digits
  hint: Check the variable name
  |
5 |       if digits < 10 then digits
  |          ^^^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-2.almd:5:27
  in variable digits
  hint: Check the variable name
  |
5 |       if digits < 10 then digits
  |                           ^^^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-2.almd:6:34
  in variable digits
  hint: Check the variable name
  |
6 |       else list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                                  ^^^^^^
error[E002]: undefined function 'int.to_digit'
  --> /tmp/dojo-sum-digits-2.almd:6:34
  in call to int.to_digit()
  hint: No function 'to_digit' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       else list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                                  ^^^^^^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-sum-digits-2.almd:6:34
  in call to list.map()
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
  |
6 |       else list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                                  ^^^^^^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-sum-digits-2.almd:6:103
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 1
      option.unwrap_or(<o: Option[A]>, <default: A>)
  |
6 |       else list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                                                                                                       ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-sum-digits-2.almd:6:103
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
6 |       else list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                                                                                                       ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-2.almd:8:5
  in variable sum
  hint: Check the variable name
  |
8 |     sum
  |     ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[A] but got Int
  --> /tmp/dojo-sum-digits-2.almd:6:103
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
6 |       else list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                                                                                                       ^

11 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = if n == 0 then 0 
    else 
      let digits = if n < 0 then int.abs(n) else n 
      in 
        list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  in 
    sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-3.almd:4:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |       let digits = if n < 0 then int.abs(n) else n
  |       ^^^
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-sum-digits-3.almd:7:3
  |
7 |   in
  |   ^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-3.almd:6:31
  in variable digits
  hint: Check the variable name
  |
6 |         list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                               ^^^^^^
error[E002]: undefined function 'int.to_digit'
  --> /tmp/dojo-sum-digits-3.almd:6:31
  in call to int.to_digit()
  hint: No function 'to_digit' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |         list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                               ^^^^^^
error[E004]: list.map() expects 2 argument(s) but got 1
  --> /tmp/dojo-sum-digits-3.almd:6:31
  in call to list.map()
  hint: Check the number of arguments
  try:
      // list.map() takes 2 arg(s) — you passed 1
      list.map(<xs: List[A]>, <f: fn(A) -> B>)
  |
6 |         list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                               ^^^^^^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-sum-digits-3.almd:6:100
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 1
      option.unwrap_or(<o: Option[A]>, <default: A>)
  |
6 |         list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                                                                                                    ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-sum-digits-3.almd:6:100
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
6 |         list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                                                                                                    ^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-3.almd:8:5
  in variable sum
  hint: Check the variable name
  |
8 |     sum
  |     ^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[A] but got Int
  --> /tmp/dojo-sum-digits-3.almd:6:100
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
6 |         list.map(int.to_digit(digits)) |> list.filter(option.is_some) |> list.map(option.unwrap_or(0)) |> list.sum
  |                                                                                                    ^

9 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
