# expression-eval

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a)
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-0.almd:9:3
  |
9 |   | Num(n) => n
  |   ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:14:38
  in call to eval()
  hint: Check the function name
   |
14 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
   |                                      ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:15:50
  in call to eval()
  hint: Check the function name
   |
15 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
   |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:16:50
  in call to eval()
  hint: Check the function name
   |
16 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:17:42
  in call to eval()
  hint: Check the function name
   |
17 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:18:74
  in call to eval()
  hint: Check the function name
   |
18 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:19:53
  in call to eval()
  hint: Check the function name
   |
19 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:20:79
  in call to eval()
  hint: Check the function name
   |
20 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:21:62
  in call to eval()
  hint: Check the function name
   |
21 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:22:39
  in call to eval()
  hint: Check the function name
   |
22 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:23:85
  in call to eval()
  hint: Check the function name
   |
23 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

11 error(s) found
Compile error for /tmp/dojo-expression-eval-0.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a)

fn test_eval() =
  assert_eq(eval(Num(42)), 42)
  assert_eq(eval(Add(Num(1), Num(2))), 3)
  assert_eq(eval(Mul(Num(3), Num(4))), 12)
  assert_eq(eval(Neg(Num(5))), -5)
  assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7)
  assert_eq(eval(Neg(Neg(Num(10)))), 10)
  assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21)
  assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7)
  assert_eq(eval(Num(0
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-1.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-1.almd:9:3
  |
9 |   | Num(n) => n
  |   ^
error: Expected Arrow at line 14:16 (got Eq '=')
  --> /tmp/dojo-expression-eval-1.almd:14:16
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
   |
14 | fn test_eval() =
   |                ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:25:38
  in call to eval()
  hint: Check the function name
   |
25 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
   |                                      ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:26:50
  in call to eval()
  hint: Check the function name
   |
26 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
   |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:27:50
  in call to eval()
  hint: Check the function name
   |
27 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:28:42
  in call to eval()
  hint: Check the function name
   |
28 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:29:74
  in call to eval()
  hint: Check the function name
   |
29 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:30:53
  in call to eval()
  hint: Check the function name
   |
30 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:31:79
  in call to eval()
  hint: Check the function name
   |
31 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:32:62
  in call to eval()
  hint: Check the function name
   |
32 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:33:39
  in call to eval()
  hint: Check the function name
   |
33 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-1.almd:34:85
  in call to eval()
  hint: Check the function name
   |
34 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

12 error(s) found
Compile error for /tmp/dojo-expression-eval-1.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a)

fn test_eval() =
  assert_eq(eval(Num(42)), 42)
  assert_eq(eval(Add(Num(1), Num(2))), 3)
  assert_eq(eval(Mul(Num(3), Num(4))), 12)
  assert_eq(eval(Neg(Num(5))), -5)
  assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7)
  assert_eq(eval(Neg(Neg(Num(10)))), 10)
  assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21)
  assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7)
  assert_eq(eval(Num(0
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-2.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:9:3
  |
9 |   | Num(n) => n
  |   ^
error: Expected Arrow at line 14:16 (got Eq '=')
  --> /tmp/dojo-expression-eval-2.almd:14:16
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
   |
14 | fn test_eval() =
   |                ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:25:38
  in call to eval()
  hint: Check the function name
   |
25 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
   |                                      ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:26:50
  in call to eval()
  hint: Check the function name
   |
26 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
   |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:27:50
  in call to eval()
  hint: Check the function name
   |
27 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:28:42
  in call to eval()
  hint: Check the function name
   |
28 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:29:74
  in call to eval()
  hint: Check the function name
   |
29 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:30:53
  in call to eval()
  hint: Check the function name
   |
30 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:31:79
  in call to eval()
  hint: Check the function name
   |
31 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:32:62
  in call to eval()
  hint: Check the function name
   |
32 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:33:39
  in call to eval()
  hint: Check the function name
   |
33 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-2.almd:34:85
  in call to eval()
  hint: Check the function name
   |
34 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

12 error(s) found
Compile error for /tmp/dojo-expression-eval-2.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a)

fn test_eval() =
  assert_eq(eval(Num(42)), 42)
  assert_eq(eval(Add(Num(1), Num(2))), 3)
  assert_eq(eval(Mul(Num(3), Num(4))), 12)
  assert_eq(eval(Neg(Num(5))), -5)
  assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7)
  assert_eq(eval(Neg(Neg(Num(10)))), 10)
  assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21)
  assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7)
  assert_eq(eval(Num(0
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-3.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-3.almd:9:3
  |
9 |   | Num(n) => n
  |   ^
error: Expected Arrow at line 14:16 (got Eq '=')
  --> /tmp/dojo-expression-eval-3.almd:14:16
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
   |
14 | fn test_eval() =
   |                ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:25:38
  in call to eval()
  hint: Check the function name
   |
25 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
   |                                      ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:26:50
  in call to eval()
  hint: Check the function name
   |
26 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
   |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:27:50
  in call to eval()
  hint: Check the function name
   |
27 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:28:42
  in call to eval()
  hint: Check the function name
   |
28 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:29:74
  in call to eval()
  hint: Check the function name
   |
29 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:30:53
  in call to eval()
  hint: Check the function name
   |
30 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:31:79
  in call to eval()
  hint: Check the function name
   |
31 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:32:62
  in call to eval()
  hint: Check the function name
   |
32 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:33:39
  in call to eval()
  hint: Check the function name
   |
33 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-3.almd:34:85
  in call to eval()
  hint: Check the function name
   |
34 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

12 error(s) found
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-3.almd

1/1 test file(s) failed

```
