# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.range(0, int.to_float(n).log10().to_int() + 1), 0, 
    (acc, i) => 
      let digit = int.to_float(n) / float.to_int(10).to_power(i) % 10
      acc + int.to_int(digit)
  ) 
  int.abs(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:4:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |       let digit = int.to_float(n) / float.to_int(10).to_power(i) % 10
  |       ^^^
error: Expected expression at line 6:3 (got RParen ')')
  --> /tmp/dojo-sum-digits-0.almd:6:3
  |
6 |   )
  |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-sum-digits-0.almd:5:7
  in variable acc
  hint: Check the variable name
  |
5 |       acc + int.to_int(digit)
  |       ^^^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-0.almd:5:24
  in variable digit
  hint: Check the variable name
  |
5 |       acc + int.to_int(digit)
  |                        ^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-0.almd:5:24
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |       acc + int.to_int(digit)
  |                        ^^^^^

5 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let acc = 0
  list.fold(list.range(0, int.to_float(n).log10().to_int() + 1), acc, 
    (acc, i) => 
      let digit = (int.to_float(n) / float.to_int(10).to_power(i)) % 10
      acc + int.to_int(digit)
  ) 
  int.abs(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let digit = (int.to_float(n) / float.to_int(10).to_power(i)) % 10
  |       ^^^
error: Expected expression at line 7:3 (got RParen ')')
  --> /tmp/dojo-sum-digits-1.almd:7:3
  |
7 |   )
  |   ^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-1.almd:6:24
  in variable digit
  hint: Check the variable name
  |
6 |       acc + int.to_int(digit)
  |                        ^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-1.almd:6:24
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       acc + int.to_int(digit)
  |                        ^^^^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let acc = 0
  list.fold(list.range(0, int.to_float(n).log10().to_int() + 1), acc, 
    (acc, i) => 
      let digit = (int.to_float(n) / float.to_power(10, i)) % 10
      acc + int.to_int(digit)
  ) 
  int.abs(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let digit = (int.to_float(n) / float.to_power(10, i)) % 10
  |       ^^^
error: Expected expression at line 7:3 (got RParen ')')
  --> /tmp/dojo-sum-digits-2.almd:7:3
  |
7 |   )
  |   ^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-2.almd:6:24
  in variable digit
  hint: Check the variable name
  |
6 |       acc + int.to_int(digit)
  |                        ^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-2.almd:6:24
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |       acc + int.to_int(digit)
  |                        ^^^^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let acc = 0
  list.fold(list.range(0, int.to_float(n).log10().to_int() + 1), acc, 
    (acc, i) => 
      let digit = (int.to_float(n) / float.to_power(10, i)) % 10
      acc + digit
  ) 
  int.abs(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-3.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let digit = (int.to_float(n) / float.to_power(10, i)) % 10
  |       ^^^
error: Expected expression at line 7:3 (got RParen ')')
  --> /tmp/dojo-sum-digits-3.almd:7:3
  |
7 |   )
  |   ^
error[E003]: undefined variable 'digit'
  --> /tmp/dojo-sum-digits-3.almd:6:13
  in variable digit
  hint: Check the variable name
  |
6 |       acc + digit
  |             ^^^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
