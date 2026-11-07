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
      list.range(0, string.len(int.to_string(abs_n))),
      (i) => string.get(string.from_codepoint(int.from(float.from((abs_n / int.pow(10, i)) % 10))), 0) ?? ""
    ),
    0,
    (acc, x) => acc + int.parse(x) ?? 0
  )
```

**Diagnostic:**

```
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-sum-digits-0.almd:6:25
  in call to string.get()
  here: (i) => string.get(string.from_codepoint(int.from(float.from((abs_n / int.pow(10, i)) % 10))), 0) ?? ""
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
6 |       (i) => string.get(string.from_codepoint(int.from(float.from((abs_n / int.pow(10, i)) % 10))), 0) ?? ""
  |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
      list.range(0, string.len(int.to_string(abs_n))),
      (i) => int.to_string((abs_n / int.pow(10, i)) % 10)
    ),
    0,
    (acc, x) => acc + int.parse(x) ?? 0
  )
```
