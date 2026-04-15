# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  in 
    list.fold(roman, "", (acc, (value, symbol)) => 
      if n >= value then acc + symbol + to_roman(n - value) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:7:3
  |
7 |   in
  |   ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:9:32
  in variable symbol
  hint: Check the variable name
  |
9 |       if n >= value then acc + symbol + to_roman(n - value) else acc)
  |                                ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-0.almd:9:66
  in call to list.fold()
  hint: Fix the argument type
  |
9 |       if n >= value then acc + symbol + to_roman(n - value) else acc)
  |                                                                  ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-0.almd:9:66
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
9 |       if n >= value then acc + symbol + to_roman(n - value) else acc)
  |                                                                  ^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  in 
    list.fold(roman, "", (acc, (value, symbol)) => 
      if n >= value then acc + symbol + to_roman(n - value) else acc)

// Above code was already corrected
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-1.almd:7:3
  |
7 |   in
  |   ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:9:32
  in variable symbol
  hint: Check the variable name
  |
9 |       if n >= value then acc + symbol + to_roman(n - value) else acc)
  |                                ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-1.almd:9:66
  in call to list.fold()
  hint: Fix the argument type
  |
9 |       if n >= value then acc + symbol + to_roman(n - value) else acc)
  |                                                                  ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-1.almd:9:66
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
9 |       if n >= value then acc + symbol + to_roman(n - value) else acc)
  |                                                                  ^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  in 
    list.fold(roman, "", (acc, (value, symbol)) => 
      if n >= value then acc + symbol + to_roman(n - value) else acc)

// restructure the list fold to avoid recursion
fn to_roman(n: Int) -> String = 
  let roman = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:7:3
  |
7 |   in
  |   ^
error[E012]: duplicate function 'to_roman'
  at line 12
  in fn to_roman
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn to_roman(n: Int) -> String =
   | ----------------------------------- first definition of 'to_roman' here
...
12 | fn to_roman(n: Int) -> String =
   | ^^^^^^^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:9:32
  in variable symbol
  hint: Check the variable name
  |
9 |       if n >= value then acc + symbol + to_roman(n - value) else acc)
  |                                ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-2.almd:9:66
  in call to list.fold()
  hint: Fix the argument type
  |
9 |       if n >= value then acc + symbol + to_roman(n - value) else acc)
  |                                                                  ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, Int) -> String
  --> /tmp/dojo-roman-numeral-2.almd:9:66
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
9 |       if n >= value then acc + symbol + to_roman(n - value) else acc)
  |                                                                  ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:16:52
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
16 |     (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
   |                                                    ^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let roman = [
    (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
    (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
    (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")
  ]
  in 
    list.fold(roman, "", (acc, (value, symbol)) => 
      if n >= value then string.concat([acc, symbol]) + to_roman(n - value) else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 7:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:7:3
  |
7 |   in
  |   ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:9:46
  in variable symbol
  hint: Check the variable name
  |
9 |       if n >= value then string.concat([acc, symbol]) + to_roman(n - value) else acc)
  |                                              ^^^^^^
error[E002]: undefined function 'string.concat'
  --> /tmp/dojo-roman-numeral-3.almd:9:46
  in call to string.concat()
  hint: No function 'concat' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
9 |       if n >= value then string.concat([acc, symbol]) + to_roman(n - value) else acc)
  |                                              ^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(Unknown, Int) -> Unknown
  --> /tmp/dojo-roman-numeral-3.almd:9:82
  in call to list.fold()
  hint: Fix the argument type
  |
9 |       if n >= value then string.concat([acc, symbol]) + to_roman(n - value) else acc)
  |                                                                                  ^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(Unknown, Int) -> Unknown
  --> /tmp/dojo-roman-numeral-3.almd:9:82
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
9 |       if n >= value then string.concat([acc, symbol]) + to_roman(n - value) else acc)
  |                                                                                  ^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
