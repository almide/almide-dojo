# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  in list.fold(
    list.map(
      list.range(0, int.to_string(abs_n).len()),
      (i) => int.parse(string.get(string.to_string(abs_n), i) ?? "").unwrap_or(0)
    ),
    0,
    (acc, x) => acc + x
  )
```

**Diagnostic:**

```
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-sum-digits-0.almd:6:35
  in call to string.to_string()
  here: (i) => int.parse(string.get(string.to_string(abs_n), i) ?? "").unwrap_or(0)
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
6 |       (i) => int.parse(string.get(string.to_string(abs_n), i) ?? "").unwrap_or(0)
  |                                   ^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-sum-digits-0.almd
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  in list.fold(
    list.map(
      list.range(0, int.to_string(abs_n).len()),
      (i) => int.parse(string.get(int.to_string(abs_n), i) ?? "").unwrap_or(0)
    ),
    0,
    (acc, x) => acc + x
  )
```
