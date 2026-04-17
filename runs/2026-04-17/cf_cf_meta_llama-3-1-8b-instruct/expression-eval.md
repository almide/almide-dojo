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

This code defines the `Expr` type as a sum type with four variants: `Num`, `Add`, `Mul`, and `Neg`. The `eval` function uses pattern matching to recursively evaluate the expression. If the expression is a `Num`, it simply returns the number. If it's an `Add` or `Mul`, it recursively evaluates the two subexpressions and then performs the addition or multiplication. If it's a `Neg`, it recursively evaluates the subexpression and negates the result.
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:1 (got TypeName 'This')
  --> /tmp/dojo-expression-eval-0.almd:15:1
   |
15 | This code defines the `Expr` type as a sum type with four variants: `Num`, `Add`, `Mul`, and `Neg`. The `eval` function uses pattern matching to recursively evaluate the expression. If the expression is a `Num`, it simply returns the number. If it's an `Add` or `Mul`, it recursively evaluates the two subexpressions and then performs the addition or multiplication. If it's a `Neg`, it recursively evaluates the subexpression and negates the result.
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
