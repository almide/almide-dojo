# roman-numeral

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let result = 
    match symbols 
    { 
      some((value, symbol)) => 
        if n >= value 
        then 
          let count = n / value 
          let rest = n - value * count 
          let prefix = string.repeat(symbol, count) 
          prefix + to_roman(rest) 
        else 
          to_roman(n) 
    }
  result
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-0.almd:9:11
  in let-in
  here: let count = n / value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |           let count = n / value
  |           ^^^
error: Expected expression at line 13:9 (got Else 'else')
  --> /tmp/dojo-roman-numeral-0.almd:13:9
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |         else
   |         ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 15:5 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-0.almd:15:5
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |     }
   |     ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-0.almd:10:26
  in variable value
  here: let rest = n - value * count
  hint: Did you mean `value.int`?
  try:
      value.int
   |
10 |           let rest = n - value * count
   |                          ^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:10:34
  in variable count
  here: let rest = n - value * count
  hint: Did you mean `map.count`?
  try:
      map.count
   |
10 |           let rest = n - value * count
   |                                  ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-0.almd:11:38
  in variable symbol
  here: let prefix = string.repeat(symbol, count)
  hint: Did you mean `symbols`?
  try:
      symbols
   |
11 |           let prefix = string.repeat(symbol, count)
   |                                      ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-0.almd:11:46
  in variable count
  here: let prefix = string.repeat(symbol, count)
  hint: Did you mean `map.count`?
  try:
      map.count
   |
11 |           let prefix = string.repeat(symbol, count)
   |                                              ^^^^^

7 error(s) found
FAILED: /tmp/dojo-roman-numeral-0.almd
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  match symbols 
  { 
    some((value, symbol)) => 
      if n >= value 
      then 
        let count = n / value 
        let rest = n - value * count 
        let prefix = string.repeat(symbol, count) 
        prefix + to_roman(rest) 
      else 
        to_roman(n) 
  }
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-1.almd:8:9
  in let-in
  here: let count = n / value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let count = n / value
  |         ^^^
error: Expected expression at line 12:7 (got Else 'else')
  --> /tmp/dojo-roman-numeral-1.almd:12:7
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |       else
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 14:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-1.almd:14:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   }
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-1.almd:9:24
  in variable value
  here: let rest = n - value * count
  hint: Did you mean `value.int`?
  try:
      value.int
  |
9 |         let rest = n - value * count
  |                        ^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:9:32
  in variable count
  here: let rest = n - value * count
  hint: Did you mean `map.count`?
  try:
      map.count
  |
9 |         let rest = n - value * count
  |                                ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-1.almd:10:36
  in variable symbol
  here: let prefix = string.repeat(symbol, count)
  hint: Did you mean `symbols`?
  try:
      symbols
   |
10 |         let prefix = string.repeat(symbol, count)
   |                                    ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-1.almd:10:44
  in variable count
  here: let prefix = string.repeat(symbol, count)
  hint: Did you mean `map.count`?
  try:
      map.count
   |
10 |         let prefix = string.repeat(symbol, count)
   |                                            ^^^^^

7 error(s) found
FAILED: /tmp/dojo-roman-numeral-1.almd
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  match symbols 
  { 
    some((value, symbol)) => 
      if n >= value 
      then 
        let count = n / value 
        let rest = n - value * count 
        let prefix = string.repeat(symbol, count) 
        prefix + to_roman(rest) 
      else 
        to_roman(n) 
  }
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-2.almd:8:9
  in let-in
  here: let count = n / value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let count = n / value
  |         ^^^
error: Expected expression at line 12:7 (got Else 'else')
  --> /tmp/dojo-roman-numeral-2.almd:12:7
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |       else
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 14:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-2.almd:14:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   }
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-2.almd:9:24
  in variable value
  here: let rest = n - value * count
  hint: Did you mean `value.int`?
  try:
      value.int
  |
9 |         let rest = n - value * count
  |                        ^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:9:32
  in variable count
  here: let rest = n - value * count
  hint: Did you mean `map.count`?
  try:
      map.count
  |
9 |         let rest = n - value * count
  |                                ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-2.almd:10:36
  in variable symbol
  here: let prefix = string.repeat(symbol, count)
  hint: Did you mean `symbols`?
  try:
      symbols
   |
10 |         let prefix = string.repeat(symbol, count)
   |                                    ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-2.almd:10:44
  in variable count
  here: let prefix = string.repeat(symbol, count)
  hint: Did you mean `map.count`?
  try:
      map.count
   |
10 |         let prefix = string.repeat(symbol, count)
   |                                            ^^^^^

7 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  match symbols 
  { 
    some((value, symbol)) => 
      if n >= value 
      then 
        let count = n / value 
        let rest = n - value * count 
        let prefix = string.repeat(symbol, count) 
        prefix + to_roman(rest) 
      else 
        to_roman(n) 
  }
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-roman-numeral-3.almd:8:9
  in let-in
  here: let count = n / value
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let count = n / value
  |         ^^^
error: Expected expression at line 12:7 (got Else 'else')
  --> /tmp/dojo-roman-numeral-3.almd:12:7
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
12 |       else
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 14:3 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-3.almd:14:3
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   }
   |   ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:9:24
  in variable value
  here: let rest = n - value * count
  hint: Did you mean `value.str`?
  try:
      value.str
  |
9 |         let rest = n - value * count
  |                        ^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:9:32
  in variable count
  here: let rest = n - value * count
  hint: Did you mean `map.count`?
  try:
      map.count
  |
9 |         let rest = n - value * count
  |                                ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:10:36
  in variable symbol
  here: let prefix = string.repeat(symbol, count)
  hint: Did you mean `symbols`?
  try:
      symbols
   |
10 |         let prefix = string.repeat(symbol, count)
   |                                    ^^^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-roman-numeral-3.almd:10:44
  in variable count
  here: let prefix = string.repeat(symbol, count)
  hint: Did you mean `map.count`?
  try:
      map.count
   |
10 |         let prefix = string.repeat(symbol, count)
   |                                            ^^^^^

7 error(s) found
FAILED: /tmp/dojo-roman-numeral-3.almd
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
