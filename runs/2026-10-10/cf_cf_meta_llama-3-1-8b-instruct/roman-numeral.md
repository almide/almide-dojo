# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

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
  ]

  let result = string.new()
  for (value, symbol) in symbols {
    while n >= value {
      result += symbol
      n -= value
    }
  }
  result
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:21:15
  in assignment-in-expr
  here: result += symbol
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |       result += symbol
   |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:22:10
  in assignment-in-expr
  here: n -= value
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
22 |       n -= value
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 24:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-0.almd:24:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
24 |   }
   |   ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-0.almd:18:16
  in call to string.new()
  here: let result = string.new()
  hint: Did you mean `string.get`?
  try:
      string.get
   |
18 |   let result = string.new()
   |                ^^^^^^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:18:16
  in fn 'to_roman'
  here: let result = string.new()
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
18 |   let result = string.new()
   |                ^^^^^^^^^^^^

5 error(s) found
FAILED: /tmp/dojo-roman-numeral-0.almd
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
  ]

  let result = string.new()
  for (value, symbol) in symbols {
    while n >= value {
      result = result + symbol
      n = n - value
    }
  }
  result
}
```

**Diagnostic:**

```
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-1.almd:18:16
  in call to string.new()
  here: let result = string.new()
  hint: Did you mean `string.get`?
  try:
      string.get
   |
18 |   let result = string.new()
   |                ^^^^^^^^^^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-roman-numeral-1.almd:21:25
  in result = ...
  here: result = result + symbol
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
   |
18 |   let result = string.new()
   |   ---------------------- 'result' declared here
...
21 |       result = result + symbol
   |                         ^^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-1.almd:22:15
  in n = ...
  here: n = n - value
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
22 |       n = n - value
   |               ^^^^^

3 error(s) found
FAILED: /tmp/dojo-roman-numeral-1.almd
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
  ]

  var result = string.new()
  for (value, symbol) in symbols {
    while n >= value {
      result = result + symbol
      n = n - value
    }
  }
  result
}
```

**Diagnostic:**

```
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-2.almd:18:16
  in call to string.new()
  here: var result = string.new()
  hint: Did you mean `string.get`?
  try:
      string.get
   |
18 |   var result = string.new()
   |                ^^^^^^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-2.almd:22:15
  in n = ...
  here: n = n - value
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
22 |       n = n - value
   |               ^^^^^

2 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

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
  ]

  var result = ""
  var n_ = n
  for (value, symbol) in symbols {
    while n_ >= value {
      result = result + symbol
      n_ = n_ - value
    }
  }
  result
}
```
