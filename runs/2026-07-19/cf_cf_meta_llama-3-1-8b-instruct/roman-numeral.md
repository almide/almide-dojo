# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E009`

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
  ];
  let result = list.fold(symbols, "", (result, pair) => {
    while n >= pair.value {
      result + pair.symbol
      n -= pair.value
    }
    result
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:20:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
20 |       n -= pair.value
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-0.almd:23:4
   |
23 |   });
   |    ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:15:9
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
  let result = "";
  list.fold(symbols, result, (result, pair) => {
    while n >= pair.value {
      result = result + pair.symbol;
      n -= pair.value;
    }
    result
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:21:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |       n -= pair.value;
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:24:4
   |
24 |   });
   |    ^
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
17 |   let result = "";
   |                ^^

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
  ];
  let result = "";
  let (result, n) = list.fold(symbols, (result, n), (acc, pair) => {
    while n >= pair.value {
      acc = acc + pair.symbol;
      n -= pair.value;
    }
    (acc, n)
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-2.almd:21:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |       n -= pair.value;
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 24:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:24:4
   |
24 |   });
   |    ^
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
17 |   let result = "";
   |                ^^

3 error(s) found
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
  let (result, n) = list.fold(symbols, (("", n), n), (acc, pair) => {
    while n >= pair.value {
      acc = (acc + pair.symbol, n - pair.value);
    }
    acc
  });
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error[E009]: cannot reassign immutable binding 'acc'
  --> /tmp/dojo-roman-numeral-3.almd:19:37
  in acc = ...
  hint: Use 'var acc = ...' instead of 'let acc = ...' to declare a mutable variable
  try:
      // let acc = ...  →  var acc = ...
      var acc = <initial value>
   |
19 |       acc = (acc + pair.symbol, n - pair.value);
   |                                     ^^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got (String, Int)
  --> /tmp/dojo-roman-numeral-3.almd:23:3
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
23 |   result
   |   ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
