# expression-eval

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
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
error: Expected LBrace at line 3:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-0.almd:3:3
  |
3 |   | Num(n) => n
  |   ^

1 error(s) found
Compile error for /tmp/dojo-expression-eval-0.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn eval(expr: Expr) -> Int =
  match expr
  { Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a) }
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-1.almd
error: Expected pattern at line 4:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-1.almd:4:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |   | Add(a, b) => eval(a) + eval(b)
  |   ^

1 error(s) found
Compile error for /tmp/dojo-expression-eval-1.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn eval(expr: Expr) -> Int =
  match expr
  { Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a) }

fn eval(expr: Expr) -> Int =
  match expr
  { Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a) }

fn eval(expr: Expr) -> Int =
  match expr
  { Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a) }

fn eval(expr: Expr) -> Int =
  match expr
  { Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a) }

fn eval(expr: Expr) -> Int
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-2.almd
error: Expected pattern at line 4:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:4:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |   | Add(a, b) => eval(a) + eval(b)
  |   ^
error: Expected pattern at line 11:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:11:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |   | Add(a, b) => eval(a) + eval(b)
   |   ^
error: Expected pattern at line 18:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:18:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
18 |   | Add(a, b) => eval(a) + eval(b)
   |   ^
error: Expected pattern at line 25:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:25:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
25 |   | Add(a, b) => eval(a) + eval(b)
   |   ^
error[E005]: argument 'expr' expects Expr but got Num
  --> /tmp/dojo-expression-eval-2.almd:31:38
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
29 | fn eval(expr: Expr) -> Int
   | ---------------------- fn eval() defined here
...
31 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
   |                                      ^^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-2.almd:32:50
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
29 | fn eval(expr: Expr) -> Int
   | ---------------------- fn eval() defined here
...
32 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
   |                                                  ^
error[E005]: argument 'expr' expects Expr but got Mul
  --> /tmp/dojo-expression-eval-2.almd:33:50
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
29 | fn eval(expr: Expr) -> Int
   | ---------------------- fn eval() defined here
...
33 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E005]: argument 'expr' expects Expr but got Neg
  --> /tmp/dojo-expression-eval-2.almd:34:42
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
29 | fn eval(expr: Expr) -> Int
   | ---------------------- fn eval() defined here
...
34 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-2.almd:35:74
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
29 | fn eval(expr: Expr) -> Int
   | ---------------------- fn eval() defined here
...
35 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E005]: argument 'expr' expects Expr but got Neg
  --> /tmp/dojo-expression-eval-2.almd:36:53
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
29 | fn eval(expr: Expr) -> Int
   | ---------------------- fn eval() defined here
...
36 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E005]: argument 'expr' expects Expr but got Mul
  --> /tmp/dojo-expression-eval-2.almd:37:79
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
29 | fn eval(expr: Expr) -> Int
   | ---------------------- fn eval() defined here
...
37 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-2.almd:38:62
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
29 | fn eval(expr: Expr) -> Int
   | ---------------------- fn eval() defined here
...
38 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E005]: argument 'expr' expects Expr but got Num
  --> /tmp/dojo-expression-eval-2.almd:39:39
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
29 | fn eval(expr: Expr) -> Int
   | ---------------------- fn eval() defined here
...
39 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E005]: argument 'expr' expects Expr but got Add
  --> /tmp/dojo-expression-eval-2.almd:40:85
  in call to eval()
  hint: 'Expr' is not a known type. To use it as a type parameter, declare it: fn eval[Expr](...)
   |
29 | fn eval(expr: Expr) -> Int
   | ---------------------- fn eval() defined here
...
40 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^
error[E001]: type mismatch in call to eval(): expected Expr but got Num
  --> /tmp/dojo-expression-eval-2.almd:31:38
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
31 | test "eval Num" { assert_eq(eval(Num(42)), 42) }
   |                                      ^^
error[E001]: type mismatch in call to eval(): expected Expr but got Add
  --> /tmp/dojo-expression-eval-2.almd:32:50
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
32 | test "eval Add" { assert_eq(eval(Add(Num(1), Num(2))), 3) }
   |                                                  ^
error[E001]: type mismatch in call to eval(): expected Expr but got Mul
  --> /tmp/dojo-expression-eval-2.almd:33:50
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
33 | test "eval Mul" { assert_eq(eval(Mul(Num(3), Num(4))), 12) }
   |                                                  ^
error[E001]: type mismatch in call to eval(): expected Expr but got Neg
  --> /tmp/dojo-expression-eval-2.almd:34:42
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
34 | test "eval Neg" { assert_eq(eval(Neg(Num(5))), -5) }
   |                                          ^
error[E001]: type mismatch in call to eval(): expected Expr but got Add
  --> /tmp/dojo-expression-eval-2.almd:35:74
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
35 | test "eval nested add mul" { assert_eq(eval(Add(Mul(Num(2), Num(3)), Num(1))), 7) }
   |                                                                          ^
error[E001]: type mismatch in call to eval(): expected Expr but got Neg
  --> /tmp/dojo-expression-eval-2.almd:36:53
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
36 | test "eval double neg" { assert_eq(eval(Neg(Neg(Num(10)))), 10) }
   |                                                     ^^
error[E001]: type mismatch in call to eval(): expected Expr but got Mul
  --> /tmp/dojo-expression-eval-2.almd:37:79
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
37 | test "eval complex" { assert_eq(eval(Mul(Add(Num(1), Num(2)), Add(Num(3), Num(4)))), 21) }
   |                                                                               ^
error[E001]: type mismatch in call to eval(): expected Expr but got Add
  --> /tmp/dojo-expression-eval-2.almd:38:62
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
38 | test "eval neg in add" { assert_eq(eval(Add(Num(10), Neg(Num(3)))), 7) }
   |                                                              ^
error[E001]: type mismatch in call to eval(): expected Expr but got Num
  --> /tmp/dojo-expression-eval-2.almd:39:39
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
39 | test "eval zero" { assert_eq(eval(Num(0)), 0) }
   |                                       ^
error[E001]: type mismatch in call to eval(): expected Expr but got Add
  --> /tmp/dojo-expression-eval-2.almd:40:85
  in call to eval()
  hint: Fix the expression type or change the expected type
   |
40 | test "eval deep nesting" { assert_eq(eval(Add(Add(Add(Num(1), Num(2)), Num(3)), Num(4))), 10) }
   |                                                                                     ^

24 error(s) found
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
  { Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(a) => -eval(a) }
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-3.almd
error: Expected pattern at line 10:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-3.almd:10:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
10 |   | Add(a, b) => eval(a) + eval(b)
   |   ^

1 error(s) found
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-3.almd

1/1 test file(s) failed

```
