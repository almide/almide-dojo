# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:3:44
  in call to sum_digits()
  hint: Check the function name
  |
3 | test "sum_digits 0" { assert_eq(sum_digits(0), 0) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:4:44
  in call to sum_digits()
  hint: Check the function name
  |
4 | test "sum_digits 5" { assert_eq(sum_digits(5), 5) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:5:46
  in call to sum_digits()
  hint: Check the function name
  |
5 | test "sum_digits 123" { assert_eq(sum_digits(123), 6) }
  |                                              ^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:6:47
  in call to sum_digits()
  hint: Check the function name
  |
6 | test "sum_digits 9999" { assert_eq(sum_digits(9999), 36) }
  |                                               ^^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:7:52
  in call to sum_digits()
  hint: Check the function name
  |
7 | test "sum_digits negative" { assert_eq(sum_digits(-42), 6) }
  |                                                    ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:8:45
  in call to sum_digits()
  hint: Check the function name
  |
8 | test "sum_digits 10" { assert_eq(sum_digits(10), 1) }
  |                                             ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:9:46
  in call to sum_digits()
  hint: Check the function name
  |
9 | test "sum_digits 100" { assert_eq(sum_digits(100), 1) }
  |                                              ^^^

7 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  in list.fold(string.chars(int.to_string(abs_n)), 0, (acc, ch) => acc + int.parse(ch).unwrap_or(0))
```
