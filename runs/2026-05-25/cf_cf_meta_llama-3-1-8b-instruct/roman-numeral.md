# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
  let values = [
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
  let result = list.fold(values, "", (acc, (value, symbol)) => {
    while n >= value {
      n -= value
      acc += symbol
    }
    acc
  })
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
  let values = [
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
  let result = list.fold(values, "", (acc, (value, symbol)) => {
    while n >= value {
      n -= value
      acc += symbol
    }
    acc
  })
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:19:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
19 |       n -= value
   |          ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-1.almd:20:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
20 |       acc += symbol
   |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-1.almd:23:4
   |
23 |   })
   |    ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:15:9
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
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let values = [
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
  let result = list.fold(values, "", (acc, (value, symbol)) => {
    let new_acc = list.fold(values, acc, (acc, (value, symbol)) => {
      while n >= value {
        n -= value
        acc += symbol
      }
      acc
    })
    new_acc
  })
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-2.almd:20:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
20 |         n -= value
   |            ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-2.almd:21:14
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |         acc += symbol
   |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 26:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-2.almd:26:4
   |
26 |   })
   |    ^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(?0, ?1) -> Unit
  --> /tmp/dojo-roman-numeral-2.almd:17:64
  in call to list.fold()
  hint: Fix the argument type
   |
17 |   let result = list.fold(values, "", (acc, (value, symbol)) => {
   |                                                                ^
error[E003]: undefined variable 'new_acc'
  --> /tmp/dojo-roman-numeral-2.almd:25:5
  in variable new_acc
  hint: Check the variable name
   |
25 |     new_acc
   |     ^^^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, (Int, String)) -> Unit
  --> /tmp/dojo-roman-numeral-2.almd:17:64
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
17 |   let result = list.fold(values, "", (acc, (value, symbol)) => {
   |                                                                ^

6 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let values = [
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
  let result = list.fold(values, "", (acc, (value, symbol)) => {
    let new_acc = list.fold(values, acc, (acc, (value, symbol)) => {
      while n >= value {
        n -= value
        acc += symbol
      }
      acc
    })
    new_acc
  })
  result
}

// Corrected Almide source:
fn to_roman(n: Int) -> String = {
  let values = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50,
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-3.almd:20:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
20 |         n -= value
   |            ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-roman-numeral-3.almd:21:14
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
21 |         acc += symbol
   |              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 26:4 (got RParen ')')
  --> /tmp/dojo-roman-numeral-3.almd:26:4
   |
26 |   })
   |    ^
error: Expected expression at line 39:9 (got Newline '')
  --> /tmp/dojo-roman-numeral-3.almd:39:9
   |
39 |     (50,
   |         ^
error: Expected expression at line 41:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-3.almd:41:1
   |
41 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
   | ^
error[E012]: duplicate function 'to_roman'
  at line 31
  in fn to_roman
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn to_roman(n: Int) -> String = {
   | ----------------------------------- first definition of 'to_roman' here
...
31 | fn to_roman(n: Int) -> String = {
   | ^^^^^^^^^^^
error[E005]: argument 'f' expects fn(String, (Int, String)) -> String but got fn(?0, ?1) -> Unit
  --> /tmp/dojo-roman-numeral-3.almd:17:64
  in call to list.fold()
  hint: Fix the argument type
   |
17 |   let result = list.fold(values, "", (acc, (value, symbol)) => {
   |                                                                ^
error[E003]: undefined variable 'new_acc'
  --> /tmp/dojo-roman-numeral-3.almd:25:5
  in variable new_acc
  hint: Check the variable name
   |
25 |     new_acc
   |     ^^^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(String, (Int, String)) -> String but got fn(String, (Int, String)) -> Unit
  --> /tmp/dojo-roman-numeral-3.almd:17:64
  in call to list.fold()
  hint: Fix the expression type or change the expected type
   |
17 |   let result = list.fold(values, "", (acc, (value, symbol)) => {
   |                                                                ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:31:33
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
31 | fn to_roman(n: Int) -> String = {
   |                                 ^

10 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
