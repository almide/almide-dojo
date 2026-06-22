# gcd

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn gcd(a: Int, b: Int) -> Int =
  if b == 0 then
    a
  else
    let r = a % b in
    gcd(b, r)
```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-gcd-0.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let r = a % b in
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-gcd-0.almd:
compile failed
FAILED: /tmp/dojo-gcd-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn gcd(a: Int, b: Int) -> Int =
  if b == 0 then
    a
  else
    gcd(b, a % b)
```
