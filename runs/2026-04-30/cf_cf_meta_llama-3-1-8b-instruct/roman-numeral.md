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
      let count = n / value;
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| {
      let symbol = symbol.to_string();
      let symbol = symbol.repeat(count);
      symbol
    })
    .collect::<String>();

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
      let count = n / value;
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| {
      let symbol = symbol.to_string();
      let symbol = symbol.repeat(count);
      symbol
    })
    .collect::<String>();
  result
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
error: Expected Then at line 22:20 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-1.almd:22:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
22 |       if count > 0 {
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:24:9
   |
24 |       } else {
   |         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:21:23
  in variable value
  hint: Check the variable name
   |
21 |       let count = n / value;
   |                       ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:21:23
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
21 |       let count = n / value;
   |                       ^^^^^

5 error(s) found
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
    .filter_map(|pair| {
      let (value, symbol) = pair;
      let count = n / value;
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| {
      let symbol = symbol.to_string();
      let symbol = symbol.repeat(count);
      symbol
    })
    .collect::<String>();
  result
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
error: Expected Then at line 23:20 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-2.almd:23:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
23 |       if count > 0 {
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 25:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:25:9
   |
25 |       } else {
   |         ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-2.almd:21:29
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
21 |       let (value, symbol) = pair;
   |                             ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:22:23
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
22 |       let count = n / value;
   |                       ^^^^^

5 error(s) found
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
      let count = n / value;
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| {
      let symbol = symbol.to_string();
      let symbol = symbol.repeat(count);
      symbol
    })
    .collect::<String>();
  result
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
error: Expected Then at line 22:20 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-3.almd:22:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
22 |       if count > 0 {
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:24:9
   |
24 |       } else {
   |         ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:21:23
  in variable value
  hint: Check the variable name
   |
21 |       let count = n / value;
   |                       ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:21:23
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
21 |       let count = n / value;
   |                       ^^^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
