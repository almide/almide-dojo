# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let symbols = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ];
  let result = symbols
    .filter_map(|(value, symbol)| if n >= value then Some((n - value, symbol)) else None)
    .fold(String::new(), |acc, (value, symbol)| acc + symbol + &"")
  ;
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-roman-numeral-0.almd:1:31
  hint: Almide requires '=' before the body. Write: fn to_roman(...) -> Type = { ... }

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ];
  let result = symbols
    .filter_map(|(value, symbol)| if n >= value then Some((n - value, symbol)) else None)
    .fold(String::new(), |acc, (value, symbol)| acc + symbol + &"")
  ;
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 18:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-1.almd:18:5
error: Expected '}' to close block opened at line 1:33
  --> /tmp/dojo-roman-numeral-1.almd:19:64
  hint: Add '}' or check for a missing delimiter inside the block

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ];
  let result = symbols
    .filter_map(|(value, symbol)| if n >= value then Some((n - value, symbol)) else None)
    .fold(String::new(), |acc, (value, symbol)| acc + symbol)
  ;
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 18:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-2.almd:18:5
   |
18 |     .filter_map(|(value, symbol)| if n >= value then Some((n - value, symbol)) else None)
   |     ^
error[E001]: type mismatch in fn 'to_roman': expected String but got List[(Int, String)]
  --> /tmp/dojo-roman-numeral-2.almd:21:3
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
21 |   result
   |   ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I")
  ];
  let result = symbols
    .filter_map(|(value, symbol)| if n >= value then Some((n - value, symbol)) else None)
    .fold(String::new(), |acc, (value, symbol)| acc + symbol)
  ;
  let result = result
  ;
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 18:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-3.almd:18:5
   |
18 |     .filter_map(|(value, symbol)| if n >= value then Some((n - value, symbol)) else None)
   |     ^
error[E001]: type mismatch in fn 'to_roman': expected String but got List[(Int, String)]
  --> /tmp/dojo-roman-numeral-3.almd:23:3
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
23 |   result
   |   ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
