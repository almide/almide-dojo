# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn fizzbuzz(n: Int) -> String = 
  if int.mod(n, 15) == 0 then "FizzBuzz"
  else if int.mod(n, 3) == 0 then "Fizz"
  else if int.mod(n, 5) == 0 then "Buzz"
  else int.to_string(n)
```

**Diagnostic:**

```
error: Expected name at line 2:10 (got Mod 'mod')
  --> /tmp/dojo-fizzbuzz-0.almd:2:10
  here: if int.mod(n, 15) == 0 then "FizzBuzz"
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   if int.mod(n, 15) == 0 then "FizzBuzz"
  |          ^
error: Expected Fn at line 2:13 (got LParen '(')
  --> /tmp/dojo-fizzbuzz-0.almd:2:13
  here: if int.mod(n, 15) == 0 then "FizzBuzz"
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   if int.mod(n, 15) == 0 then "FizzBuzz"
  |             ^
error: Expected Fn at line 3:18 (got LParen '(')
  --> /tmp/dojo-fizzbuzz-0.almd:3:18
  here: else if int.mod(n, 3) == 0 then "Fizz"
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   else if int.mod(n, 3) == 0 then "Fizz"
  |                  ^
error: Expected Fn at line 4:18 (got LParen '(')
  --> /tmp/dojo-fizzbuzz-0.almd:4:18
  here: else if int.mod(n, 5) == 0 then "Buzz"
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |   else if int.mod(n, 5) == 0 then "Buzz"
  |                  ^

4 error(s) found
FAILED: /tmp/dojo-fizzbuzz-0.almd
Compile error for /tmp/dojo-fizzbuzz-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn fizzbuzz(n: Int) -> String = 
  if n % 15 == 0 then "FizzBuzz"
  else if n % 3 == 0 then "Fizz"
  else if n % 5 == 0 then "Buzz"
  else int.to_string(n)
```
