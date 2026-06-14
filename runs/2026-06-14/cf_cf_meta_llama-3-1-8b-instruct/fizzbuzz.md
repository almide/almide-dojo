# fizzbuzz

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-0.almd
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-0.almd:3:49
  in call to fizzbuzz()
  hint: Check the function name
  |
3 | test "fizzbuzz 1 is \"1\"" { assert_eq(fizzbuzz(1), "1") }
  |                                                 ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-0.almd:4:49
  in call to fizzbuzz()
  hint: Check the function name
  |
4 | test "fizzbuzz 2 is \"2\"" { assert_eq(fizzbuzz(2), "2") }
  |                                                 ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-0.almd:5:48
  in call to fizzbuzz()
  hint: Check the function name
  |
5 | test "fizzbuzz 3 is Fizz" { assert_eq(fizzbuzz(3), "Fizz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-0.almd:6:48
  in call to fizzbuzz()
  hint: Check the function name
  |
6 | test "fizzbuzz 5 is Buzz" { assert_eq(fizzbuzz(5), "Buzz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-0.almd:7:48
  in call to fizzbuzz()
  hint: Check the function name
  |
7 | test "fizzbuzz 9 is Fizz" { assert_eq(fizzbuzz(9), "Fizz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-0.almd:8:49
  in call to fizzbuzz()
  hint: Check the function name
  |
8 | test "fizzbuzz 10 is Buzz" { assert_eq(fizzbuzz(10), "Buzz") }
  |                                                 ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-0.almd:9:53
  in call to fizzbuzz()
  hint: Check the function name
  |
9 | test "fizzbuzz 15 is FizzBuzz" { assert_eq(fizzbuzz(15), "FizzBuzz") }
  |                                                     ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-0.almd:10:53
  in call to fizzbuzz()
  hint: Check the function name
   |
10 | test "fizzbuzz 30 is FizzBuzz" { assert_eq(fizzbuzz(30), "FizzBuzz") }
   |                                                     ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-0.almd:11:49
  in call to fizzbuzz()
  hint: Check the function name
   |
11 | test "fizzbuzz 7 is \"7\"" { assert_eq(fizzbuzz(7), "7") }
   |                                                 ^

9 error(s) found
Compile error for /tmp/dojo-fizzbuzz-0.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-1.almd
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-1.almd:3:49
  in call to fizzbuzz()
  hint: Check the function name
  |
3 | test "fizzbuzz 1 is \"1\"" { assert_eq(fizzbuzz(1), "1") }
  |                                                 ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-1.almd:4:49
  in call to fizzbuzz()
  hint: Check the function name
  |
4 | test "fizzbuzz 2 is \"2\"" { assert_eq(fizzbuzz(2), "2") }
  |                                                 ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-1.almd:5:48
  in call to fizzbuzz()
  hint: Check the function name
  |
5 | test "fizzbuzz 3 is Fizz" { assert_eq(fizzbuzz(3), "Fizz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-1.almd:6:48
  in call to fizzbuzz()
  hint: Check the function name
  |
6 | test "fizzbuzz 5 is Buzz" { assert_eq(fizzbuzz(5), "Buzz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-1.almd:7:48
  in call to fizzbuzz()
  hint: Check the function name
  |
7 | test "fizzbuzz 9 is Fizz" { assert_eq(fizzbuzz(9), "Fizz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-1.almd:8:49
  in call to fizzbuzz()
  hint: Check the function name
  |
8 | test "fizzbuzz 10 is Buzz" { assert_eq(fizzbuzz(10), "Buzz") }
  |                                                 ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-1.almd:9:53
  in call to fizzbuzz()
  hint: Check the function name
  |
9 | test "fizzbuzz 15 is FizzBuzz" { assert_eq(fizzbuzz(15), "FizzBuzz") }
  |                                                     ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-1.almd:10:53
  in call to fizzbuzz()
  hint: Check the function name
   |
10 | test "fizzbuzz 30 is FizzBuzz" { assert_eq(fizzbuzz(30), "FizzBuzz") }
   |                                                     ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-1.almd:11:49
  in call to fizzbuzz()
  hint: Check the function name
   |
11 | test "fizzbuzz 7 is \"7\"" { assert_eq(fizzbuzz(7), "7") }
   |                                                 ^

9 error(s) found
Compile error for /tmp/dojo-fizzbuzz-1.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-2.almd
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-2.almd:3:49
  in call to fizzbuzz()
  hint: Check the function name
  |
3 | test "fizzbuzz 1 is \"1\"" { assert_eq(fizzbuzz(1), "1") }
  |                                                 ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-2.almd:4:49
  in call to fizzbuzz()
  hint: Check the function name
  |
4 | test "fizzbuzz 2 is \"2\"" { assert_eq(fizzbuzz(2), "2") }
  |                                                 ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-2.almd:5:48
  in call to fizzbuzz()
  hint: Check the function name
  |
5 | test "fizzbuzz 3 is Fizz" { assert_eq(fizzbuzz(3), "Fizz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-2.almd:6:48
  in call to fizzbuzz()
  hint: Check the function name
  |
6 | test "fizzbuzz 5 is Buzz" { assert_eq(fizzbuzz(5), "Buzz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-2.almd:7:48
  in call to fizzbuzz()
  hint: Check the function name
  |
7 | test "fizzbuzz 9 is Fizz" { assert_eq(fizzbuzz(9), "Fizz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-2.almd:8:49
  in call to fizzbuzz()
  hint: Check the function name
  |
8 | test "fizzbuzz 10 is Buzz" { assert_eq(fizzbuzz(10), "Buzz") }
  |                                                 ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-2.almd:9:53
  in call to fizzbuzz()
  hint: Check the function name
  |
9 | test "fizzbuzz 15 is FizzBuzz" { assert_eq(fizzbuzz(15), "FizzBuzz") }
  |                                                     ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-2.almd:10:53
  in call to fizzbuzz()
  hint: Check the function name
   |
10 | test "fizzbuzz 30 is FizzBuzz" { assert_eq(fizzbuzz(30), "FizzBuzz") }
   |                                                     ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-2.almd:11:49
  in call to fizzbuzz()
  hint: Check the function name
   |
11 | test "fizzbuzz 7 is \"7\"" { assert_eq(fizzbuzz(7), "7") }
   |                                                 ^

9 error(s) found
Compile error for /tmp/dojo-fizzbuzz-2.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-fizzbuzz-3.almd
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-3.almd:3:49
  in call to fizzbuzz()
  hint: Check the function name
  |
3 | test "fizzbuzz 1 is \"1\"" { assert_eq(fizzbuzz(1), "1") }
  |                                                 ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-3.almd:4:49
  in call to fizzbuzz()
  hint: Check the function name
  |
4 | test "fizzbuzz 2 is \"2\"" { assert_eq(fizzbuzz(2), "2") }
  |                                                 ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-3.almd:5:48
  in call to fizzbuzz()
  hint: Check the function name
  |
5 | test "fizzbuzz 3 is Fizz" { assert_eq(fizzbuzz(3), "Fizz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-3.almd:6:48
  in call to fizzbuzz()
  hint: Check the function name
  |
6 | test "fizzbuzz 5 is Buzz" { assert_eq(fizzbuzz(5), "Buzz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-3.almd:7:48
  in call to fizzbuzz()
  hint: Check the function name
  |
7 | test "fizzbuzz 9 is Fizz" { assert_eq(fizzbuzz(9), "Fizz") }
  |                                                ^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-3.almd:8:49
  in call to fizzbuzz()
  hint: Check the function name
  |
8 | test "fizzbuzz 10 is Buzz" { assert_eq(fizzbuzz(10), "Buzz") }
  |                                                 ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-3.almd:9:53
  in call to fizzbuzz()
  hint: Check the function name
  |
9 | test "fizzbuzz 15 is FizzBuzz" { assert_eq(fizzbuzz(15), "FizzBuzz") }
  |                                                     ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-3.almd:10:53
  in call to fizzbuzz()
  hint: Check the function name
   |
10 | test "fizzbuzz 30 is FizzBuzz" { assert_eq(fizzbuzz(30), "FizzBuzz") }
   |                                                     ^^
error[E002]: undefined function 'fizzbuzz'
  --> /tmp/dojo-fizzbuzz-3.almd:11:49
  in call to fizzbuzz()
  hint: Check the function name
   |
11 | test "fizzbuzz 7 is \"7\"" { assert_eq(fizzbuzz(7), "7") }
   |                                                 ^

9 error(s) found
Compile error for /tmp/dojo-fizzbuzz-3.almd:
compile failed
FAILED: /tmp/dojo-fizzbuzz-3.almd

1/1 test file(s) failed

```
