# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(list.chars(int.to_string(n)), (x) => int.parse(x)), 0, (acc, x) => acc + x) in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'list.chars'
  --> /tmp/dojo-sum-digits-0.almd:2:57
  in call to list.chars()
  hint: No function 'chars' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   let sum = list.fold(list.map(list.chars(int.to_string(n)), (x) => int.parse(x)), 0, (acc, x) => acc + x)
  |                                                         ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(string.chars(int.to_string(n)), (x) => int.parse(x)), 0, (acc, x) => acc + x) in 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
internal compiler error: IR verify: AddInt expects Int operands, got Int and Result[Int, String] (in sum_digits) at line 2
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(string.chars(int.to_string(n)), (x) => match int.parse(x) {
    ok(d) => d,
    err(_) => 0
  }) in 
  list.fold(digits, 0, (acc, x) => acc + x)
```
