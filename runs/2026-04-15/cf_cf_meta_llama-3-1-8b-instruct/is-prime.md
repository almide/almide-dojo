# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n == 2 then true 
  else n % 2 == 0 && is_prime(n / 2)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: '&&' is not valid in Almide at line 4:19
  --> /tmp/dojo-is-prime-0.almd:4:19
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
4 |   else n % 2 == 0 && is_prime(n / 2)
  |                   ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:6:51
  in call to is_prime()
  hint: Check the function name
  |
6 | test "is_prime -1 is false" { assert_eq(is_prime(-1), false) }
  |                                                   ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:7:49
  in call to is_prime()
  hint: Check the function name
  |
7 | test "is_prime 0 is false" { assert_eq(is_prime(0), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:8:49
  in call to is_prime()
  hint: Check the function name
  |
8 | test "is_prime 1 is false" { assert_eq(is_prime(1), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:9:48
  in call to is_prime()
  hint: Check the function name
  |
9 | test "is_prime 2 is true" { assert_eq(is_prime(2), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:10:48
  in call to is_prime()
  hint: Check the function name
   |
10 | test "is_prime 3 is true" { assert_eq(is_prime(3), true) }
   |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:11:49
  in call to is_prime()
  hint: Check the function name
   |
11 | test "is_prime 4 is false" { assert_eq(is_prime(4), false) }
   |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:12:48
  in call to is_prime()
  hint: Check the function name
   |
12 | test "is_prime 7 is true" { assert_eq(is_prime(7), true) }
   |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:13:49
  in call to is_prime()
  hint: Check the function name
   |
13 | test "is_prime 9 is false" { assert_eq(is_prime(9), false) }
   |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:14:49
  in call to is_prime()
  hint: Check the function name
   |
14 | test "is_prime 17 is true" { assert_eq(is_prime(17), true) }
   |                                                 ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:15:50
  in call to is_prime()
  hint: Check the function name
   |
15 | test "is_prime 25 is false" { assert_eq(is_prime(25), false) }
   |                                                  ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:16:49
  in call to is_prime()
  hint: Check the function name
   |
16 | test "is_prime 97 is true" { assert_eq(is_prime(97), true) }
   |                                                 ^^

12 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 2 then false 
  else if n == 2 then true 
  else (2..n).all((x) => n % x != 0)
```
