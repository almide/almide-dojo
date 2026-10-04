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
  ]

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    while n >= value {
      acc + symbol
      n = n - value
    }
    acc
  })

  result
}
```

**Diagnostic:**

```
error[E009]: cannot reassign immutable binding 'n'
  --> /tmp/dojo-roman-numeral-0.almd:21:15
  in n = ...
  here: n = n - value
  hint: 'n' is a function parameter (immutable). Use a local copy: var n_ = n
  try:
      // 'n' is a parameter — make a mutable copy:
      var n_ = n
      // ...then reassign n_ instead of n
   |
21 |       n = n - value
   |               ^^^^^

1 error(s) found
FAILED: /tmp/dojo-roman-numeral-0.almd
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
  ]

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-roman-numeral-1.almd
  test: to_roman 1
  at:   /tmp/dojo-roman-numeral-1.almd:30
  expected: "I"
  found:    ""
  test: to_roman 4
  at:   /tmp/dojo-roman-numeral-1.almd:31
  expected: "IV"
  found:    ""
  test: to_roman 9
  at:   /tmp/dojo-roman-numeral-1.almd:32
  expected: "IX"
  found:    ""
  test: to_roman 14
  at:   /tmp/dojo-roman-numeral-1.almd:33
  expected: "XIV"
  found:    ""
  test: to_roman 42
  at:   /tmp/dojo-roman-numeral-1.almd:34
  expected: "XLII"
  found:    ""
  test: to_roman 99
  at:   /tmp/dojo-roman-numeral-1.almd:35
  expected: "XCIX"
  found:    ""
  test: to_roman 399
  at:   /tmp/dojo-roman-numeral-1.almd:36
  expected: "CCCXCIX"
  found:    ""
  test: to_roman 500
  at:   /tmp/dojo-roman-numeral-1.almd:37
  expected: "D"
  found:    ""
  test: to_roman 1994
  at:   /tmp/dojo-roman-numeral-1.almd:38
  expected: "MCMXCIV"
  found:    ""
  test: to_roman 3999
  at:   /tmp/dojo-roman-numeral-1.almd:39
  expected: "MMMCMXCIX"
  found:    ""

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
  ]

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

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

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}

fn to_roman(n: Int) -> String = {
  let symbols =
```

**Diagnostic:**

```
error: Expected expression at line 700:1 (got Test 'test')
  --> /tmp/dojo-roman-numeral-2.almd:700:1
  here: test "to_roman 1" { assert_eq(to_roman(1), "I") }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
    |
700 | test "to_roman 1" { assert_eq(to_roman(1), "I") }
    | ^
error[E012]: duplicate function 'to_roman'
  at line 30
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn to_roman(n: Int) -> String = {
   | ----------------------------------- first definition of 'to_roman' here
...
30 | fn to_roman(n: Int) -> String = {
   | ^
error[E012]: duplicate function 'to_roman'
  at line 59
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn to_roman(n: Int) -> String = {
   | ----------------------------------- first definition of 'to_roman' here
...
59 | fn to_roman(n: Int) -> String = {
   | ^
error[E012]: duplicate function 'to_roman'
  at line 88
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn to_roman(n: Int) -> String = {
   | ----------------------------------- first definition of 'to_roman' here
...
88 | fn to_roman(n: Int) -> String = {
   | ^
error[E012]: duplicate function 'to_roman'
  at line 117
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
117 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 146
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
146 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 175
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
175 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 204
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
204 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 233
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
233 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 262
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
262 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 291
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
291 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 320
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
320 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 349
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
349 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 378
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
378 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 407
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
407 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 436
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
436 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 465
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
465 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 494
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
494 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 523
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
523 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 552
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
552 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 581
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
581 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 610
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
610 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 639
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
639 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 668
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
668 | fn to_roman(n: Int) -> String = {
    | ^
error[E012]: duplicate function 'to_roman'
  at line 697
  in fn to_roman
  here: fn to_roman(n: Int) -> String = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
    |
  1 | fn to_roman(n: Int) -> String = {
    | ----------------------------------- first definition of 'to_roman' here
 ...
697 | fn to_roman(n: Int) -> String = {
    | ^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-2.almd:697:33
  in fn 'to_roman'
  here: fn to_roman(n: Int) -> String = {
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
    |
697 | fn to_roman(n: Int) -> String = {
    |                                 ^

26 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
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
  ]

  let result = list.fold(symbols, "", (acc, (value, symbol)) => {
    var n_ = n
    while n_ >= value {
      acc + symbol
      n_ = n_ - value
    }
    acc
  })

  result
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-roman-numeral-3.almd
  test: to_roman 1
  at:   /tmp/dojo-roman-numeral-3.almd:30
  expected: "I"
  found:    ""
  test: to_roman 4
  at:   /tmp/dojo-roman-numeral-3.almd:31
  expected: "IV"
  found:    ""
  test: to_roman 9
  at:   /tmp/dojo-roman-numeral-3.almd:32
  expected: "IX"
  found:    ""
  test: to_roman 14
  at:   /tmp/dojo-roman-numeral-3.almd:33
  expected: "XIV"
  found:    ""
  test: to_roman 42
  at:   /tmp/dojo-roman-numeral-3.almd:34
  expected: "XLII"
  found:    ""
  test: to_roman 99
  at:   /tmp/dojo-roman-numeral-3.almd:35
  expected: "XCIX"
  found:    ""
  test: to_roman 399
  at:   /tmp/dojo-roman-numeral-3.almd:36
  expected: "CCCXCIX"
  found:    ""
  test: to_roman 500
  at:   /tmp/dojo-roman-numeral-3.almd:37
  expected: "D"
  found:    ""
  test: to_roman 1994
  at:   /tmp/dojo-roman-numeral-3.almd:38
  expected: "MCMXCIV"
  found:    ""
  test: to_roman 3999
  at:   /tmp/dojo-roman-numeral-3.almd:39
  expected: "MMMCMXCIX"
  found:    ""

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
