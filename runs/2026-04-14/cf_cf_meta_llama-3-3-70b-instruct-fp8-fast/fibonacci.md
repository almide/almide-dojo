# fibonacci

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1

## Attempts

### Attempt 1 (FAIL)

```almide
def fibonacci(n: Int): Int = 
  if n == 0 then 0
  else if n == 1 then 1
  else fibonacci(n - 1) + fibonacci(n - 2)
```

**Diagnostic:**

```
Compiling /tmp/dojo-fibonacci-0.almd
error: 'def' is not a keyword in Almide at line 1:1
  --> /tmp/dojo-fibonacci-0.almd:1:1
  hint: Use 'fn name(...) -> Type = expr' or 'effect fn name(...) -> Result[T, E] = expr'.
  |
1 | def fibonacci(n: Int): Int =
  | ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:6:47
  in call to fibonacci()
  hint: Check the function name
  |
6 | test "fibonacci 0 is 0" { assert_eq(fibonacci(0), 0) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:7:47
  in call to fibonacci()
  hint: Check the function name
  |
7 | test "fibonacci 1 is 1" { assert_eq(fibonacci(1), 1) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:8:47
  in call to fibonacci()
  hint: Check the function name
  |
8 | test "fibonacci 2 is 1" { assert_eq(fibonacci(2), 1) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:9:47
  in call to fibonacci()
  hint: Check the function name
  |
9 | test "fibonacci 3 is 2" { assert_eq(fibonacci(3), 2) }
  |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:10:47
  in call to fibonacci()
  hint: Check the function name
   |
10 | test "fibonacci 5 is 5" { assert_eq(fibonacci(5), 5) }
   |                                               ^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:11:49
  in call to fibonacci()
  hint: Check the function name
   |
11 | test "fibonacci 10 is 55" { assert_eq(fibonacci(10), 55) }
   |                                                 ^^
error[E002]: undefined function 'fibonacci'
  --> /tmp/dojo-fibonacci-0.almd:12:50
  in call to fibonacci()
  hint: Check the function name
   |
12 | test "fibonacci 15 is 610" { assert_eq(fibonacci(15), 610) }
   |                                                  ^^

8 error(s) found
Compile error for /tmp/dojo-fibonacci-0.almd:
compile failed
FAILED: /tmp/dojo-fibonacci-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn fibonacci(n: Int) -> Int = 
  if n == 0 then 0
  else if n == 1 then 1
  else fibonacci(n - 1) + fibonacci(n - 2)
```
