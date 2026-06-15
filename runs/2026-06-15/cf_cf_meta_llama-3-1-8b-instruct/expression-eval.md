# expression-eval

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
Compiling /tmp/dojo-expression-eval-0.almd
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:3:38
  in call to eval()
  hint: Check the function name
  |
3 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
  |                                      ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:4:50
  in call to eval()
  hint: Check the function name
  |
4 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:5:50
  in call to eval()
  hint: Check the function name
  |
5 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
  |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:6:42
  in call to eval()
  hint: Check the function name
  |
6 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
  |                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:7:74
  in call to eval()
  hint: Check the function name
  |
7 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
  |                                                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:8:53
  in call to eval()
  hint: Check the function name
  |
8 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
  |                                                     ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:9:79
  in call to eval()
  hint: Check the function name
  |
9 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  |                                                                               ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:10:62
  in call to eval()
  hint: Check the function name
   |
10 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:11:39
  in call to eval()
  hint: Check the function name
   |
11 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:12:85
  in call to eval()
  hint: Check the function name
   |
12 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

10 error(s) found
Compile error for /tmp/dojo-expression-eval-0.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-1.almd
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:3:38
  in call to eval()
  hint: Check the function name
  |
3 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
  |                                      ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:4:50
  in call to eval()
  hint: Check the function name
  |
4 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:5:50
  in call to eval()
  hint: Check the function name
  |
5 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
  |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:6:42
  in call to eval()
  hint: Check the function name
  |
6 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
  |                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:7:74
  in call to eval()
  hint: Check the function name
  |
7 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
  |                                                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:8:53
  in call to eval()
  hint: Check the function name
  |
8 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
  |                                                     ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:9:79
  in call to eval()
  hint: Check the function name
  |
9 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  |                                                                               ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:10:62
  in call to eval()
  hint: Check the function name
   |
10 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:11:39
  in call to eval()
  hint: Check the function name
   |
11 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:12:85
  in call to eval()
  hint: Check the function name
   |
12 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

10 error(s) found
Compile error for /tmp/dojo-expression-eval-1.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-2.almd
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:3:38
  in call to eval()
  hint: Check the function name
  |
3 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
  |                                      ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:4:50
  in call to eval()
  hint: Check the function name
  |
4 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:5:50
  in call to eval()
  hint: Check the function name
  |
5 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
  |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:6:42
  in call to eval()
  hint: Check the function name
  |
6 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
  |                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:7:74
  in call to eval()
  hint: Check the function name
  |
7 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
  |                                                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:8:53
  in call to eval()
  hint: Check the function name
  |
8 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
  |                                                     ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:9:79
  in call to eval()
  hint: Check the function name
  |
9 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  |                                                                               ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:10:62
  in call to eval()
  hint: Check the function name
   |
10 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:11:39
  in call to eval()
  hint: Check the function name
   |
11 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:12:85
  in call to eval()
  hint: Check the function name
   |
12 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

10 error(s) found
Compile error for /tmp/dojo-expression-eval-2.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-3.almd
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:3:38
  in call to eval()
  hint: Check the function name
  |
3 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
  |                                      ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:4:50
  in call to eval()
  hint: Check the function name
  |
4 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:5:50
  in call to eval()
  hint: Check the function name
  |
5 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
  |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:6:42
  in call to eval()
  hint: Check the function name
  |
6 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
  |                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:7:74
  in call to eval()
  hint: Check the function name
  |
7 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
  |                                                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:8:53
  in call to eval()
  hint: Check the function name
  |
8 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
  |                                                     ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:9:79
  in call to eval()
  hint: Check the function name
  |
9 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
  |                                                                               ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:10:62
  in call to eval()
  hint: Check the function name
   |
10 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:11:39
  in call to eval()
  hint: Check the function name
   |
11 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:12:85
  in call to eval()
  hint: Check the function name
   |
12 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

10 error(s) found
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-3.almd

1/1 test file(s) failed

```
