Define an AST type and write an evaluator for simple arithmetic expressions.

Define this exact type:

    type Expr =
      | Num(Int)
      | Add(Expr, Expr)
      | Mul(Expr, Expr)
      | Neg(Expr)

Write a function with this exact signature:

    fn eval(expr: Expr) -> Int

Behavior:

- `eval(Num(5))` returns `5`
- `eval(Add(Num(1), Num(2)))` returns `3`
- `eval(Mul(Num(3), Num(4)))` returns `12`
- `eval(Neg(Num(5)))` returns `-5`
- Nested expressions: `eval(Add(Mul(Num(2), Num(3)), Num(1)))` returns `7`

Notes:

- Use `match` with pattern matching on the variant constructors.
- Almide ADTs use `|` to define variants.
- Recursive evaluation: `eval(Add(a, b))` should evaluate both `a` and `b` recursively.
