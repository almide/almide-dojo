# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
Compiling /tmp/dojo-roman-numeral-0.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:21:15
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |       result += symbol
   |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:22:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
22 |       n -= value
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-0.almd:24:3
   |
24 |   }
   |   ^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-0.almd:18:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
18 |   let result = string.new()
   |                          ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:18:26
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
18 |   let result = string.new()
   |                          ^

5 error(s) found
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
Compiling /tmp/dojo-roman-numeral-1.almd
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-1.almd:18:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
18 |   let result = string.new()
   |                          ^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-roman-numeral-1.almd:21:25
  in result = ...
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
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
22 |       n = n - value
   |               ^^^^^

3 error(s) found
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

// Fix: changed to var result = string.new() to declare a mutable variable
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
    (
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Expected expression at line 40:6 (got Newline '')
  --> /tmp/dojo-roman-numeral-2.almd:40:6
   |
40 |     (
   |      ^
error: Expected expression at line 42:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:42:1
   |
42 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E012]: duplicate function 'to_roman'
  at line 29
  in fn to_roman
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn to_roman(n: Int) -> String = {
   | ----------------------------------- first definition of 'to_roman' here
...
29 | fn to_roman(n: Int) -> String = {
   | ^^^^^^^^^^^
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-2.almd:18:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
18 |   let result = string.new()
   |                          ^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-roman-numeral-2.almd:21:25
  in result = ...
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
  --> /tmp/dojo-roman-numeral-2.almd:22:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
22 |       n = n - value
   |               ^^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:29:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
29 | fn to_roman(n: Int) -> String = {
   |                                 ^

7 error(s) found
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
  ]

  var result = string.new()
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

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E002]: undefined function 'string.new'
  --> /tmp/dojo-roman-numeral-3.almd:18:26
  in call to string.new()
  hint: Did you mean `string.get`?
  try:
      // string.new(...)  →  string.get(...)
      string.get(...)
   |
18 |   var result = string.new()
   |                          ^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
