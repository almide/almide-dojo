# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  if n < 1 || n > 3999 {
    panic!("Input must be between 1 and 3999")
  }

  let roman_symbols = [
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
    (1, "I"),
  ];

  let mut result = String::new();
  for (value, symbol) in roman_symbols {
    while n >= value {
      result.push_str(symbol);
      n -= value;
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-roman-numeral-0.almd:1:31
  hint: Almide requires '=' before the body. Write: fn to_roman(...) -> Type = { ... }
  |
1 | fn to_roman(n: Int) -> String {
  |                               ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  if n < 1 || n > 3999 {
    panic!("Input must be between 1 and 3999")
  }

  let roman_symbols = [
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
    (1, "I"),
  ];

  let mut result = string.new();
  for (value, symbol) in roman_symbols {
    while n >= value {
      result.push_str(symbol);
      n -= value;
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: '||' is not valid in Almide at line 2:12
  --> /tmp/dojo-roman-numeral-1.almd:2:12
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   if n < 1 || n > 3999 {
  |            ^
error: Semicolons are not used in Almide at line 20:4
  --> /tmp/dojo-roman-numeral-1.almd:20:4
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
20 |   ];
   |    ^
error[E003]: undefined variable 'panic'
  --> /tmp/dojo-roman-numeral-1.almd:3:5
  in variable panic
  hint: Check the variable name
  |
3 |     panic!("Input must be between 1 and 3999")
  |     ^^^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  if n < 1 or n > 3999 {
    error!("Input must be between 1 and 3999")
  }

  let roman_symbols = [
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
    (1, "I"),
  ];

  let mut result = string.new();
  for (value, symbol) in roman_symbols {
    while n >= value {
      result.push_str(symbol);
      n -= value;
    }
  }
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected Then at line 2:24 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-2.almd:2:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n < 1 or n > 3999 {
  |                        ^
error: Semicolons are not used in Almide at line 20:4
  --> /tmp/dojo-roman-numeral-2.almd:20:4
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
20 |   ];
   |    ^
error[E003]: undefined variable 'error'
  --> /tmp/dojo-roman-numeral-2.almd:3:5
  in variable error
  hint: Check the variable name
  |
3 |     error!("Input must be between 1 and 3999")
  |     ^^^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  if n < 1 or n > 3999 {
    return "Input must be between 1 and 3999"
  }

  let roman_symbols = [
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
    (1, "I"),
  ];

  let mut result = string.new();
  for (value, symbol) in roman_symbols {
    while n >= value {
      result.push_str(symbol);
      n -= value;
    }
  }
  result
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected Then at line 2:24 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-3.almd:2:24
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n < 1 or n > 3999 {
  |                        ^
error: Semicolons are not used in Almide at line 20:4
  --> /tmp/dojo-roman-numeral-3.almd:20:4
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
20 |   ];
   |    ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:1:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
1 | fn to_roman(n: Int) -> String = {
  |                                 ^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
