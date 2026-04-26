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
      let count = (n / value).min(n % value == 0 ? n / value : n / value + 1);
      Some((count, symbol).to_string())
    })
    .collect::<Vec<String>>()
    .join("");
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
      let count = (n / value).min(n % value == 0 ? n / value : n / value + 1);
      Some((count, symbol).to_string())
    })
    .collect::<string>()
    .join("");
  result
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
error: Missing ',' between function arguments at line 20:52
  --> /tmp/dojo-roman-numeral-1.almd:20:52
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
20 |       let count = (n / value).min(n % value == 0 ? n / value : n / value + 1);
   |                                                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:22:6
   |
22 |     })
   |      ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:17:16
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
17 |   let result = symbols
   |                ^^^^^^^

4 error(s) found
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
      let count = (n / value).min(n % value == 0 ? n / value : n / value + 1);
      (count, symbol).to_string()
    })
    .collect::<String>()
    .join("");
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
error: Missing ',' between function arguments at line 20:52
  --> /tmp/dojo-roman-numeral-2.almd:20:52
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
20 |       let count = (n / value).min(n % value == 0 ? n / value : n / value + 1);
   |                                                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:22:6
   |
22 |     })
   |      ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:17:16
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
17 |   let result = symbols
   |                ^^^^^^^

4 error(s) found
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
      let count = (n / value).min(n % value == 0 ? n / value : n / value + 1);
      (count,Unused(symbol)).to_string()
    })
    .collect::<String>()
    .join("");
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
error: Missing ',' between function arguments at line 20:52
  --> /tmp/dojo-roman-numeral-3.almd:20:52
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
20 |       let count = (n / value).min(n % value == 0 ? n / value : n / value + 1);
   |                                                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:6 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:22:6
   |
22 |     })
   |      ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:17:16
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
17 |   let result = symbols
   |                ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
