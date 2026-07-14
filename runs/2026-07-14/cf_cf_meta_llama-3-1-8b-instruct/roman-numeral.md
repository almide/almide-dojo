# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E009`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let roman = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let mut s = "";
  for (value, symbol) in roman {
    while n >= value {
      s += symbol;
      n -= value;
    }
  }
  s
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
  let roman = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  let mut s = "";
  for (value, symbol) in roman {
    while n >= value {
      s += symbol;
      n -= value;
    }
  }
  s
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let mut' is not valid in Almide at line 3:7
  --> /tmp/dojo-roman-numeral-1.almd:3:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |   let mut s = "";
  |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:6:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
6 |       s += symbol;
  |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:7:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |       n -= value;
  |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-1.almd:9:3
  |
9 |   }
  |   ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:2:161
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
2 |   let roman = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  |                                                                                                                                                                 ^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let roman = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  var s = "";
  for (value, symbol) in roman {
    while n >= value {
      s = s + symbol;
      n = n - value;
    }
  }
  s
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-2.almd:7:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
  |
7 |       n = n - value;
  |               ^^^^^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let roman = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")];
  var s = "";
  for (value, symbol) in roman {
    let n_ = n;
    while n_ >= value {
      s = s + symbol;
      n_ = n_ - value;
    }
  }
  s
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E009]: cannot reassign immutable binding 'n_'
  --> /tmp/dojo-roman-numeral-3.almd:8:17
  in n_ = ...
  hint: Use 'var n_ = ...' instead of 'let n_ = ...' to declare a mutable variable
  try:
      // let n_ = ...  →  var n_ = ...
      var n_ = <initial value>
  |
5 |     let n_ = n;
  |     ------------------ 'n_' declared here
...
8 |       n_ = n_ - value;
  |                 ^^^^^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
