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
  match expr {
    | Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(e) => -eval(e)
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-0.almd:9:5
  here: | Num(n) => n
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Num(n) => n
  |     ^

1 error(s) found
FAILED: /tmp/dojo-expression-eval-0.almd
Compile error for /tmp/dojo-expression-eval-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr {
    | Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(e) => -(eval(e))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-1.almd:9:5
  here: | Num(n) => n
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Num(n) => n
  |     ^

1 error(s) found
FAILED: /tmp/dojo-expression-eval-1.almd
Compile error for /tmp/dojo-expression-eval-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr {
    | Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(e) => -(eval(e))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:9:5
  here: | Num(n) => n
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Num(n) => n
  |     ^

1 error(s) found
FAILED: /tmp/dojo-expression-eval-2.almd
Compile error for /tmp/dojo-expression-eval-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
type Expr =
  | Num(Int)
  | Add(Expr, Expr)
  | Mul(Expr, Expr)
  | Neg(Expr)

fn eval(expr: Expr) -> Int =
  match expr {
    | Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(e) => -(eval(e))
  }
```

**Diagnostic:**

```
error: Expected pattern at line 9:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-3.almd:9:5
  here: | Num(n) => n
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
9 |     | Num(n) => n
  |     ^

1 error(s) found
FAILED: /tmp/dojo-expression-eval-3.almd
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
