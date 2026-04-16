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
  let sum = int.fold(int.abs(n), 0, (acc, x) => 
    acc + int.mod(x, 10)) 
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected name at line 3:15 (got Mod 'mod')
  --> /tmp/dojo-sum-digits-0.almd:3:15
  |
3 |     acc + int.mod(x, 10))
  |               ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-0.almd:2:3
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let sum = int.fold(int.abs(n), 0, (acc, x) =>
  |   ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  int.fold(int.abs(n), 0, (acc, x) => acc + int.mod(x, 10))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected name at line 2:49 (got Mod 'mod')
  --> /tmp/dojo-sum-digits-1.almd:2:49
  |
2 |   int.fold(int.abs(n), 0, (acc, x) => acc + int.mod(x, 10))
  |                                                 ^
error: Expected Fn at line 2:52 (got LParen '(')
  --> /tmp/dojo-sum-digits-1.almd:2:52
  |
2 |   int.fold(int.abs(n), 0, (acc, x) => acc + int.mod(x, 10))
  |                                                    ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  int.fold(int.abs(n), 0, (acc, x) => acc + int.to_int(x % 10))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-2.almd:2:60
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   int.fold(int.abs(n), 0, (acc, x) => acc + int.to_int(x % 10))
  |                                                            ^^
error[E002]: undefined function 'int.fold'
  --> /tmp/dojo-sum-digits-2.almd:2:60
  in call to int.fold()
  hint: No function 'fold' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   int.fold(int.abs(n), 0, (acc, x) => acc + int.to_int(x % 10))
  |                                                            ^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  list.fold(int.chars(int.to_string(int.abs(n))), 0, (acc, x) => acc + int.to_int(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined function 'int.chars'
  --> /tmp/dojo-sum-digits-3.almd:2:45
  in call to int.chars()
  hint: No function 'chars' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.fold(int.chars(int.to_string(int.abs(n))), 0, (acc, x) => acc + int.to_int(x))
  |                                             ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-3.almd:2:83
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   list.fold(int.chars(int.to_string(int.abs(n))), 0, (acc, x) => acc + int.to_int(x))
  |                                                                                   ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
