# sum-digits

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2

## Attempts

### Attempt 1 (FAIL)

```almide
def sum_digits(n: Int): Int = {
  def loop(x: Int, acc: Int): Int = {
    if (x == 0) acc
    else loop(x / 10, acc + x % 10)
  }
  loop(int.abs(n), 0)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'def' is not a keyword in Almide at line 1:1
  --> /tmp/dojo-sum-digits-0.almd:1:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
1 | def sum_digits(n: Int): Int = {
  | ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:9:44
  in call to sum_digits()
  hint: Check the function name
  |
9 | test "sum_digits 0" { assert_eq(sum_digits(0), 0) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:10:44
  in call to sum_digits()
  hint: Check the function name
   |
10 | test "sum_digits 5" { assert_eq(sum_digits(5), 5) }
   |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:11:46
  in call to sum_digits()
  hint: Check the function name
   |
11 | test "sum_digits 123" { assert_eq(sum_digits(123), 6) }
   |                                              ^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:12:47
  in call to sum_digits()
  hint: Check the function name
   |
12 | test "sum_digits 9999" { assert_eq(sum_digits(9999), 36) }
   |                                               ^^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:13:52
  in call to sum_digits()
  hint: Check the function name
   |
13 | test "sum_digits negative" { assert_eq(sum_digits(-42), 6) }
   |                                                    ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:14:45
  in call to sum_digits()
  hint: Check the function name
   |
14 | test "sum_digits 10" { assert_eq(sum_digits(10), 1) }
   |                                             ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-0.almd:15:46
  in call to sum_digits()
  hint: Check the function name
   |
15 | test "sum_digits 100" { assert_eq(sum_digits(100), 1) }
   |                                              ^^^

8 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  fn loop(x: Int, acc: Int) -> Int = 
    if x == 0 then acc 
    else loop(x / 10, acc + x % 10)
  loop(int.abs(n), 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-1.almd:2:3
  |
2 |   fn loop(x: Int, acc: Int) -> Int =
  |   ^
error: 'loop' is not valid in Almide at line 4:10
  --> /tmp/dojo-sum-digits-1.almd:4:10
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
4 |     else loop(x / 10, acc + x % 10)
  |          ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:7:44
  in call to sum_digits()
  hint: Check the function name
  |
7 | test "sum_digits 0" { assert_eq(sum_digits(0), 0) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:8:44
  in call to sum_digits()
  hint: Check the function name
  |
8 | test "sum_digits 5" { assert_eq(sum_digits(5), 5) }
  |                                            ^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:9:46
  in call to sum_digits()
  hint: Check the function name
  |
9 | test "sum_digits 123" { assert_eq(sum_digits(123), 6) }
  |                                              ^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:10:47
  in call to sum_digits()
  hint: Check the function name
   |
10 | test "sum_digits 9999" { assert_eq(sum_digits(9999), 36) }
   |                                               ^^^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:11:52
  in call to sum_digits()
  hint: Check the function name
   |
11 | test "sum_digits negative" { assert_eq(sum_digits(-42), 6) }
   |                                                    ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:12:45
  in call to sum_digits()
  hint: Check the function name
   |
12 | test "sum_digits 10" { assert_eq(sum_digits(10), 1) }
   |                                             ^^
error[E002]: undefined function 'sum_digits'
  --> /tmp/dojo-sum-digits-1.almd:13:46
  in call to sum_digits()
  hint: Check the function name
   |
13 | test "sum_digits 100" { assert_eq(sum_digits(100), 1) }
   |                                              ^^^

9 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  if int.abs(n) == 0 then 0 
  else (int.abs(n) % 10) + sum_digits(int.abs(n) / 10)
```
