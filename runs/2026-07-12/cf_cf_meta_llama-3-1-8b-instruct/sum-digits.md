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
  let sum = n.to_float().abs().to_int()
  let digits = if sum == 0 then [] else (sum % 10) :: list.map(x => (x % 10) :: list.map(y => (y % 10) :: []), list.range(1, sum / 10))
  list.fold(digits, 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: '::' is not valid in Almide at line 3:52
  --> /tmp/dojo-sum-digits-0.almd:3:52
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
  |
3 |   let digits = if sum == 0 then [] else (sum % 10) :: list.map(x => (x % 10) :: list.map(y => (y % 10) :: []), list.range(1, sum / 10))
  |                                                    ^
error[E001]: type mismatch in if branches: expected List[?0] but got Int
  --> /tmp/dojo-sum-digits-0.almd:3:48
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  |
3 |   let digits = if sum == 0 then [] else (sum % 10) :: list.map(x => (x % 10) :: list.map(y => (y % 10) :: []), list.range(1, sum / 10))
  |                                                ^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = n.to_float().abs().to_int()
  let digits = if sum == 0 then [] else 
    let single_digits = list.map(x => x % 10, list.range(0, sum))
    let multi_digits = list.map(x => x.to_float().to_int() % 10, list.range(1, sum / 10))
    list.flatten([single_digits, multi_digits])
  list.fold(digits, 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let single_digits = list.map(x => x % 10, list.range(0, sum))
  |     ^^^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-sum-digits-1.almd:5:35
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
5 |     let multi_digits = list.map(x => x.to_float().to_int() % 10, list.range(1, sum / 10))
  |                                   ^^
error[E003]: undefined variable 'single_digits'
  --> /tmp/dojo-sum-digits-1.almd:6:19
  in variable single_digits
  hint: Did you mean `sum_digits`?
  try:
      // single_digits  →  sum_digits
      sum_digits
  |
6 |     list.flatten([single_digits, multi_digits])
  |                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'multi_digits'
  --> /tmp/dojo-sum-digits-1.almd:6:34
  in variable multi_digits
  hint: Did you mean `sum_digits`?
  try:
      // multi_digits  →  sum_digits
      sum_digits
  |
6 |     list.flatten([single_digits, multi_digits])
  |                                  ^^^^^^^^^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-1.almd:7:13
  in variable digits
  hint: Check the variable name
  |
7 |   list.fold(digits, 0, (acc, x) => acc + x)
  |             ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = int.abs(n)
  let digits = if sum == 0 then [] else
    let single_digits = list.map((x) => x % 10, list.range(0, sum))
    let multi_digits = list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))
    list.flatten([single_digits, multi_digits])
  list.fold(digits, 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let single_digits = list.map((x) => x % 10, list.range(0, sum))
  |     ^^^
error[E005]: argument 'xs' expects List[A] but got fn(fn() -> fn() -> ?2) -> ?2
  --> /tmp/dojo-sum-digits-2.almd:5:95
  in call to list.map()
  hint: Fix the argument type
  |
5 |     let multi_digits = list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))
  |                                                                                               ^^
error[E005]: argument 'f' expects fn(A) -> B but got List[Int]
  --> /tmp/dojo-sum-digits-2.almd:5:95
  in call to list.map()
  hint: Fix the argument type
  |
5 |     let multi_digits = list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))
  |                                                                                               ^^
error[E003]: undefined variable 'single_digits'
  --> /tmp/dojo-sum-digits-2.almd:6:19
  in variable single_digits
  hint: Did you mean `sum_digits`?
  try:
      // single_digits  →  sum_digits
      sum_digits
  |
6 |     list.flatten([single_digits, multi_digits])
  |                   ^^^^^^^^^^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-2.almd:7:13
  in variable digits
  hint: Check the variable name
  |
7 |   list.fold(digits, 0, (acc, x) => acc + x)
  |             ^^^^^^
error[E001]: type mismatch in call to list.map(): expected List[A] but got fn(fn() -> fn() -> ?2) -> ?2
  --> /tmp/dojo-sum-digits-2.almd:5:95
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |     let multi_digits = list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))
  |                                                                                               ^^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got List[Int]
  --> /tmp/dojo-sum-digits-2.almd:5:95
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |     let multi_digits = list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))
  |                                                                                               ^^

7 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = int.abs(n)
  let digits = if sum == 0 then list.empty[Int] else
    let single_digits = list.map((x) => x % 10, list.range(0, sum))
    list.concat([single_digits, list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))])
  list.fold(digits, 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-3.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let single_digits = list.map((x) => x % 10, list.range(0, sum))
  |     ^^^
error[E003]: undefined variable 'single_digits'
  --> /tmp/dojo-sum-digits-3.almd:5:18
  in variable single_digits
  hint: Did you mean `sum_digits`?
  try:
      // single_digits  →  sum_digits
      sum_digits
  |
5 |     list.concat([single_digits, list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))])
  |                  ^^^^^^^^^^^^^
error[E005]: argument 'xs' expects List[A] but got fn(fn() -> fn() -> ?2) -> ?2
  --> /tmp/dojo-sum-digits-3.almd:5:104
  in call to list.map()
  hint: Fix the argument type
  |
5 |     list.concat([single_digits, list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))])
  |                                                                                                        ^^
error[E005]: argument 'f' expects fn(A) -> B but got List[Int]
  --> /tmp/dojo-sum-digits-3.almd:5:104
  in call to list.map()
  hint: Fix the argument type
  |
5 |     list.concat([single_digits, list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))])
  |                                                                                                        ^^
error[E002]: undefined function 'list.concat'
  --> /tmp/dojo-sum-digits-3.almd:5:104
  in call to list.concat()
  hint: No function 'concat' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |     list.concat([single_digits, list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))])
  |                                                                                                        ^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-3.almd:6:13
  in variable digits
  hint: Check the variable name
  |
6 |   list.fold(digits, 0, (acc, x) => acc + x)
  |             ^^^^^^
error[E001]: type mismatch in call to list.map(): expected List[A] but got fn(fn() -> fn() -> ?2) -> ?2
  --> /tmp/dojo-sum-digits-3.almd:5:104
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |     list.concat([single_digits, list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))])
  |                                                                                                        ^^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got List[Int]
  --> /tmp/dojo-sum-digits-3.almd:5:104
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |     list.concat([single_digits, list.map((x) => (x.to_float() / 10).to_int() % 10, list.range(1, sum / 10))])
  |                                                                                                        ^^

8 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
