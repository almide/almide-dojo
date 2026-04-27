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
    Add(a, b) => eval(a) + eval(b)
    Mul(a, b) => eval(a) * eval(b)
    Neg(a) => -eval(a)
  }

This evaluator uses pattern matching to recursively evaluate the expression. The `eval` function is defined to handle each variant of the `Expr` type:

- `Num(n)` returns the integer value `n`.
- `Add(a, b)` recursively evaluates `a` and `b` and returns their sum.
- `Mul(a, b)` recursively evaluates `a` and `b` and returns their product.
- `Neg(a)` recursively evaluates `a` and returns its negation.

This implementation ensures that nested expressions are evaluated correctly, as demonstrated by the example `eval(Add(Mul(Num(2), Num(3)), Num(1)))`, which returns `7`.
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:1 (got TypeName 'This')
  --> /tmp/dojo-expression-eval-0.almd:15:1
   |
15 | This evaluator uses pattern matching to recursively evaluate the expression. The `eval` function is defined to handle each variant of the `Expr` type:
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
    Add(a, b) => eval(a) + eval(b)
    Mul(a, b) => eval(a) * eval(b)
    Neg(a) => -eval(a)
  }
```
