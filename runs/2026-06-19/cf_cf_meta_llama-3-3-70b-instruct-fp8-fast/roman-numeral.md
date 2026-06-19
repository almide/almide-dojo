# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let pairs = list.from_list([
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
  ])
  in
  to_roman_helper(n, pairs)

fn to_roman_helper(n: Int, pairs: List[(Int, String)]) -> String = 
  if list.is_empty(pairs) then 
    ""
  else 
    let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
    in
    if n < value then 
      to_roman_helper(n, list.drop(pairs, 1))
    else 
      symbol + to_roman_helper(n - value, pairs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:24:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |     let (value, symbol) = list.first(pairs) |> option.unwrap_or((0, ""))
   |     ^^^
error[E002]: undefined function 'list.from_list'
  --> /tmp/dojo-roman-numeral-0.almd:15:9
  in call to list.from_list()
  hint: No function 'from_list' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
15 |     (1, "I")
   |         ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let pairs = [
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
  to_roman_helper(n, pairs)

fn to_roman_helper(n: Int, pairs: List[(Int, String)]) -> String = 
  if list.is_empty(pairs) then 
    ""
  else 
    let (value, symbol) = list.first(pairs) 
    in
    if n < value then 
      to_roman_helper(n, list.drop(pairs, 1))
    else 
      symbol + to_roman_helper(n - value, pairs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:24:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |     let (value, symbol) = list.first(pairs)
   |     ^^^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let pairs = [
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
  in to_roman_helper(n, pairs)

fn to_roman_helper(n: Int, pairs: List[(Int, String)]) -> String = 
  if list.is_empty(pairs) then 
    ""
  else 
    let first = list.first(pairs) 
    in if n < first.0 then 
      to_roman_helper(n, list.drop(pairs, 1))
    else 
      first.1 + to_roman_helper(n - first.0, pairs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:23:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
23 |     let first = list.first(pairs)
   |     ^^^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let pairs = [
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
    to_roman_helper(n, pairs)

fn to_roman_helper(n: Int, pairs: List[(Int, String)]) -> String = 
  if list.is_empty(pairs) then 
    ""
  else 
    let 
      first = list.first(pairs) 
      |> option.unwrap_or((0, ""))
    in 
      if n < first.0 then 
        to_roman_helper(n, list.drop(pairs, 1))
      else 
        first.1 + to_roman_helper(n - first.0, pairs)
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:24:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |     let
   |     ^^^

1 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
