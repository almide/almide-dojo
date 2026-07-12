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
  | Neg(e) => -eval(e)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-0.almd
error: Expected pattern at line 3:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-0.almd:3:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |   | Num(n) => n
  |   ^

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
  | Neg(e) => -(eval(e))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-1.almd
error: Expected pattern at line 3:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-1.almd:3:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |   | Num(n) => n
  |   ^

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
  | Neg(e) => -(eval(e))
  }

fn eval(expr: Expr) -> Int =
  match expr {
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(e) => -(eval(e))
  }

fn eval(expr: Expr) -> Int =
  match expr {
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(e) => -(eval(e))
  }

fn eval(expr: Expr) -> Int =
  match expr {
  | Num(n) => n
  | Add(a, b) => eval(a) + eval(b)
  | Mul(a, b) => eval(a) * eval(b)
  | Neg(e) => -(eval(e))
  }

fn eval(expr:
```

**Diagnostic:**

```
Compiling /tmp/dojo-expression-eval-2.almd
error: Expected pattern at line 3:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:3:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |   | Num(n) => n
  |   ^
error: Expected pattern at line 11:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:11:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
11 |   | Num(n) => n
   |   ^
error: Expected pattern at line 19:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:19:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
19 |   | Num(n) => n
   |   ^
error: Expected pattern at line 27:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-2.almd:27:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
27 |   | Num(n) => n
   |   ^
error: Expected type name at line 33:14 (got Newline '')
  --> /tmp/dojo-expression-eval-2.almd:33:14
   |
33 | fn eval(expr:
   |              ^

5 error(s) found
Compile error for /tmp/dojo-expression-eval-2.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
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
Compiling /tmp/dojo-expression-eval-3.almd
error: Expected pattern at line 3:3 (got Pipe '|')
  --> /tmp/dojo-expression-eval-3.almd:3:3
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
  |
3 |   | Num(n) => n
  |   ^

1 error(s) found
Compile error for /tmp/dojo-expression-eval-3.almd:
compile failed
FAILED: /tmp/dojo-expression-eval-3.almd

1/1 test file(s) failed

```
