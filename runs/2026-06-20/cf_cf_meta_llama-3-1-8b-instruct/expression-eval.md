# expression-eval

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn eval(expr: Expr) -> Int = 
  match expr {
    | Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(a) => -eval(a)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-0.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | Num(n) => n
  |     ^

1 error(s) found
Compile error for /tmp/dojo-expression-eval-0.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn eval(expr: Expr) -> Int = 
  match expr {
    | Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(a) => -eval(a)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-1.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-1.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | Num(n) => n
  |     ^

1 error(s) found
Compile error for /tmp/dojo-expression-eval-1.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn eval(expr: Expr) -> Int = 
  match expr {
    | Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(a) => -(eval(a))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-2.almd
error: Expected pattern at line 3:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:3:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |     | Num(n) => n
  |     ^

1 error(s) found
Compile error for /tmp/dojo-expression-eval-2.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn eval(expr: Expr) -> Int = 
  match expr {
    Num(n) => n
    | Add(a, b) => eval(a) + eval(b)
    | Mul(a, b) => eval(a) * eval(b)
    | Neg(a) => -(eval(a))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-3.almd
error: Expected pattern at line 4:5 (got Pipe '|')
  --> /tmp/dojo-expression-eval-3.almd:4:5
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
4 |     | Add(a, b) => eval(a) + eval(b)
  |     ^

1 error(s) found
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-3.almd

1/1 test file(s) failed

```
