# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String {
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
  let result = symbols
    |> list.filter((pair) => n >= pair.0)
    |> list.map((pair) => let count = n / pair.0; count.to_string() + pair.1)
    |> list.join("")
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
  let result = symbols
    |> list.filter((pair) => n >= pair.0)
    |> list.map((pair) => let count = n / pair.0; count.to_string() + pair.1)
    |> list.join("")
  result
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:19:27
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
19 |     |> list.map((pair) => let count = n / pair.0; count.to_string() + pair.1)
   |                           ^^^
error[E003]: undefined variable 'result'
  --> /tmp/dojo-roman-numeral-1.almd:21:3
  in variable result
  hint: Check the variable name
   |
21 |   result
   |   ^^^^^^

2 error(s) found
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
  symbols
    |> list.filter((pair) => n >= pair.0)
    |> list.map((pair) => let count = n / pair.0; count.to_string() + pair.1)
    |> list.reduce((acc, item) => acc + item, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:19:27
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
19 |     |> list.map((pair) => let count = n / pair.0; count.to_string() + pair.1)
   |                           ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
15 |     (1, "I")
   |         ^^^

2 error(s) found
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
  symbols
    |> list.filter((pair) => n >= pair.0)
    |> list.map((pair) => let count = n / pair.0; (count.to_string() + pair.1))
    |> list.reduce((acc, item) => acc + item, "")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:19:27
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
19 |     |> list.map((pair) => let count = n / pair.0; (count.to_string() + pair.1))
   |                           ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-3.almd:15:9
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
   |
15 |     (1, "I")
   |         ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-3.almd

1/1 test file(s) failed

```
