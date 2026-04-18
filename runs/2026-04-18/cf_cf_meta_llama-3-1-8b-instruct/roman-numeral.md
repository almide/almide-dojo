# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let roman = [
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
  let result = String::new();
  for (value, symbol) in roman {
    while n >= value {
      result += symbol;
      n -= value;
    }
  }
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
  let roman = [
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
  let result = String::new();
  for (value, symbol) in roman {
    while n >= value {
      result += symbol;
      n -= value;
    }
  }
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: '::' is not valid in Almide at line 17:22
  --> /tmp/dojo-roman-numeral-1.almd:17:22
  hint: Almide uses '.' for module access, not '::'. Write `list.map(...)` instead of `list::map(...)`
   |
17 |   let result = String::new();
   |                      ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:20:15
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
20 |       result += symbol;
   |               ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:21:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |       n -= value;
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-1.almd:23:3
   |
23 |   }
   |   ^
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
17 |   let result = String::new();
   |                ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let roman = [
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
  let result = "";
  for (value, symbol) in roman {
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
Compiling /tmp/dojo-roman-numeral-2.almd
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-roman-numeral-2.almd:20:25
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
   |
17 |   let result = "";
   |   ---------------------- 'result' declared here
...
20 |       result = result + symbol;
   |                         ^^^^^^
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-2.almd:21:15
  in n = ...
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
21 |       n = n - value;
   |               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn to_roman(n: Int) -> String = {
  let roman = [
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
  var result = "";
  var n_ = n;
  for (value, symbol) in roman {
    while n_ >= value {
      result = result + symbol;
      n_ = n_ - value;
    }
  }
  result
}
```
