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
    match symbols {
      some((value, symbol)) => 
        if n >= value then 
          symbol + to_roman(n - value) 
        else 
          to_roman(n)
      none => ""
    }
  result
```

**Diagnostic:**

```
error: pattern `some(..)` cannot match List[(Int, String)] — the subject is not an Option
  --> /tmp/dojo-roman-numeral-0.almd:4:11
  in match pattern
  here: match symbols {
  hint: the value is already a plain List[(Int, String)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
4 |     match symbols {
  |           ^^^^^^^
error: pattern `none` cannot match List[(Int, String)] — the subject is not an Option
  --> /tmp/dojo-roman-numeral-0.almd:9:20
  in match pattern
  here: to_roman(n)
  hint: the value is already a plain List[(Int, String)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
9 |           to_roman(n)
  |                    ^

2 error(s) found
FAILED: /tmp/dojo-roman-numeral-0.almd
Compile error for /tmp/dojo-roman-numeral-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let result = 
    match symbols {
      some((value, symbol)) => 
        if n >= value then 
          symbol + to_roman(n - value) 
        else 
          to_roman(n - value)
      none => ""
    }
  result
```

**Diagnostic:**

```
error: pattern `some(..)` cannot match List[(Int, String)] — the subject is not an Option
  --> /tmp/dojo-roman-numeral-1.almd:4:11
  in match pattern
  here: match symbols {
  hint: the value is already a plain List[(Int, String)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
4 |     match symbols {
  |           ^^^^^^^
error: pattern `none` cannot match List[(Int, String)] — the subject is not an Option
  --> /tmp/dojo-roman-numeral-1.almd:9:24
  in match pattern
  here: to_roman(n - value)
  hint: the value is already a plain List[(Int, String)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
9 |           to_roman(n - value)
  |                        ^^^^^

2 error(s) found
FAILED: /tmp/dojo-roman-numeral-1.almd
Compile error for /tmp/dojo-roman-numeral-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let result = 
    match symbols {
      some((value, symbol)) => 
        if n >= value then 
          symbol + to_roman(n - value) 
        else 
          to_roman(n)
      _ => to_roman(n)
    }
  result
```

**Diagnostic:**

```
error: pattern `some(..)` cannot match List[(Int, String)] — the subject is not an Option
  --> /tmp/dojo-roman-numeral-2.almd:4:11
  in match pattern
  here: match symbols {
  hint: the value is already a plain List[(Int, String)]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
4 |     match symbols {
  |           ^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-roman-numeral-2.almd
Compile error for /tmp/dojo-roman-numeral-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn to_roman(n: Int) -> String = 
  let symbols = [(1000, "M"), (900, "CM"), (500, "D"), (400, "CD"), (100, "C"), (90, "XC"), (50, "L"), (40, "XL"), (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]
  let result = 
    match symbols {
      [] => ""
      (value, symbol) :: rest => 
        if n >= value then 
          symbol + to_roman(n - value) 
        else 
          to_roman(n)
    }
  result
```

**Diagnostic:**

```
error: Expected FatArrow at line 6:23 (got Colon ':')
  --> /tmp/dojo-roman-numeral-3.almd:6:23
  here: (value, symbol) :: rest =>
  hint: `head :: tail` (cons pattern) is Haskell/OCaml/Elm syntax. Almide list patterns use [] / [a, b] literals only. For head/tail recursion, use `list.first(xs)` and `list.drop(xs, 1)` on the non-empty arm.
  |
6 |       (value, symbol) :: rest =>
  |                       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 11:5 (got RBrace '}')
  --> /tmp/dojo-roman-numeral-3.almd:11:5
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |     }
   |     ^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:7:17
  in variable value
  here: if n >= value then
  hint: Did you mean `value.int`?
  try:
      value.int
  |
7 |         if n >= value then
  |                 ^^^^^
error[E003]: undefined variable 'symbol'
  --> /tmp/dojo-roman-numeral-3.almd:8:11
  in variable symbol
  here: symbol + to_roman(n - value)
  hint: Did you mean `symbols`?
  try:
      symbols
  |
8 |           symbol + to_roman(n - value)
  |           ^^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-roman-numeral-3.almd:8:33
  in variable value
  here: symbol + to_roman(n - value)
  hint: Did you mean `value.int`?
  try:
      value.int
  |
8 |           symbol + to_roman(n - value)
  |                                 ^^^^^

5 error(s) found
FAILED: /tmp/dojo-roman-numeral-3.almd
Compile error for /tmp/dojo-roman-numeral-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
