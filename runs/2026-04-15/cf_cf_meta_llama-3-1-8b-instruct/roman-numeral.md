# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let (symbols, values) = 
    [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
     (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
     (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  in 
    list.fold(values, "", (acc, (value, symbol)) => 
      if n >= value then 
        acc + symbol + to_roman(n - value) 
      else 
        acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-0.almd:6:3
  |
6 |   in
  |   ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:9:15
  in variable symbol
  hint: Did you mean `symbols`?
  |
9 |         acc + symbol + to_roman(n - value)
  |               ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let (symbols, values) = 
    [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
     (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
     (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  in 
    list.fold(values, "", (acc, (value, symbol)) => 
      if n >= value then 
        acc + symbol + to_roman(n - value) 
      else 
        acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-1.almd:6:3
  |
6 |   in
  |   ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:9:15
  in variable symbol
  hint: Did you mean `symbols`?
  |
9 |         acc + symbol + to_roman(n - value)
  |               ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let (symbols, values) = 
    [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
     (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
     (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  in 
    list.fold(values, "", (acc, (value, symbol)) => 
      if n >= value then 
        acc + symbol + to_roman(n - value) 
      else 
        acc + symbol)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-2.almd:6:3
  |
6 |   in
  |   ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:9:15
  in variable symbol
  hint: Did you mean `symbols`?
  |
9 |         acc + symbol + to_roman(n - value)
  |               ^^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:11:15
  in variable symbol
  hint: Did you mean `symbols`?
   |
11 |         acc + symbol)
   |               ^^^^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let (symbols, values) = 
    [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
     (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
     (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  in 
    list.fold(values, "", (acc, (value, symbol)) => 
      if n >= value then 
        acc + symbol + to_roman(n - value) 
      else 
        acc + symbol)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 6:3 (got In 'in')
  --> /tmp/dojo-roman-numeral-3.almd:6:3
  |
6 |   in
  |   ^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:9:15
  in variable symbol
  hint: Did you mean `symbols`?
  |
9 |         acc + symbol + to_roman(n - value)
  |               ^^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:11:15
  in variable symbol
  hint: Did you mean `symbols`?
   |
11 |         acc + symbol)
   |               ^^^^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
