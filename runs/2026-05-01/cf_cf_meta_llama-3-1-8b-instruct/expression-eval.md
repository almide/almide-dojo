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

This `eval` function uses pattern matching to handle each variant of the `Expr` type. For `Num(n)`, it simply returns the value `n`. For `Add(a, b)`, it recursively evaluates `a` and `b` and adds their results. For `Mul(a, b)`, it recursively evaluates `a` and `b` and multiplies their results. For `Neg(a)`, it recursively evaluates `a` and negates its result.
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:1 (got TypeName 'This')
  --> /tmp/dojo-expression-eval-0.almd:15:1
   |
15 | This `eval` function uses pattern matching to handle each variant of the `Expr` type. For `Num(n)`, it simply returns the value `n`. For `Add(a, b)`, it recursively evaluates `a` and `b` and adds their results. For `Mul(a, b)`, it recursively evaluates `a` and `b` and multiplies their results. For `Neg(a)`, it recursively evaluates `a` and negates its result.
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
