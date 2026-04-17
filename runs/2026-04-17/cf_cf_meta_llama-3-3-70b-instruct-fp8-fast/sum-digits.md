# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  in list.fold(list.map(string.chars(int.to_string(abs_n)), (x) => string.codepoint(x) |> option.unwrap_or(0)), 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  in list.fold(list.map(string.chars(int.to_string(abs_n)), (x) => string.codepoint(x) |> option.unwrap_or(0) - 48), 0, (acc, x) => acc + x)
```
