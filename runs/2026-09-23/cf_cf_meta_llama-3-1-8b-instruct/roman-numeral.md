# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, remainder) = (n / 1000, n % 1000)
  let (hundreds, remainder) = (remainder / 100, remainder % 100)
  let (tens, remainder) = (remainder / 10, remainder % 10)
  let (ones, _) = (remainder, remainder % 1)

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

  let result = (
    if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
  )

  match symbols {
    some((value, symbol)) => if value <= hundreds then result ^ symbol else result ^ (hundreds - value) * symbol
    none => result
  }
}
```

**Diagnostic:**

```
error: operator '^' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-0.almd:24:46
  in operator ^
  here: if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
  hint: Use numeric types (Int or Float)
   |
24 |     if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
   |                                              ^
error: operator '^' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-0.almd:24:69
  in operator ^
  here: if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
  hint: Use numeric types (Int or Float)
   |
24 |     if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
   |                                                                     ^
error: operator '*' requires numeric types but got String and String
  --> /tmp/dojo-roman-numeral-0.almd:24:69
  in operator *
  here: if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
  hint: Use numeric types (Int or Float)
   |
24 |     if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
   |                                                                     ^
error: operator '^' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-0.almd:24:88
  in operator ^
  here: if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
  hint: Use numeric types (Int or Float)
   |
24 |     if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
   |                                                                                        ^
error: operator '*' requires numeric types but got String and String
  --> /tmp/dojo-roman-numeral-0.almd:24:88
  in operator *
  here: if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
  hint: Use numeric types (Int or Float)
   |
24 |     if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
   |                                                                                        ^
error: operator '^' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-0.almd:24:107
  in operator ^
  here: if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
  hint: Use numeric types (Int or Float)
   |
24 |     if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
   |                                                                                                           ^
error: operator '*' requires numeric types but got String and String
  --> /tmp/dojo-roman-numeral-0.almd:24:107
  in operator *
  here: if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
  hint: Use numeric types (Int or Float)
   |
24 |     if thousands > 0 then "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1) else ""
   |                                                                                                           ^
error: operator '^' requires numeric types but got String and Unknown
  --> /tmp/dojo-roman-numeral-0.almd:28:65
  in operator ^
  here: some((value, symbol)) => if value <= hundreds then result ^ symbol else result ^ (hundreds - value) * symbol
  hint: Use numeric types (Int or Float)
   |
28 |     some((value, symbol)) => if value <= hundreds then result ^ symbol else result ^ (hundreds - value) * symbol
   |                                                                 ^^^^^^
error: operator '^' requires numeric types but got String and Int
  --> /tmp/dojo-roman-numeral-0.almd:28:98
  in operator ^
  here: some((value, symbol)) => if value <= hundreds then result ^ symbol else result ^ (hundreds - value) * symbol
  hint: Use numeric types (Int or Float)
   |
28 |     some((value, symbol)) => if value <= hundreds then result ^ symbol else result ^ (hundreds - value) * symbol
   |                                                                                                  ^^^^^
error: operator '*' requires numeric types but got String and Unknown
  --> /tmp/dojo-roman-numeral-0.almd:28:107
  in operator *
  here: some((value, symbol)) => if value <= hundreds then result ^ symbol else result ^ (hundreds - value) * symbol
  hint: Use numeric types (Int or Float)
   |
28 |     some((value, symbol)) => if value <= hundreds then result ^ symbol else result ^ (hundreds - value) * symbol
   |                                                                                                           ^^^^^^

10 error(s) found
FAILED: /tmp/dojo-roman-numeral-0.almd
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, remainder) = (n / 1000, n % 1000)
  let (hundreds, remainder) = (remainder / 100, remainder % 100)
  let (tens, remainder) = (remainder / 10, remainder % 10)
  let (ones, _) = (remainder, remainder % 1)

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

  let result = ""

  if thousands > 0 then result := result ^ "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1)
  else result := result

  match symbols {
    some((value, symbol)) => if value <= hundreds then result := result ^ symbol else result := result ^ (hundreds - value) * symbol
    none => result := result
  }

  result
}
```

**Diagnostic:**

```
error: Expected expression at line 25:32 (got Colon ':')
  --> /tmp/dojo-roman-numeral-1.almd:25:32
  here: if thousands > 0 then result := result ^ "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
25 |   if thousands > 0 then result := result ^ "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1)
   |                                ^
error: Expected pattern at line 29:63 (got Colon ':')
  --> /tmp/dojo-roman-numeral-1.almd:29:63
  here: some((value, symbol)) => if value <= hundreds then result := result ^ symbol else result := result ^ (hundreds - value) * symbol
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
29 |     some((value, symbol)) => if value <= hundreds then result := result ^ symbol else result := result ^ (hundreds - value) * symbol
   |                                                               ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 33:3 (got Ident 'result')
  --> /tmp/dojo-roman-numeral-1.almd:33:3
  here: result
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
33 |   result
   |   ^
error[E001]: type mismatch in if branches: expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:25:3
  in if branches
  here: if thousands > 0 then result := result ^ "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1)
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce String. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: String) -> String = if cond then step(<update>) else x
   |
25 |   if thousands > 0 then result := result ^ "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1)
   |   ^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-1.almd:25:3
  in fn 'to_roman'
  here: if thousands > 0 then result := result ^ "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
25 |   if thousands > 0 then result := result ^ "M" ^ (thousands - 1) * "C" ^ (hundreds - 1) * "X" ^ (tens - 1) * "I" ^ (ones - 1)
   |   ^^

5 error(s) found
FAILED: /tmp/dojo-roman-numeral-1.almd
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, remainder) = (n / 1000, n % 1000)
  let (hundreds, remainder) = (remainder / 100, remainder % 100)
  let (tens, remainder) = (remainder / 10, remainder % 10)
  let (ones, _) = (remainder, remainder % 1)

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

  let result = ""

  if thousands > 0 then {
    let count = thousands - 1
    result := result ^ "M" ^ (count * "C") ^ (hundreds * "X") ^ (tens * "I") ^ (ones * "I")
  }

  match symbols {
    some((value, symbol)) => if value <= hundreds then result := result ^ symbol else result := result ^ (hundreds - value) * symbol
    none => result := result
  }

  result
}
```

**Diagnostic:**

```
error: Expected expression at line 27:12 (got Colon ':')
  --> /tmp/dojo-roman-numeral-2.almd:27:12
  here: result := result ^ "M" ^ (count * "C") ^ (hundreds * "X") ^ (tens * "I") ^ (ones * "I")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
27 |     result := result ^ "M" ^ (count * "C") ^ (hundreds * "X") ^ (tens * "I") ^ (ones * "I")
   |            ^
error: Expected pattern at line 31:63 (got Colon ':')
  --> /tmp/dojo-roman-numeral-2.almd:31:63
  here: some((value, symbol)) => if value <= hundreds then result := result ^ symbol else result := result ^ (hundreds - value) * symbol
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     some((value, symbol)) => if value <= hundreds then result := result ^ symbol else result := result ^ (hundreds - value) * symbol
   |                                                               ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 35:3 (got Ident 'result')
  --> /tmp/dojo-roman-numeral-2.almd:35:3
  here: result
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
35 |   result
   |   ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:25:3
  in fn 'to_roman'
  here: if thousands > 0 then {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
25 |   if thousands > 0 then {
   |   ^^

4 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = {
  let (thousands, remainder) = (n / 1000, n % 1000)
  let (hundreds, remainder) = (remainder / 100, remainder % 100)
  let (tens, remainder) = (remainder / 10, remainder % 10)
  let (ones, _) = (remainder, remainder % 1)

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

  let result = ""

  if thousands > 0 then {
    let count = thousands - 1
    result := result ^ "M" ^ (count * "C") ^ (hundreds * "X") ^ (tens * "I") ^ (ones * "I")
  }

  match symbols {
    some((value, symbol)) => if value <= hundreds then result := result ^ symbol else result := result ^ (hundreds - value) * symbol
    none => result := result
  }

  if hundreds > 0 then {
    let count = hundreds - 1
    result := result ^ (if count > 0 then count * "C" else "")
  }

  if tens > 0 then {
    let count = tens - 1
    result := result ^ (if count > 0 then count * "X" else "")
  }

  if ones > 0 then {
    let count = ones - 1
    result := result ^ (if count > 0 then count * "I" else "")
  }

  result
}
```

**Diagnostic:**

```
error: Expected expression at line 27:12 (got Colon ':')
  --> /tmp/dojo-roman-numeral-3.almd:27:12
  here: result := result ^ "M" ^ (count * "C") ^ (hundreds * "X") ^ (tens * "I") ^ (ones * "I")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
27 |     result := result ^ "M" ^ (count * "C") ^ (hundreds * "X") ^ (tens * "I") ^ (ones * "I")
   |            ^
error: Expected pattern at line 31:63 (got Colon ':')
  --> /tmp/dojo-roman-numeral-3.almd:31:63
  here: some((value, symbol)) => if value <= hundreds then result := result ^ symbol else result := result ^ (hundreds - value) * symbol
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
31 |     some((value, symbol)) => if value <= hundreds then result := result ^ symbol else result := result ^ (hundreds - value) * symbol
   |                                                               ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 35:3 (got If 'if')
  --> /tmp/dojo-roman-numeral-3.almd:35:3
  here: if hundreds > 0 then {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
35 |   if hundreds > 0 then {
   |   ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:25:3
  in fn 'to_roman'
  here: if thousands > 0 then {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
   |
25 |   if thousands > 0 then {
   |   ^^

4 error(s) found
FAILED: /tmp/dojo-roman-numeral-3.almd
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
