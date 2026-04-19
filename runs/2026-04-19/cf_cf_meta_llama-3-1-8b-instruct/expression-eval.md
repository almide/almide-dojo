# expression-eval

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 0
- **category**: pass-1shot

## Attempts

### Attempt 1 (PASS)

```almide
## AST Type and Evaluator

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

This evaluator uses pattern matching to handle each variant of the `Expr` type. For `Num`, it simply returns the integer value. For `Add` and `Mul`, it recursively evaluates the left and right operands and then performs the corresponding operation. For `Neg`, it recursively evaluates the operand and negates the result.
```
