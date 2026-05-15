# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  if n < 1 || n > 3999 {
    return ""
  }

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

  let result = symbols
    .iter()
    .filter_map(|(value, symbol)| {
      let count = (n / value).min(n % value == 0 ? 1 : 0);
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

```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:3:40
  in call to to_roman()
  hint: Check the function name
  |
3 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:4:40
  in call to to_roman()
  hint: Check the function name
  |
4 | test "to_roman 4" { assert_eq(to_roman(4), "IV") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:5:40
  in call to to_roman()
  hint: Check the function name
  |
5 | test "to_roman 9" { assert_eq(to_roman(9), "IX") }
  |                                        ^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:6:41
  in call to to_roman()
  hint: Check the function name
  |
6 | test "to_roman 14" { assert_eq(to_roman(14), "XIV") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:7:41
  in call to to_roman()
  hint: Check the function name
  |
7 | test "to_roman 42" { assert_eq(to_roman(42), "XLII") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:8:41
  in call to to_roman()
  hint: Check the function name
  |
8 | test "to_roman 99" { assert_eq(to_roman(99), "XCIX") }
  |                                         ^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:9:42
  in call to to_roman()
  hint: Check the function name
  |
9 | test "to_roman 399" { assert_eq(to_roman(399), "CCCXCIX") }
  |                                          ^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:10:42
  in call to to_roman()
  hint: Check the function name
   |
10 | test "to_roman 500" { assert_eq(to_roman(500), "D") }
   |                                          ^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:11:43
  in call to to_roman()
  hint: Check the function name
   |
11 | test "to_roman 1994" { assert_eq(to_roman(1994), "MCMXCIV") }
   |                                           ^^^^
error[E002]: undefined function 'to_roman'
  --> /tmp/dojo-roman-numeral-1.almd:12:43
  in call to to_roman()
  hint: Check the function name
   |
12 | test "to_roman 3999" { assert_eq(to_roman(3999), "MMMCMXCIX") }
   |                                           ^^^^

10 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = string.new();
  for (value, symbol) in values {
    while n >= value {
      result = result + symbol;
      n = n - value;
    }
  }
  result;
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Missing '=' before function body at line 1:31
  --> /tmp/dojo-roman-numeral-2.almd:1:31
  hint: Almide requires '=' before the body. Write: fn to_roman(...) -> Type = { ... }
  |
1 | fn to_roman(n: Int) -> String {
  |                               ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let values = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let result = string.new();
  for (value, symbol) in values {
    while n >= value {
      result = result + symbol;
      n = n - value;
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-3.almd:3:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
  |
3 |   let result = string.new();
  |                          ^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-roman-numeral-3.almd:6:25
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
  |
3 |   let result = string.new();
  |   ---------------------- 'result' declared here
...
6 |       result = result + symbol;
  |                         ^^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-3.almd:7:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
  |
7 |       n = n - value;
  |               ^^^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
