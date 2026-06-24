# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let (thousands, rest) = (n / 1000, n % 1000)
  let (hundreds, rest) = (rest / 100, rest % 100)
  let (tens, ones) = (rest / 10, rest % 10)

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
  ]

  let result = [
    if thousands > 0 { string.repeat("M", thousands) } else { "" },
    if hundreds > 0 { string.repeat("C", hundreds) } else { "" },
    if tens > 0 { string.repeat("X", tens) } else { "" },
    if ones > 0 { string.repeat("I", ones) } else { "" },
    if thousands
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
  let (thousands, rest) = (n / 1000, n % 1000)
  let (hundreds, rest) = (rest / 100, rest % 100)
  let (tens, ones) = (rest / 10, rest % 10)

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
  ]

  let result = [
    if thousands > 0 { string.repeat("M", thousands) } else { "" },
    if hundreds > 0 { string.repeat("C", hundreds) } else { "" },
    if tens > 0 { string.repeat("X", tens) } else { "" },
    if ones > 0 { string.repeat("I", ones) } else { "" }
  ]
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected Then at line 23:22 (got LBrace '{')
  --> /tmp/dojo-roman-numeral-1.almd:23:22
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
23 |     if thousands > 0 { string.repeat("M", thousands) } else { "" },
   |                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:56 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:23:56
   |
23 |     if thousands > 0 { string.repeat("M", thousands) } else { "" },
   |                                                        ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:19:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
19 |     (1, "I")
   |         ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, rest) = (n / 1000, n % 1000)
  let (hundreds, rest) = (rest / 100, rest % 100)
  let (tens, ones) = (rest / 10, rest % 10)

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
  ]

  let result = [
    if thousands > 0 then string.repeat("M", thousands) else "",
    if hundreds > 0 then string.repeat("C", hundreds) else "",
    if tens > 0 then string.repeat("X", tens) else "",
    if ones > 0 then string.repeat("I", ones) else ""
  ]

  let final_result = list.join(result, "")
  final
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:32:1
   |
32 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E003]: undefined variable 'final'
  --> /tmp/dojo-roman-numeral-2.almd:30:3
  in variable final
  hint: Check the variable name
   |
30 |   final
   |   ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:30:3
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
30 |   final
   |   ^^^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, rest) = (n / 1000, n % 1000)
  let (hundreds, rest) = (rest / 100, rest % 100)
  let (tens, ones) = (rest / 10, rest % 10)

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
  ]

  let result = [
    if thousands > 0 then string.repeat("M", thousands) else "",
    if hundreds > 0 then string.repeat("C", hundreds) else "",
    if tens > 0 then string.repeat("X", tens) else "",
    if ones > 0 then string.repeat("I", ones) else ""
  ]

  let final_result = list.join(result, "")
  final
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 32:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-3.almd:32:1
   |
32 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E003]: undefined variable 'final'
  --> /tmp/dojo-roman-numeral-3.almd:30:3
  in variable final
  hint: Check the variable name
   |
30 |   final
   |   ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:30:3
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
30 |   final
   |   ^^^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
