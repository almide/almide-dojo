# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3

## Final diagnostic

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected ')' to close parenthesized expression opened at line 3:8
  --> /tmp/dojo-is-prime-3.almd:3:11
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
3 |   else (2 to int.sqrt(n).toInt).forall(x => n % x != 0)
  |        --------------- '(' opened here
  |
3 |   else (2 to int.sqrt(n).toInt).forall(x => n % x != 0)
  |           ^^
error: Expected ')' to close parenthesized expression opened at line 3:8 at line 3:11
  --> /tmp/dojo-is-prime-3.almd:3:8
  |
3 |   else (2 to int.sqrt(n).toInt).forall(x => n % x != 0)
  |        ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:5:51
  in call to is_prime()
  hint: Check the function name
  |
5 | test "is_prime -1 is false" { assert_eq(is_prime(-1), false) }
  |                                                   ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:6:49
  in call to is_prime()
  hint: Check the function name
  |
6 | test "is_prime 0 is false" { assert_eq(is_prime(0), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:7:49
  in call to is_prime()
  hint: Check the function name
  |
7 | test "is_prime 1 is false" { assert_eq(is_prime(1), false) }
  |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:8:48
  in call to is_prime()
  hint: Check the function name
  |
8 | test "is_prime 2 is true" { assert_eq(is_prime(2), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:9:48
  in call to is_prime()
  hint: Check the function name
  |
9 | test "is_prime 3 is true" { assert_eq(is_prime(3), true) }
  |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:10:49
  in call to is_prime()
  hint: Check the function name
   |
10 | test "is_prime 4 is false" { assert_eq(is_prime(4), false) }
   |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:11:48
  in call to is_prime()
  hint: Check the function name
   |
11 | test "is_prime 7 is true" { assert_eq(is_prime(7), true) }
   |                                                ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:12:49
  in call to is_prime()
  hint: Check the function name
   |
12 | test "is_prime 9 is false" { assert_eq(is_prime(9), false) }
   |                                                 ^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:13:49
  in call to is_prime()
  hint: Check the function name
   |
13 | test "is_prime 17 is true" { assert_eq(is_prime(17), true) }
   |                                                 ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:14:50
  in call to is_prime()
  hint: Check the function name
   |
14 | test "is_prime 25 is false" { assert_eq(is_prime(25), false) }
   |                                                  ^^
error[E002]: undefined function 'is_prime'
  --> /tmp/dojo-is-prime-3.almd:15:49
  in call to is_prime()
  hint: Check the function name
   |
15 | test "is_prime 97 is true" { assert_eq(is_prime(97), true) }
   |                                                 ^^

13 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```

## Last attempted code

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else (2 to int.sqrt(n).toInt).forall(x => n % x != 0)
```
