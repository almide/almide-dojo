# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.to_list(int.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x)) 
  in sum
```

**Diagnostic:**

```
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:2:36
  in call to list.to_list()
  here: let sum = list.fold(list.to_list(int.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x))
  hint: Fix the argument type
  |
2 |   let sum = list.fold(list.to_list(int.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x))
  |                                    ^^^^^^^^^^^^^^^^^^^^^^^^^
error: operator '+' requires numeric, String, or List types but got Int and Result[Int, String]
  --> /tmp/dojo-sum-digits-0.almd:2:95
  in operator +
  here: let sum = list.fold(list.to_list(int.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x))
  hint: Unwrap the Result operand first: `!` propagates the error (effect fn body), `?? fallback` supplies a default, or `match` handles ok/err
  |
2 |   let sum = list.fold(list.to_list(int.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x))
  |                                                                                               ^

2 error(s) found
FAILED: /tmp/dojo-sum-digits-0.almd
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.to_list(int.to_string(int.abs(n)))
  in list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
```

**Diagnostic:**

```
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:2:29
  in call to list.to_list()
  here: let digits = list.to_list(int.to_string(int.abs(n)))
  hint: Fix the argument type
  |
2 |   let digits = list.to_list(int.to_string(int.abs(n)))
  |                             ^^^^^^^^^^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-sum-digits-1.almd
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = string.to_list(int.to_string(int.abs(n)))
  in list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
```
