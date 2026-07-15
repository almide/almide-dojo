# expression-eval

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn eval(expr: Expr) -> Int = match expr {
  Num(n) => n
  Add(a, b) => eval(a) + eval(b)
  Mul(a, b) => eval(a) * eval(b)
  Neg(a) => -eval(a)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error[E005]: argument 'expr' expects Expr but got Num
  --> /tmp/dojo-expression-eval-0.almd:8:38
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
  |
1 | fn eval(expr: Expr) -> Int = match expr {
  | ---------------------- fn eval() defined here
...
8 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
  |                                      ^^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:9:50
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
  |
1 | fn eval(expr: Expr) -> Int = match expr {
  | ---------------------- fn eval() defined here
...
9 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  |                                                  ^
error[E005]: argument 'expr' expects Expr but got Mul
  --> /tmp/dojo-expression-eval-0.almd:10:50
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int = match expr {
   | ---------------------- fn eval() defined here
...
10 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E005]: argument 'expr' expects Expr but got Neg
  --> /tmp/dojo-expression-eval-0.almd:11:42
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int = match expr {
   | ---------------------- fn eval() defined here
...
11 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:12:74
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int = match expr {
   | ---------------------- fn eval() defined here
...
12 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E005]: argument 'expr' expects Expr but got Neg
  --> /tmp/dojo-expression-eval-0.almd:13:53
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int = match expr {
   | ---------------------- fn eval() defined here
...
13 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E005]: argument 'expr' expects Expr but got Mul
  --> /tmp/dojo-expression-eval-0.almd:14:79
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int = match expr {
   | ---------------------- fn eval() defined here
...
14 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:15:62
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int = match expr {
   | ---------------------- fn eval() defined here
...
15 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E005]: argument 'expr' expects Expr but got Num
  --> /tmp/dojo-expression-eval-0.almd:16:39
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int = match expr {
   | ---------------------- fn eval() defined here
...
16 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:17:85
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
 1 | fn eval(expr: Expr) -> Int = match expr {
   | ---------------------- fn eval() defined here
...
17 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^
error[E001]: type mismatch in call to eval(): expected Expr but got Num
  --> /tmp/dojo-expression-eval-0.almd:8:38
  in call to eval()
  hint: Fix the expression type or change the expected type
  |
8 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
  |                                      ^^
error[E001]: type mismatch in call to eval(): expected Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:9:50
  in call to eval()
  hint: Fix the expression type or change the expected type
  |
9 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
  |                                                  ^
error[E001]: type mismatch in call to eval(): expected Expr but got Mul
  --> /tmp/dojo-expression-eval-0.almd:10:50
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
10 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E001]: type mismatch in call to eval(): expected Expr but got Neg
  --> /tmp/dojo-expression-eval-0.almd:11:42
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
11 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E001]: type mismatch in call to eval(): expected Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:12:74
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
12 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E001]: type mismatch in call to eval(): expected Expr but got Neg
  --> /tmp/dojo-expression-eval-0.almd:13:53
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
13 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E001]: type mismatch in call to eval(): expected Expr but got Mul
  --> /tmp/dojo-expression-eval-0.almd:14:79
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
14 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E001]: type mismatch in call to eval(): expected Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:15:62
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
15 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E001]: type mismatch in call to eval(): expected Expr but got Num
  --> /tmp/dojo-expression-eval-0.almd:16:39
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
16 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E001]: type mismatch in call to eval(): expected Expr but got Add
  --> /tmp/dojo-expression-eval-0.almd:17:85
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
17 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

20 error(s) found
Compile error for /tmp/dojo-expression-eval-0.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
type Expr = | Num(Int) | Add(Expr, Expr) | Mul(Expr, Expr) | Neg(Expr)

fn eval(expr: Expr) -> Int = match expr {
  Num(n) => n
  Add(a, b) => eval(a) + eval(b)
  Mul(a, b) => eval(a) * eval(b)
  Neg(a) => -eval(a)
}
```
