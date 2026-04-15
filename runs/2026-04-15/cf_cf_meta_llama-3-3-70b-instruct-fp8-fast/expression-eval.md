# expression-eval

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr {
    | Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(a) => -eval(a)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-0.almd:9:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Num(n) => n
  |     ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:15:38
  in call to eval()
  hint: Check the function name
   |
15 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
   |                                      ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:16:50
  in call to eval()
  hint: Check the function name
   |
16 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
   |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:17:50
  in call to eval()
  hint: Check the function name
   |
17 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:18:42
  in call to eval()
  hint: Check the function name
   |
18 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:19:74
  in call to eval()
  hint: Check the function name
   |
19 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:20:53
  in call to eval()
  hint: Check the function name
   |
20 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:21:79
  in call to eval()
  hint: Check the function name
   |
21 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:22:62
  in call to eval()
  hint: Check the function name
   |
22 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:23:39
  in call to eval()
  hint: Check the function name
   |
23 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E002]: undefined function 'eval'
  --> /tmp/dojo-expression-eval-0.almd:24:85
  in call to eval()
  hint: Check the function name
   |
24 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

11 error(s) found
Compile error for /tmp/dojo-expression-eval-0.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr {
    Num(n) => n
    Add(a, b) => eval(a) + eval(b)
    Mul(a, b) => eval(a) * eval(b)
    Neg(a) => -eval(a)
  }
```
