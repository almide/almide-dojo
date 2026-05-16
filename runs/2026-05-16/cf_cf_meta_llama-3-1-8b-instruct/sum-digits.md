# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.range(0, int.len(n)) |> list.map(fn(i) => int.abs(n) / int.pow(10, i) % 10)
  list.sum(digits)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected expression at line 2:54 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-0.almd:2:54
  |
2 |   let digits = list.range(0, int.len(n)) |> list.map(fn(i) => int.abs(n) / int.pow(10, i) % 10)
  |                                                      ^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:3:12
  in variable digits
  hint: Check the variable name
  |
3 |   list.sum(digits)
  |            ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.range(0, int.len(n)) |> list.map(fn(i) => int.abs(n) / int.pow(10, i) % 10)
  list.sum(list.map(digits, fn(x) => x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected expression at line 2:54 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-1.almd:2:54
  |
2 |   let digits = list.range(0, int.len(n)) |> list.map(fn(i) => int.abs(n) / int.pow(10, i) % 10)
  |                                                      ^
error: Expected expression at line 3:29 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-1.almd:3:29
  |
3 |   list.sum(list.map(digits, fn(x) => x))
  |                             ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-1.almd:2:3
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let digits = list.range(0, int.len(n)) |> list.map(fn(i) => int.abs(n) / int.pow(10, i) % 10)
  |   ^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.range(0, int.len(n)) |> list.map(fn(i) => int.abs(n) / int.pow(10, i) % 10)
  list.sum(digits)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected expression at line 2:54 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-2.almd:2:54
  |
2 |   let digits = list.range(0, int.len(n)) |> list.map(fn(i) => int.abs(n) / int.pow(10, i) % 10)
  |                                                      ^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-2.almd:3:12
  in variable digits
  hint: Check the variable name
  |
3 |   list.sum(digits)
  |            ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.range(0, int.len(n)) |> list.map(fn(i) => int.abs(n) / int.pow(10, i) % 10)
  list.sum(list.map(digits, fn(x) => x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected expression at line 2:54 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-3.almd:2:54
  |
2 |   let digits = list.range(0, int.len(n)) |> list.map(fn(i) => int.abs(n) / int.pow(10, i) % 10)
  |                                                      ^
error: Expected expression at line 3:29 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-3.almd:3:29
  |
3 |   list.sum(list.map(digits, fn(x) => x))
  |                             ^
error[E001]: type mismatch in fn 'sum_digits': expected Int but got Unit
  --> /tmp/dojo-sum-digits-3.almd:2:3
  in fn 'sum_digits'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Int:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Int
  |
2 |   let digits = list.range(0, int.len(n)) |> list.map(fn(i) => int.abs(n) / int.pow(10, i) % 10)
  |   ^^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
