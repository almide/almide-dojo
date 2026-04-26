# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  n.abs() 
  |> int.to_string() 
  |> string.chars() 
  |> list.map(fn(c) => int.parse(c)) 
  |> list.sum()
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected expression at line 5:15 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-0.almd:5:15
  |
5 |   |> list.map(fn(c) => int.parse(c))
  |               ^
error: Expected function name at line 5:17 (got LParen '(')
  --> /tmp/dojo-sum-digits-0.almd:5:17
  |
5 |   |> list.map(fn(c) => int.parse(c))
  |                 ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  n.abs() 
  |> int.to_string() 
  |> string.chars() 
  |> list.map((c) => int.parse(c)) 
  |> list.sum()
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 'xs' expects List[Int] but got List[Result[Int, String]]
  --> /tmp/dojo-sum-digits-1.almd:5:32
  in call to list.sum()
  hint: Fix the argument type
  |
5 |   |> list.map((c) => int.parse(c))
  |                                ^
error[E001]: type mismatch in call to list.sum(): expected List[Int] but got List[Result[Int, String]]
  --> /tmp/dojo-sum-digits-1.almd:5:32
  in call to list.sum()
  hint: Fix the expression type or change the expected type
  |
5 |   |> list.map((c) => int.parse(c))
  |                                ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  n.abs() 
  |> int.to_string() 
  |> string.chars() 
  |> list.map((c) => match int.parse(c) { ok(x) => x, err(_) => 0 }) 
  |> list.sum()
```
