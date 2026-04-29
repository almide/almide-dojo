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

This code defines the `Expr` type as an ADT with four variants: `Num`, `Add`, `Mul`, and `Neg`. The `eval` function uses pattern matching to recursively evaluate the expression. 

- `Num(n)` matches a `Num` variant and returns the integer value `n`.
- `Add(a, b)` matches an `Add` variant and recursively evaluates both `a` and `b`, then returns their sum.
- `Mul(a, b)` matches a `Mul` variant and recursively evaluates both `a` and `b`, then returns their product.
- `Neg(a)` matches a `Neg` variant and recursively evaluates `a`, then returns its negation.

This implementation ensures that nested expressions are evaluated correctly.
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:1 (got TypeName 'This')
  --> /tmp/dojo-expression-eval-0.almd:15:1
   |
15 | This code defines the `Expr` type as an ADT with four variants: `Num`, `Add`, `Mul`, and `Neg`. The `eval` function uses pattern matching to recursively evaluate the expression.
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
