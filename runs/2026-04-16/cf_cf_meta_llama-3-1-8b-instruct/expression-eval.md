# expression-eval

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
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
    Num(n) => n
    Add(left, right) => eval(left) + eval(right)
    Mul(left, right) => eval(left) * eval(right)
    Neg(expr) => -eval(expr)
  }

This evaluator uses pattern matching to handle each variant of the `Expr` type. For `Num`, it simply returns the integer value. For `Add` and `Mul`, it recursively evaluates the left and right expressions and then performs the addition or multiplication. For `Neg`, it recursively evaluates the expression and then negates the result.
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:1 (got TypeName 'This')
  --> /tmp/dojo-expression-eval-0.almd:15:1
   |
15 | This evaluator uses pattern matching to handle each variant of the `Expr` type. For `Num`, it simply returns the integer value. For `Add` and `Mul`, it recursively evaluates the left and right expressions and then performs the addition or multiplication. For `Neg`, it recursively evaluates the expression and then negates the result.
   | ^

1 error(s) found
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
    Add(left, right) => eval(left) + eval(right)
    Mul(left, right) => eval(left) * eval(right)
    Neg(expr) => -eval(expr)
  }
```
