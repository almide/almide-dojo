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

fn eval(expr: Expr) -> Int {
  match expr {
    Num(n) => n
    Add(a, b) => eval(a) + eval(b)
    Mul(a, b) => eval(a) * eval(b)
    Neg(e) => -eval(e)
  }
}

This evaluator recursively breaks down the expression into its constituent parts, evaluates each part, and then combines the results according to the operator. The `match` statement is used to pattern-match the `expr` against the different variants of the `Expr` type, and the corresponding evaluation logic is applied in each case.
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error: Missing '=' before function body at line 7:28
  --> /tmp/dojo-expression-eval-0.almd:7:28
  hint: Almide requires '=' before the body. Write: fn eval(...) -> Type = { ... }
  |
7 | fn eval(expr: Expr) -> Int {
  |                            ^

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
    Neg(e) => -eval(e)
  }
```
