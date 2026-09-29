# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => int.parse(c)), 0, (acc, x) => acc + x) in 
  sum
```

**Diagnostic:**

```
error: operator '+' requires numeric, String, or List types but got Int and Result[Int, String]
  --> /tmp/dojo-sum-digits-0.almd:2:107
  in operator +
  here: let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => int.parse(c)), 0, (acc, x) => acc + x)
  hint: Unwrap the Result operand first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
  |
2 |   let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => int.parse(c)), 0, (acc, x) => acc + x)
  |                                                                                                           ^

1 error(s) found
FAILED: /tmp/dojo-sum-digits-0.almd
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => match int.parse(c) { ok(x) => x, err(_) => 0 }), 0, (acc, x) => acc + x) in 
  sum
```
