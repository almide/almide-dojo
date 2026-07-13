# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
Here is the code for the functions you described:

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum_digits(n: int) -> int:
    return sum_digits(n)

def sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 1:1 (got TypeName 'Here')
  --> /tmp/dojo-sum-digits-0.almd:1:1
  |
1 | Here is the code for the functions you described:
  | ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:50:44
  in call to sum_digits()
  hint: Check the function name
   |
50 | test "sum_digits 0" { assert_eq(sum_digits(0), 0) }
   |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:51:44
  in call to sum_digits()
  hint: Check the function name
   |
51 | test "sum_digits 5" { assert_eq(sum_digits(5), 5) }
   |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:52:46
  in call to sum_digits()
  hint: Check the function name
   |
52 | test "sum_digits 123" { assert_eq(sum_digits(123), 6) }
   |                                              ^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:53:47
  in call to sum_digits()
  hint: Check the function name
   |
53 | test "sum_digits 9999" { assert_eq(sum_digits(9999), 36) }
   |                                               ^^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:54:52
  in call to sum_digits()
  hint: Check the function name
   |
54 | test "sum_digits negative" { assert_eq(sum_digits(-42), 6) }
   |                                                    ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:55:45
  in call to sum_digits()
  hint: Check the function name
   |
55 | test "sum_digits 10" { assert_eq(sum_digits(10), 1) }
   |                                             ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:56:46
  in call to sum_digits()
  hint: Check the function name
   |
56 | test "sum_digits 100" { assert_eq(sum_digits(100), 1) }
   |                                              ^^^

8 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
    if n == 0 then 0 
    else int.abs(n) % 10 + sum_digits(int.abs(n) / 10)
```
