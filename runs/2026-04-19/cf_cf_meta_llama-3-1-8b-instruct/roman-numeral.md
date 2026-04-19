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
    friday_value(1000, "M"),
    friday_value(900, "CM"),
    friday_value(500, "D"),
    friday_value(400, "CD"),
    friday_value(100, "C"),
    friday_value(90, "XC"),
    friday_value(50, "L"),
    friday_value(40, "XL"),
    friday_value(10, "X"),
    friday_value(9, "IX"),
    friday_value(5, "V"),
    friday_value(4, "IV"),
    friday_value(1, "I")
  ];

  let result = symbols
    .iter()
    .filter(|(value, _)| n >= *value)
    .map(|(value, symbol)| {
      let count = (n / value).min(3);
      (count, symbol)
    })
    .fold((0, ""), |(count, result), (count, symbol)| {
      (count, result + symbol.repeat(count))
    });

  result.1
}

fn friday_value(value: Int, symbol: String) -> (Int, String) {
  (value, symbol)
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
error: Missing '=' before function body at line 32:62
  --> /tmp/dojo-roman-numeral-0.almd:32:62
  hint: Almide requires '=' before the body. Write: fn friday_value(...) -> Type = { ... }
   |
32 | fn friday_value(value: Int, symbol: String) -> (Int, String) {
   |                                                              ^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [
    friday_value(1000, "M"),
    friday_value(900, "CM"),
    friday_value(500, "D"),
    friday_value(400, "CD"),
    friday_value(100, "C"),
    friday_value(90, "XC"),
    friday_value(50, "L"),
    friday_value(40, "XL"),
    friday_value(10, "X"),
    friday_value(9, "IX"),
    friday_value(5, "V"),
    friday_value(4, "IV"),
    friday_value(1, "I")
  ];

  let result = symbols
    .iter()
    .filter(|(value, _)| n >= *value)
    .map(|(value, symbol)| {
      let count = (n / value).min(3);
      (count, symbol)
    })
    .fold((0, ""), |(count, result), (count, symbol)| {
      (count, result + symbol.repeat(count))
    });

  result.1
}

fn friday_value(value: Int, symbol: String) -> (Int, String) = {
  (value, symbol)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 19:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-1.almd:19:5
   |
19 |     .iter()
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:24:6
   |
24 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:22:24
  in variable value
  hint: Check the variable name
   |
22 |       let count = (n / value).min(3);
   |                        ^^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-1.almd:22:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
22 |       let count = (n / value).min(3);
   |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:23:15
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
23 |       (count, symbol)
   |               ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Unknown, Unknown)
  --> /tmp/dojo-roman-numeral-1.almd:23:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
23 |       (count, symbol)
   |               ^^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [
    friday_value(1000, "M"),
    friday_value(900, "CM"),
    friday_value(500, "D"),
    friday_value(400, "CD"),
    friday_value(100, "C"),
    friday_value(90, "XC"),
    friday_value(50, "L"),
    friday_value(40, "XL"),
    friday_value(10, "X"),
    friday_value(9, "IX"),
    friday_value(5, "V"),
    friday_value(4, "IV"),
    friday_value(1, "I")
  ];

  let result = symbols
    .iter()
    .filter(|(value, _)| n >= value)
    .map(|(value, symbol)| {
      let count = (n / value).min(3);
      (count, symbol)
    })
    .fold((0, ""), |(count, result), (count, symbol)| {
      (count, result + symbol.repeat(count))
    });

  result.1
}

fn friday_value(value: Int, symbol: String) -> (Int, String) = {
  (value, symbol)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 19:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-2.almd:19:5
   |
19 |     .iter()
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:24:6
   |
24 |     })
   |      ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:22:24
  in variable value
  hint: Check the variable name
   |
22 |       let count = (n / value).min(3);
   |                        ^^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-2.almd:22:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
22 |       let count = (n / value).min(3);
   |                        ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:23:15
  in variable symbol
  hint: Did you mean `symbols`?
  try:
      // symbol  →  symbols
      symbols
   |
23 |       (count, symbol)
   |               ^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Unknown, Unknown)
  --> /tmp/dojo-roman-numeral-2.almd:23:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
23 |       (count, symbol)
   |               ^^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let symbols = [
    friday_value(1000, "M"),
    friday_value(900, "CM"),
    friday_value(500, "D"),
    friday_value(400, "CD"),
    friday_value(100, "C"),
    friday_value(90, "XC"),
    friday_value(50, "L"),
    friday_value(40, "XL"),
    friday_value(10, "X"),
    friday_value(9, "IX"),
    friday_value(5, "V"),
    friday_value(4, "IV"),
    friday_value(1, "I")
  ];

  let result = symbols
    .iter()
    .filter(|item| n >= item.0)
    .map(|item| {
      let count = (n / item.0).min(3);
      (count, item.1)
    })
    .fold((0, ""), |(count, result), (count, symbol)| {
      (count, result + symbol.repeat(count))
    });

  result.1
}

fn friday_value(value: Int, symbol: String) -> (Int, String) = {
  (value, symbol)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 19:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-3.almd:19:5
   |
19 |     .iter()
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:24:6
   |
24 |     })
   |      ^
error[E003]: undefined variable 'item'
  --> /tmp/dojo-roman-numeral-3.almd:22:24
  in variable item
  hint: Check the variable name
   |
22 |       let count = (n / item.0).min(3);
   |                        ^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-3.almd:22:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
22 |       let count = (n / item.0).min(3);
   |                        ^^^^
error[E003]: undefined variable 'item'
  --> /tmp/dojo-roman-numeral-3.almd:23:15
  in variable item
  hint: Check the variable name
   |
23 |       (count, item.1)
   |               ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (Unknown, Unknown)
  --> /tmp/dojo-roman-numeral-3.almd:23:15
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
23 |       (count, item.1)
   |               ^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
