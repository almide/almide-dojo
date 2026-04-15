# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let rec sum = (n) => 
    if n == 0 then 0 else n % 10 + sum(n / 10)
  in sum(int.abs(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-sum-digits-0.almd:2:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  |
2 |   let rec sum = (n) =>
  |       ^^^
error: Expected expression at line 4:3 (got In 'in')
  --> /tmp/dojo-sum-digits-0.almd:4:3
  |
4 |   in sum(int.abs(n))
  |   ^
error[E002]: undefined function 'sum'
  --> /tmp/dojo-sum-digits-0.almd:3:44
  in call to sum()
  hint: Check the function name
  |
3 |     if n == 0 then 0 else n % 10 + sum(n / 10)
  |                                            ^^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-0.almd:3:44
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  |
3 |     if n == 0 then 0 else n % 10 + sum(n / 10)
  |                                            ^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  fn sum(n: Int) -> Int = 
    if n == 0 then 0 else n % 10 + sum(n / 10)
  sum(int.abs(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-1.almd:2:3
  |
2 |   fn sum(n: Int) -> Int =
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:3 (got Ident 'sum')
  --> /tmp/dojo-sum-digits-1.almd:4:3
  |
4 |   sum(int.abs(n))
  |   ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = fn(n: Int) -> Int = 
    if n == 0 then 0 else n % 10 + sum(n / 10)
  sum(int.abs(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected expression at line 2:13 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-2.almd:2:13
  |
2 |   let sum = fn(n: Int) -> Int =
  |             ^
error[E002]: undefined function 'sum'
  --> /tmp/dojo-sum-digits-2.almd:3:44
  in call to sum()
  hint: Check the function name
  |
3 |     if n == 0 then 0 else n % 10 + sum(n / 10)
  |                                            ^^
error[E002]: undefined function 'sum'
  --> /tmp/dojo-sum-digits-2.almd:4:15
  in call to sum()
  hint: Check the function name
  |
4 |   sum(int.abs(n))
  |               ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = fn(n: Int) -> Int = 
    if n == 0 then 0 else n % 10 + sum(n / 10)
  sum(int.abs(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected expression at line 2:13 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-3.almd:2:13
  |
2 |   let sum = fn(n: Int) -> Int =
  |             ^
error[E002]: undefined function 'sum'
  --> /tmp/dojo-sum-digits-3.almd:3:44
  in call to sum()
  hint: Check the function name
  |
3 |     if n == 0 then 0 else n % 10 + sum(n / 10)
  |                                            ^^
error[E002]: undefined function 'sum'
  --> /tmp/dojo-sum-digits-3.almd:4:15
  in call to sum()
  hint: Check the function name
  |
4 |   sum(int.abs(n))
  |               ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
