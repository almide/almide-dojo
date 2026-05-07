# roman-numeral

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let pairs = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
               (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
               (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  in list.fold(pairs, (n, ""), (acc, (value, symbol)) => 
    if n >= value then 
      let count = int.clamp(n / value, 0, 1000)
      in (acc.1 + string.repeat(symbol, count), acc.0 - count * value)
    else (acc.1, acc.0))
  |> (x) => x.1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let count = int.clamp(n / value, 0, 1000)
  |       ^^^
error[E001]: type mismatch in fn 'to_roman': expected String but got Unit
  --> /tmp/dojo-roman-numeral-0.almd:4:63
  in fn 'to_roman'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to String:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type String
  |
4 |                (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  |                                                               ^^^

2 error(s) found
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let pairs = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
               (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
               (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  in list.fold(pairs, (n, ""), (acc, (value, symbol)) => 
    if n >= value 
    then (acc.1 + string.repeat(symbol, n / value), n - (n / value) * value)
    else (acc.1, acc.0))
  |> (x) => x.1
```

**Diagnostic:**

```
Compiling /tmp/dojo-roman-numeral-1.almd
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:7:33
  in variable symbol
  hint: Check the variable name
  |
7 |     then (acc.1 + string.repeat(symbol, n / value), n - (n / value) * value)
  |                                 ^^^^^^
error[E005]: argument 'f' expects fn((Int, String), (Int, String)) -> (Int, String) but got fn(?0, Int) -> (Unknown, Int)
  --> /tmp/dojo-roman-numeral-1.almd:8:18
  in call to list.fold()
  hint: Fix the argument type
  |
8 |     else (acc.1, acc.0))
  |                  ^^^
error[E001]: type mismatch in call to list.fold(): expected fn((Int, String), (Int, String)) -> (Int, String) but got fn((Int, String), Int) -> (Unknown, Int)
  --> /tmp/dojo-roman-numeral-1.almd:8:18
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
8 |     else (acc.1, acc.0))
  |                  ^^^

3 error(s) found
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed
FAILED: /tmp/dojo-roman-numeral-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn to_roman(n: Int) -> String = 
  let pairs = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), 
               (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), 
               (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  in list.fold(pairs, (n, ""), (acc, pair) => 
    if acc.0 >= pair.0 
    then (acc.0 - (acc.0 / pair.0) * pair.0, acc.1 + string.repeat(pair.1, acc.0 / pair.0))
    else acc)
  |> (x) => x.1
```
