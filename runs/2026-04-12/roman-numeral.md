# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd
error: Expected expression at line 19:25 (got Eq '=')
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:19:25
   |
19 |     val (value, symbol) = values.head
   |                         ^
error[E003]: undefined variable 'val'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:4:5
  in variable val
  hint: Check the variable name
  |
4 |     val values = list.of(
  |     ^^^
error[E002]: undefined function 'list.of'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:17:11
  in call to list.of()
  hint: No function 'of' in module 'list'. See docs/CHEATSHEET.md for available functions
   |
17 |       (1, "I")
   |           ^^^
error[E003]: undefined variable 'value'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:19:10
  in variable value
  hint: Check the variable name
   |
19 |     val (value, symbol) = values.head
   |          ^^^^^
error[E003]: undefined variable 'symbol'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:19:17
  in variable symbol
  hint: Check the variable name
   |
19 |     val (value, symbol) = values.head
   |                 ^^^^^^
error[E002]: undefined function 'val'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:19:17
  in call to val()
  hint: Check the function name
   |
19 |     val (value, symbol) = values.head
   |                 ^^^^^^
error[E003]: undefined variable 'val'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:20:5
  in variable val
  hint: Check the variable name
   |
20 |     val count = n / value
   |     ^^^
error[E003]: undefined variable 'value'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:20:21
  in variable value
  hint: Check the variable name
   |
20 |     val count = n / value
   |                     ^^^^^
error[E003]: undefined variable 'val'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:21:5
  in variable val
  hint: Check the variable name
   |
21 |     val rest = n % value
   |     ^^^
error[E003]: undefined variable 'value'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:21:20
  in variable value
  hint: Check the variable name
   |
21 |     val rest = n % value
   |                    ^^^^^
error[E003]: undefined variable 'val'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:22:5
  in variable val
  hint: Check the variable name
   |
22 |     val symbols = string.repeat(symbol, count)
   |     ^^^
error[E003]: undefined variable 'symbol'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:22:33
  in variable symbol
  hint: Check the variable name
   |
22 |     val symbols = string.repeat(symbol, count)
   |                                 ^^^^^^
error[E003]: undefined variable 'count'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:22:41
  in variable count
  hint: Check the variable name
   |
22 |     val symbols = string.repeat(symbol, count)
   |                                         ^^^^^
error[E003]: undefined variable 'values'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:23:18
  in variable values
  hint: Check the variable name
   |
23 |     if list.size(values) == 1 then symbols
   |                  ^^^^^^
error[E002]: undefined function 'list.size'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:23:18
  in call to list.size()
  hint: Did you mean `list.len`?
   |
23 |     if list.size(values) == 1 then symbols
   |                  ^^^^^^
error[E003]: undefined variable 'symbols'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:23:36
  in variable symbols
  hint: Check the variable name
   |
23 |     if list.size(values) == 1 then symbols
   |                                    ^^^^^^^
error[E003]: undefined variable 'symbols'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:24:10
  in variable symbols
  hint: Check the variable name
   |
24 |     else symbols + to_roman(rest)
   |          ^^^^^^^
error[E003]: undefined variable 'rest'
  --> /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:24:29
  in variable rest
  hint: Check the variable name
   |
24 |     else symbols + to_roman(rest)
   |                             ^^^^

18 error(s) found
Compile error for /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd:
compile failed
FAILED: /var/folders/q3/fnffs_1j7sl7x8x1vtkth6vm0000gr/T//dojo-roman-numeral-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn to_roman(n: Int) -> String = 
  if n == 0 then ""
  else {
    val values = list.of(
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
    )
    val (value, symbol) = values.head
    val count = n / value
    val rest = n % value
    val symbols = string.repeat(symbol, count)
    if list.size(values) == 1 then symbols
    else symbols + to_roman(rest)
  }
```
