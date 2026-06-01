# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

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
    ]

    let rec to_roman_helper(n: Int, roman: List[(Int, String)], result: String) -> String =
        if n == 0 then result
        else if list.is_empty(roman) then result
        else
            let (value, symbol) = list.first(roman) |> option.unwrap_or((0, ""))
            let count = n / value
            let new_n = n - count * value
            let new_result = string.repeat(symbol, count) + result
            let new_roman = list.drop(roman, 1)
            to_roman_helper(new_n, new_roman, new_result)

    to_roman_helper(n, roman,
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
fn to_roman(n: Int) -> String = 
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
    ]

    let rec to_roman_helper(n: Int, roman: List[(Int, String)], result: String) -> String =
        if n == 0 then result
        else if list.is_empty(roman) then result
        else
            let (value, symbol) = list.first(roman) |> option.unwrap_or((0, ""))
            let count = n / value
            let new_n = n - count * value
            let new_result = string.repeat(symbol, count) + result
            let new_roman = list.drop(roman, 1)
            to_roman_helper(new_n, new_roman, new_result)

    to_roman_helper(n, roman, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-roman-numeral-1.almd:18:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
18 |     let rec to_roman_helper(n: Int, roman: List[(Int, String)], result: String) -> String =
   |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:22:13
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |             let (value, symbol) = list.first(roman) |> option.unwrap_or((0, ""))
   |             ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:23:29
  in variable value
  hint: Check the variable name
   |
23 |             let count = n / value
   |                             ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:24:37
  in variable value
  hint: Check the variable name
   |
24 |             let new_n = n - count * value
   |                                     ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:25:44
  in variable symbol
  hint: Check the variable name
   |
25 |             let new_result = string.repeat(symbol, count) + result
   |                                            ^^^^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-1.almd:25:61
  in variable result
  hint: Check the variable name
   |
25 |             let new_result = string.repeat(symbol, count) + result
   |                                                             ^^^^^^
error[E002]: undefined function 'to_roman_helper'
  --> /tmp/dojo-roman-numeral-1.almd:27:47
  in call to to_roman_helper()
  hint: Check the function name
   |
27 |             to_roman_helper(new_n, new_roman, new_result)
   |                                               ^^^^^^^^^^
error[E002]: undefined function 'to_roman_helper'
  --> /tmp/dojo-roman-numeral-1.almd:29:31
  in call to to_roman_helper()
  hint: Check the function name
   |
29 |     to_roman_helper(n, roman, "")
   |                               ^^

8 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
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
    ]

    fn to_roman_helper(n: Int, roman: List[(Int, String)], result: String) -> String =
        if n == 0 then result
        else if list.is_empty(roman) then result
        else
            let (value, symbol) = list.first(roman) |> option.unwrap_or((0, ""))
            let count = n / value
            let new_n = n - count * value
            let new_result = string.repeat(symbol, count) + result
            let new_roman = list.drop(roman, 1)
            to_roman_helper(new_n, new_roman, new_result)

    to_roman_helper(n, roman, "")
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:22:13
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |             let (value, symbol) = list.first(roman) |> option.unwrap_or((0, ""))
   |             ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:15:13
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let roman = ...` (a statement, returns Unit).
      // Add `roman` as the trailing expression so the fn returns String:
      //
      //   let roman = <computation>
      //   roman                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
   |
15 |         (1, "I")
   |             ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
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
    ]
    in
    fn to_roman_helper(n: Int, roman: List[(Int, String)], result: String) -> String =
        if n == 0 then result
        else if list.is_empty(roman) then result
        else
            let (value, symbol) = list.first(roman) |> option.unwrap_or((0, ""))
            let count = n / value
            let new_n = n - count * value
            let new_result = string.repeat(symbol, count) + result
            let new_roman = list.drop(roman, 1)
            in to_roman_helper(new_n, new_roman, new_result)
    in to_roman_helper(n, roman
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:22:13
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
22 |             let (value, symbol) = list.first(roman) |> option.unwrap_or((0, ""))
   |             ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:15:13
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let roman = ...` (a statement, returns Unit).
      // Add `roman` as the trailing expression so the fn returns String:
      //
      //   let roman = <computation>
      //   roman                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
   |
15 |         (1, "I")
   |             ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
