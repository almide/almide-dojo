# gcd

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Attempts

### Attempt 1 (FAIL)

```almide
def gcd(a: Int, b: Int): Int = 
  if b == 0 then a 
  else gcd(b, a % b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-gcd-0.almd
error: 'def' is not a keyword in Almide at line 1:1
  --> /tmp/dojo-gcd-0.almd:1:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
1 | def gcd(a: Int, b: Int): Int =
  | ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:5:40
  in call to gcd()
  hint: Check the function name
  |
5 | test "gcd 0 0 is 0" { assert_eq(gcd(0, 0), 0) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:6:40
  in call to gcd()
  hint: Check the function name
  |
6 | test "gcd 5 0 is 5" { assert_eq(gcd(5, 0), 5) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:7:40
  in call to gcd()
  hint: Check the function name
  |
7 | test "gcd 0 7 is 7" { assert_eq(gcd(0, 7), 7) }
  |                                        ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:8:42
  in call to gcd()
  hint: Check the function name
  |
8 | test "gcd 12 8 is 4" { assert_eq(gcd(12, 8), 4) }
  |                                          ^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:9:43
  in call to gcd()
  hint: Check the function name
  |
9 | test "gcd 17 13 is 1" { assert_eq(gcd(17, 13), 1) }
  |                                           ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:10:46
  in call to gcd()
  hint: Check the function name
   |
10 | test "gcd 100 75 is 25" { assert_eq(gcd(100, 75), 25) }
   |                                              ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:11:43
  in call to gcd()
  hint: Check the function name
   |
11 | test "gcd 54 24 is 6" { assert_eq(gcd(54, 24), 6) }
   |                                           ^^
error[E002]: undefined function 'gcd'
  --> /tmp/dojo-gcd-0.almd:12:43
  in call to gcd()
  hint: Check the function name
   |
12 | test "gcd same number" { assert_eq(gcd(7, 7), 7) }
   |                                           ^

9 error(s) found
Compile error for /tmp/dojo-gcd-0.almd:
compile failed
FAILED: /tmp/dojo-gcd-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn gcd(a: Int, b: Int) -> Int = 
  if b == 0 then a 
  else gcd(b, a % b)
```
