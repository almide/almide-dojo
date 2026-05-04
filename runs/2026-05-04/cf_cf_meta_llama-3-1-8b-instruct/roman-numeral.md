# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let numerals = [
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
  let romans = String.new();
  for (value, symbol) in numerals {
    while n >= value {
      romans.append(symbol);
      n -= value;
    }
  }
  romans
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
  let numerals = [
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
  let romans = String.new();
  for (value, symbol) in numerals {
    while n >= value {
      romans.append(symbol);
      n -= value;
    }
  }
  romans
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
21 |       n -= value;
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-1.almd:23:3
   |
23 |   }
   |   ^
error[E001]: type mismatch in method call: expected String but got fn() -> ?0
  --> /tmp/dojo-roman-numeral-1.almd:17:16
  in method call
  hint: Fix the expression type or change the expected type
   |
17 |   let romans = String.new();
   |                ^^^^^^
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
17 |   let romans = String.new();
   |                ^^^^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let numerals = [
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
  let romans = String.new();
  for (value, symbol) in numerals {
    while n >= value {
      romans.append(symbol);
      n -= value;
    }
  }
  romans.to_string()
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
21 |       n -= value;
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-2.almd:23:3
   |
23 |   }
   |   ^
error[E001]: type mismatch in method call: expected String but got fn() -> ?0
  --> /tmp/dojo-roman-numeral-2.almd:17:16
  in method call
  hint: Fix the expression type or change the expected type
   |
17 |   let romans = String.new();
   |                ^^^^^^
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
17 |   let romans = String.new();
   |                ^^^^^^

4 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let numerals = [
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
  let mut romans = String.new();
  for (value, symbol) in numerals {
    while n >= value {
      romans.append(symbol);
      n -= value;
    }
  }
  romans
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let mut' is not valid in Almide at line 17:7
  --> /tmp/dojo-roman-numeral-3.almd:17:7
  hint: Use 'var' for mutable variables. Example: var x = 0
   |
17 |   let mut romans = String.new();
   |       ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-3.almd:21:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |       n -= value;
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-3.almd:23:3
   |
23 |   }
   |   ^
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
