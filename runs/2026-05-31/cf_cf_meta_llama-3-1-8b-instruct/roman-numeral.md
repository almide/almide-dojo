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
    .iter()
    .filter_map(|(value, symbol)| {
      let count = (n / value).min(3);
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| mtx(count, symbol))
    .collect::<String>();
  result
}

fn mtx(count: Int, symbol: String) -> String {
  if count == 1 {
    symbol
  } else {
    symbol + mtx(count - 1, symbol)
  }
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
error: Missing '=' before function body at line 32:46
  --> /tmp/dojo-roman-numeral-0.almd:32:46
  hint: Almide requires '=' before the body. Write: fn mtx(...) -> Type = { ... }
   |
32 | fn mtx(count: Int, symbol: String) -> String {
   |                                              ^

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
    .iter()
    .filter_map(|(value, symbol)| {
      let count = (n / value).min(3);
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| mtx(count, symbol))
    .collect::<String>();
  result
}

fn mtx(count: Int, symbol: String) -> String = {
  if count == 1 {
    symbol
  } else {
    symbol + mtx(count - 1, symbol)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 18:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-1.almd:18:5
   |
18 |     .iter()
   |     ^
error: Expected Then at line 21:20 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-1.almd:21:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
21 |       if count > 0 {
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:23:9
   |
23 |       } else {
   |         ^
error: Expected Then at line 33:17 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-1.almd:33:17
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
33 |   if count == 1 {
   |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 35:5 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:35:5
   |
35 |   } else {
   |     ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:20:24
  in variable value
  hint: Check the variable name
   |
20 |       let count = (n / value).min(3);
   |                        ^^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-1.almd:20:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
20 |       let count = (n / value).min(3);
   |                        ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:20:24
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |       let count = (n / value).min(3);
   |                        ^^^^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

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
    .iter()
    .filter_map(|(value, symbol)| {
      let count = (n / value).min(3);
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| {
      if count == 1 {
        symbol
      } else {
        symbol + (count - 1) |> list.repeat(symbol) |> string.join("")
      }
    })
    .collect::<string>();
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 18:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-2.almd:18:5
   |
18 |     .iter()
   |     ^
error: Expected Then at line 21:20 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-2.almd:21:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
21 |       if count > 0 {
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:23:9
   |
23 |       } else {
   |         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:20:24
  in variable value
  hint: Check the variable name
   |
20 |       let count = (n / value).min(3);
   |                        ^^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-2.almd:20:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
20 |       let count = (n / value).min(3);
   |                        ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:20:24
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |       let count = (n / value).min(3);
   |                        ^^^^^

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
    .iter()
    .filter_map(|(value, symbol)| {
      let count = (n / value).int.clamp(0, 3);
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| {
      if count == 1 {
        symbol
      } else {
        symbol + (count - 1) |> list.repeat(symbol) |> string.join("")
      }
    })
    .collect::<string>();
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 18:5 (got Dot '.')
  --> /tmp/dojo-roman-numeral-3.almd:18:5
   |
18 |     .iter()
   |     ^
error: Expected Then at line 21:20 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-3.almd:21:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
21 |       if count > 0 {
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:23:9
   |
23 |       } else {
   |         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:20:24
  in variable value
  hint: Check the variable name
   |
20 |       let count = (n / value).int.clamp(0, 3);
   |                        ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:20:24
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
20 |       let count = (n / value).int.clamp(0, 3);
   |                        ^^^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
