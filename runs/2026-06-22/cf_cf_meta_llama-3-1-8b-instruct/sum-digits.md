# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => int.parse(c)), 0, (acc, x) => acc + x)
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
internal compiler error: IR verify: AddInt expects Int operands, got Int and Result[Int, String] (in sum_digits) at line 2
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(string.chars(int.to_string(n)), (c) => int.parse(c).unwrap_or(0)), 0, (acc, x) => acc + x)
  in sum
```
