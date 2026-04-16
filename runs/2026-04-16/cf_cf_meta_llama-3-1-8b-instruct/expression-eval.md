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

This evaluator uses pattern matching to handle each variant of the `Expr` type. For `Num(n)`, it simply returns the value `n`. For `Add(a, b)`, it recursively evaluates `a` and `b` and adds their results. For `Mul(a, b)`, it recursively evaluates `a` and `b` and multiplies their results. For `Neg(a)`, it recursively evaluates `a` and negates its result.
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
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-3.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-3.almd:9:3
  |
9 |   | Num(n) => n
  |   ^

1 error(s) found
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-3.almd

1/1 test file(s) failed

```
