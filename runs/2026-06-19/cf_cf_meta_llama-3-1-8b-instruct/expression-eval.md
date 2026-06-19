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

fn main() = 
  let result1 = eval(Num(5))
  let result2 = eval(Add(Num(1), Num(2)))
  let result3 = eval(Mul(Num(3), Num(4)))
  let result4 = eval(Neg(Num(5)))
  let result5 = eval(Add(Mul(Num(2), Num(3)), Num(1)))

  println(string.to_string(result1))
  println(string.to_string(result2))
  println(string.to_string(result3))
  println(string.to_string(result4))
  println(string.to_string(result5))
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-1.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-1.almd:9:3
  |
9 |   | Num(n) => n
  |   ^
error: Expected Arrow at line 14:11 (got Eq '=')
  --> /tmp/dojo-expression-eval-1.almd:14:11
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
   |
14 | fn main() =
   |           ^

2 error(s) found
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

fn main() = 
  let result1 = eval(Num(5))
  let result2 = eval(Add(Num(1), Num(2)))
  let result3 = eval(Mul(Num(3), Num(4)))
  let result4 = eval(Neg(Num(5)))
  let result5 = eval(Add(Mul(Num(2), Num(3)), Num(1)))

  println(string.to_string(result1))
  println(string.to_string(result2))
  println(string.to_string(result3))
  println(string.to_string(result4))
  println(string.to_string(result5))
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-2.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:9:3
  |
9 |   | Num(n) => n
  |   ^
error: Expected Arrow at line 14:11 (got Eq '=')
  --> /tmp/dojo-expression-eval-2.almd:14:11
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
   |
14 | fn main() =
   |           ^

2 error(s) found
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

fn main() = 
  let result1 = eval(Num(5))
  let result2 = eval(Add(Num(1), Num(2)))
  let result3 = eval(Mul(Num(3), Num(4)))
  let result4 = eval(Neg(Num(5)))
  let result5 = eval(Add(Mul(Num(2), Num(3)), Num(1)))

  println(string.to_string(result1))
  println(string.to_string(result2))
  println(string.to_string(result3))
  println(string.to_string(result4))
  println(string.to_string(result5))
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-3.almd
error: Expected LBrace at line 9:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-3.almd:9:3
  |
9 |   | Num(n) => n
  |   ^
error: Expected Arrow at line 14:11 (got Eq '=')
  --> /tmp/dojo-expression-eval-3.almd:14:11
  hint: Use '->' for return type, not '='. Write: fn name() -> Type = body
   |
14 | fn main() =
   |           ^

2 error(s) found
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-3.almd

1/1 test file(s) failed

```
