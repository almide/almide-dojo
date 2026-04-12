# expression-eval

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2

## Final code

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
