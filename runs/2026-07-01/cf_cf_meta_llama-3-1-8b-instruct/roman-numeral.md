# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let roman_numerals = [
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

  let roman = match list.find_index(roman_numerals, (fn(x) => x.0 > n)) {
    some(i) => {
      let (value, symbol) = roman_numerals[i]
      let remaining = n - value
      symbol + to_roman(remaining)
    }
    none => ""
  }

  roman
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Expected expression at line 18:54 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-0.almd:18:54
   |
18 |   let roman = match list.find_index(roman_numerals, (fn(x) => x.0 > n)) {
   |                                                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:5 (got None 'none')
  --> /tmp/dojo-roman-numeral-0.almd:24:5
   |
24 |     none => ""
   |     ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-0.almd:20:44
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
20 |       let (value, symbol) = roman_numerals[i]
   |                                            ^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let roman_numerals = [
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

  let roman = match list.find_index(roman_numerals, (fn(x) => x.0 > n)) {
    some(i) => {
      let (value, symbol) = roman_numerals[i]
      let remaining = n - value
      symbol + to_roman(remaining)
    }
    none => {
      match n {
        0 => ""
        1 => "I"
        4 => "IV"
        5 => "V"
        9 => "IX"
        10 => "X"
        40 => "XL"
        50 => "L"
        90 => "XC"
        100 => "C"
        400 =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Expected expression at line 18:54 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-1.almd:18:54
   |
18 |   let roman = match list.find_index(roman_numerals, (fn(x) => x.0 > n)) {
   |                                                      ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:5 (got None 'none')
  --> /tmp/dojo-roman-numeral-1.almd:24:5
   |
24 |     none => {
   |     ^
error[E003]: undefined variable 'i'
  --> /tmp/dojo-roman-numeral-1.almd:20:44
  in variable i
  hint: Did you mean `n`?
  try:
      // i  →  n
      n
   |
20 |       let (value, symbol) = roman_numerals[i]
   |                                            ^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let roman_numerals = [
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

  let index = list.find_index(roman_numerals, (fn(x) => x.0 > n))
  match index {
    some(i) => {
      let (value, symbol) = roman_numerals[i]
      let remaining = n - value
      symbol + to_roman(remaining)
    }
    none => {
      match n {
        0 => ""
        1 => "I"
        4 => "IV"
        5 => "V"
        9 => "IX"
        10 => "X"
        40 => "XL"
        50 => "L"
        90 => "XC"
        100 => "C"
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 18:48 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-2.almd:18:48
   |
18 |   let index = list.find_index(roman_numerals, (fn(x) => x.0 > n))
   |                                                ^
error: Expected pattern at line 38:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:38:1
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
38 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |     (1, "I")
   |         ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let roman_numerals = [
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

  let index = list.find_index(roman_numerals, (fn(x) => x.0 > n))
  match index {
    some(i) => {
      let (value, symbol) = roman_numerals[i]
      let remaining = n - value
      symbol + to_roman(remaining)
    }
    none => {
      match n {
        0 => ""
        1 => "I"
        4 => "IV"
        5 => "V"
        9 => "IX"
        10 => "X"
        40 => "XL"
        50 => "L"
        90 => "XC"
        100 => "C"
        _
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Expected expression at line 18:48 (got Fn 'fn')
  --> /tmp/dojo-roman-numeral-3.almd:18:48
   |
18 |   let index = list.find_index(roman_numerals, (fn(x) => x.0 > n))
   |                                                ^
error: Expected FatArrow at line 37:10 (got Newline '')
  --> /tmp/dojo-roman-numeral-3.almd:37:10
   |
37 |         _
   |          ^
error: Expected expression at line 39:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-3.almd:39:1
   |
39 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
15 |     (1, "I")
   |         ^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
