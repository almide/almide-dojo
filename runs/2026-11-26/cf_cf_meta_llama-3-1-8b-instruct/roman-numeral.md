# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

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
  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    while n >= value {
      n -= value;
      acc += symbol;
    }
    acc
  });
  result
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:19:10
  in assignment-in-expr
  here: n -= value;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
19 |       n -= value;
   |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-0.almd:20:12
  in assignment-in-expr
  here: acc += symbol;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
20 |       acc += symbol;
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 23:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-0.almd:23:4
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   });
   |    ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:15:9
  in fn 'to_roman'
  here: (1, "I")
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
FAILED: /tmp/dojo-roman-numeral-0.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 23:4 (got RParen ')')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
  ];
  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    let new_acc = while n >= value {
      n -= value;
      acc + symbol
    };
    new_acc
  });
  result
}
```

**Diagnostic:**

```
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:19:10
  in assignment-in-expr
  here: n -= value;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
19 |       n -= value;
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 23:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:23:4
  here: });
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |   });
   |    ^
error[E003]: undefined variable 'new_acc'
  --> /tmp/dojo-roman-numeral-1.almd:22:5
  in variable new_acc
  here: new_acc
  hint: Check the variable name
   |
22 |     new_acc
   |     ^^^^^^^

3 error(s) found
FAILED: /tmp/dojo-roman-numeral-1.almd
  parse error: Assignments return Unit and can't appear here
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 23:4 (got RParen ')')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
  ];
  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    let new_acc = list.fold(symbols, acc, (acc, (value, symbol)) => {
      if n >= value {
        let new_acc = acc + symbol;
        n -= value;
        new_acc
      } else {
        acc
      }
    });
    new_acc
  });
  result
}
```

**Diagnostic:**

```
error: if requires 'then', not a brace block
  --> /tmp/dojo-roman-numeral-2.almd:19:21
  in if
  here: if n >= value {
  hint: Write `if cond then a else b`. Braces make a block value: `if cond then { … } else { … }`.
  try:
      if x > 0 then 1 else 2
   |
19 |       if n >= value {
   |                     ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-2.almd:21:12
  in assignment-in-expr
  here: n -= value;
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |         n -= value;
   |            ^

2 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
  parse error: if requires 'then', not a brace block
  parse error: Assignments return Unit and can't appear here
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-roman-numeral-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    if n >= value then acc + symbol else acc
  });
  result
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-roman-numeral-3.almd
  test: to_roman 4
  at:   /tmp/dojo-roman-numeral-3.almd:24
  expected: IV
  found:    IVI
  test: to_roman 9
  at:   /tmp/dojo-roman-numeral-3.almd:25
  expected: IX
  found:    IXVIVI
  test: to_roman 14
  at:   /tmp/dojo-roman-numeral-3.almd:26
  expected: XIV
  found:    XIXVIVI
  test: to_roman 42
  at:   /tmp/dojo-roman-numeral-3.almd:27
  expected: XLII
  found:    XLXIXVIVI
  test: to_roman 99
  at:   /tmp/dojo-roman-numeral-3.almd:28
  expected: XCIX
  found:    XCLXLXIXVIVI
  test: to_roman 399
  at:   /tmp/dojo-roman-numeral-3.almd:29
  expected: CCCXCIX
  found:    CXCLXLXIXVIVI
  test: to_roman 500
  at:   /tmp/dojo-roman-numeral-3.almd:30
  expected: D
  found:    DCDCXCLXLXIXVIVI
  test: to_roman 1994
  at:   /tmp/dojo-roman-numeral-3.almd:31
  expected: MCMXCIV
  found:    MCMDCDCXCLXLXIXVIVI
  test: to_roman 3999
  at:   /tmp/dojo-roman-numeral-3.almd:32
  expected: MMMCMXCIX
  found:    MCMDCDCXCLXLXIXVIVI

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
