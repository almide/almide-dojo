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
      let count = (n / value).min(9);
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| symbol.repeat(count))
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
      let count = (n / value).min(9);
      if count > 0 {
        Some((count, symbol))
      } else {
        None
      }
    })
    .map(|(count, symbol)| symbol.repeat(count))
    .collect::<String>()
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
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:20:24
  in variable value
  hint: Check the variable name
   |
20 |       let count = (n / value).min(9);
   |                        ^^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-1.almd:20:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
20 |       let count = (n / value).min(9);
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
20 |       let count = (n / value).min(9);
   |                        ^^^^^

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
      let count = (n / value).min(9);
      if count > 0 {
        Some(symbol.repeat(count))
      } else {
        None
      }
    })
    .collect::<List<String>>()
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
error: Expected Then at line 22:20 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-2.almd:22:20
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
22 |       if count > 0 {
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:24:9
   |
24 |       } else {
   |         ^
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-2.almd:20:29
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
20 |       let (value, symbol) = pair;
   |                             ^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-2.almd:21:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
21 |       let count = (n / value).min(9);
   |                        ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:21:24
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
21 |       let count = (n / value).min(9);
   |                        ^^^^^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> Stringvariants = {
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
    .map(|pair| {
      let (value, symbol) = pair;
      let count = (n / value).min(9);
      if count > 0 {
        symbol.repeat(count)
      } else {
        ""
      }
    })
    .collect::<List<String>>()
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
error[E003]: undefined variable 'pair'
  --> /tmp/dojo-roman-numeral-3.almd:20:29
  in variable pair
  hint: Did you mean `panic`?
  try:
      // pair  →  panic
      panic
   |
20 |       let (value, symbol) = pair;
   |                             ^^^^
error[E002]: undefined method 'min' on int
  --> /tmp/dojo-roman-numeral-3.almd:21:24
  in method call .min()
  hint: Almide doesn't use method-call syntax. Write `int.max(x)` (or `x |> int.max`). Method syntax `x.min()` is not supported.
  try:
      // x.min()  →  int.max(x)
      int.max(x)
   |
21 |       let count = (n / value).min(9);
   |                        ^^^^^
error[E001]: type mismatch in call to assert_eq(): expected Stringvariants but got String
  --> /tmp/dojo-roman-numeral-3.almd:33:44
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
33 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   |                                            ^^^
error[E001]: type mismatch in call to assert_eq(): expected Stringvariants but got String
  --> /tmp/dojo-roman-numeral-3.almd:34:44
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
34 | test "to_roman 4" { assert_eq(to_roman(4), "IV") }
   |                                            ^^^^
error[E001]: type mismatch in call to assert_eq(): expected Stringvariants but got String
  --> /tmp/dojo-roman-numeral-3.almd:35:44
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
35 | test "to_roman 9" { assert_eq(to_roman(9), "IX") }
   |                                            ^^^^
error[E001]: type mismatch in call to assert_eq(): expected Stringvariants but got String
  --> /tmp/dojo-roman-numeral-3.almd:36:46
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
36 | test "to_roman 14" { assert_eq(to_roman(14), "XIV") }
   |                                              ^^^^^
error[E001]: type mismatch in call to assert_eq(): expected Stringvariants but got String
  --> /tmp/dojo-roman-numeral-3.almd:37:46
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
37 | test "to_roman 42" { assert_eq(to_roman(42), "XLII") }
   |                                              ^^^^^^
error[E001]: type mismatch in call to assert_eq(): expected Stringvariants but got String
  --> /tmp/dojo-roman-numeral-3.almd:38:46
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
38 | test "to_roman 99" { assert_eq(to_roman(99), "XCIX") }
   |                                              ^^^^^^
error[E001]: type mismatch in call to assert_eq(): expected Stringvariants but got String
  --> /tmp/dojo-roman-numeral-3.almd:39:48
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
39 | test "to_roman 399" { assert_eq(to_roman(399), "CCCXCIX") }
   |                                                ^^^^^^^^^
error[E001]: type mismatch in call to assert_eq(): expected Stringvariants but got String
  --> /tmp/dojo-roman-numeral-3.almd:40:48
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
40 | test "to_roman 500" { assert_eq(to_roman(500), "D") }
   |                                                ^^^
error[E001]: type mismatch in call to assert_eq(): expected Stringvariants but got String
  --> /tmp/dojo-roman-numeral-3.almd:41:50
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
41 | test "to_roman 1994" { assert_eq(to_roman(1994), "MCMXCIV") }
   |                                                  ^^^^^^^^^
error[E001]: type mismatch in call to assert_eq(): expected Stringvariants but got String
  --> /tmp/dojo-roman-numeral-3.almd:42:50
  in call to assert_eq()
  hint: Fix the expression type or change the expected type
   |
42 | test "to_roman 3999" { assert_eq(to_roman(3999), "MMMCMXCIX") }
   |                                                  ^^^^^^^^^^^

15 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
