# gcd

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn gcd(a: Int, b: Int) -> Int = 
  if b == 0 then a 
  else gcd(b, int.mod(a, b))
```

**Diagnostic:**

```
error: Expected name at line 3:19 (got Mod 'mod')
  --> /tmp/dojo-gcd-0.almd:3:19
  here: else gcd(b, int.mod(a, b))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   else gcd(b, int.mod(a, b))
  |                   ^
error: Expected Fn at line 3:22 (got LParen '(')
  --> /tmp/dojo-gcd-0.almd:3:22
  here: else gcd(b, int.mod(a, b))
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
3 |   else gcd(b, int.mod(a, b))
  |                      ^

2 error(s) found
FAILED: /tmp/dojo-gcd-0.almd
  parse error: Expected name at line 3:19 (got Mod 'mod')
  parse error: Expected Fn at line 3:22 (got LParen '(')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-gcd-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn gcd(a: Int, b: Int) -> Int = 
  if b == 0 then a 
  else gcd(b, a % b)
```
