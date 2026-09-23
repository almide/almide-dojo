# is-prime

- **model**: `cf:@cf/zai-org/glm-5.3-flash`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool =
  if n < 2 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else
    let limit = float.to_int(float.sqrt(int.to_float(n))) + 1
    list.all(list.range(3, limit + 1), (d) => n % d != 0)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:6:5
  in let-in
  here: let limit = float.to_int(float.sqrt(int.to_float(n))) + 1
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let limit = float.to_int(float.sqrt(int.to_float(n))) + 1
  |     ^^^
error: 'let' is not an expression in Almide at line 6:5
  --> /tmp/dojo-is-prime-0.almd:6:5
  here: let limit = float.to_int(float.sqrt(int.to_float(n))) + 1
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |     let limit = float.to_int(float.sqrt(int.to_float(n))) + 1
  |     ^

2 error(s) found
FAILED: /tmp/dojo-is-prime-0.almd
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn is_prime(n: Int) -> Bool =
  if n < 2 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else {
    let limit = float.to_int(float.sqrt(int.to_float(n))) + 1;
    list.all(list.range(3, limit + 1), (d) => n % d != 0)
  }
```
