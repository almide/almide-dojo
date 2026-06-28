# expression-eval

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

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

1 error(s) found
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
  | Neg(a) => -(eval(a))
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-1.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-1.almd:9:3
  |
9 |   | Num(n) => n
  |   ^

1 error(s) found
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
  | Neg(a) => -(eval(a))
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-2.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:9:3
  |
9 |   | Num(n) => n
  |   ^

1 error(s) found
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
  | Neg(a) => -(eval(a))

// Test cases
fn test() -> Unit =
  assert(eval(Num(5)) == 5)
  assert(eval(Add(Num(1), Num(2))) == 3)
  assert(eval(Mul(Num(3), Num(4))) == 12)
  assert(eval(Neg(Num(5))) == -5)
  assert(eval(Add(Mul(Num(2), Num(3)), Num(1))) == 7)
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-3.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-3.almd:9:3
  |
9 |   | Num(n) => n
  |   ^
error: Expected function name at line 15:4 (got Test 'test')
  --> /tmp/dojo-expression-eval-3.almd:15:4
   |
15 | fn test() -> Unit =
   |    ^
error: Expected String at line 15:8 (got LParen '(')
  --> /tmp/dojo-expression-eval-3.almd:15:8
   |
15 | fn test() -> Unit =
   |        ^

3 error(s) found
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-3.almd

1/1 test file(s) failed

```
