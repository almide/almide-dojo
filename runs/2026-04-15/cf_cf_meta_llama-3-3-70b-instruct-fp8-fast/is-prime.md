# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool =
  if n <= 1 then false
  else list.fold(int.range(2, n), true, (acc, x) => acc && n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: '&&' is not valid in Almide at line 3:57
  --> /tmp/dojo-is-prime-0.almd:3:57
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
3 |   else list.fold(int.range(2, n), true, (acc, x) => acc && n % x != 0)
  |                                                         ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:5:51
  in call to is_prime()
  hint: Check the function name
  |
5 | test "is_prime -1 is false" { assert_eq(is_prime(-1), false) }
  |                                                   ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:6:49
  in call to is_prime()
  hint: Check the function name
  |
6 | test "is_prime 0 is false" { assert_eq(is_prime(0), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:7:49
  in call to is_prime()
  hint: Check the function name
  |
7 | test "is_prime 1 is false" { assert_eq(is_prime(1), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:8:48
  in call to is_prime()
  hint: Check the function name
  |
8 | test "is_prime 2 is true" { assert_eq(is_prime(2), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:9:48
  in call to is_prime()
  hint: Check the function name
  |
9 | test "is_prime 3 is true" { assert_eq(is_prime(3), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:10:49
  in call to is_prime()
  hint: Check the function name
   |
10 | test "is_prime 4 is false" { assert_eq(is_prime(4), false) }
   |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:11:48
  in call to is_prime()
  hint: Check the function name
   |
11 | test "is_prime 7 is true" { assert_eq(is_prime(7), true) }
   |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:12:49
  in call to is_prime()
  hint: Check the function name
   |
12 | test "is_prime 9 is false" { assert_eq(is_prime(9), false) }
   |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:13:49
  in call to is_prime()
  hint: Check the function name
   |
13 | test "is_prime 17 is true" { assert_eq(is_prime(17), true) }
   |                                                 ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:14:50
  in call to is_prime()
  hint: Check the function name
   |
14 | test "is_prime 25 is false" { assert_eq(is_prime(25), false) }
   |                                                  ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-0.almd:15:49
  in call to is_prime()
  hint: Check the function name
   |
15 | test "is_prime 97 is true" { assert_eq(is_prime(97), true) }
   |                                                 ^^

12 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool =
  if n <= 1 then false
  else list.fold(int.range(2, n), true, (acc, x) => acc and n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E002]: undefined function 'int.range'
  --> /tmp/dojo-is-prime-1.almd:3:31
  in call to int.range()
  hint: No function 'range' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.fold(int.range(2, n), true, (acc, x) => acc and n % x != 0)
  |                               ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_prime(n: Int) -> Bool =
  if n <= 1 then false
  else list.fold(list.range(2, n - 1), true, (acc, x) => acc and n % x != 0)
```
