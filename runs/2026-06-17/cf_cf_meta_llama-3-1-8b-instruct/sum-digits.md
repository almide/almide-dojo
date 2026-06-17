# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let n = int.abs(n)
  let sum = list.fold(list.range(0, n), 0, (acc, _) => {
    let digit = n % 10
    acc + digit
    (acc, _)
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E005]: argument 'f' expects fn(Int, Int) -> Int but got fn(?0, ?1) -> (?0, ?2)
  --> /tmp/dojo-sum-digits-0.almd:6:11
  in call to list.fold()
  hint: Fix the argument type
  |
6 |     (acc, _)
  |           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, Int) -> Int but got fn(Int, Int) -> (Int, ?2)
  --> /tmp/dojo-sum-digits-0.almd:6:11
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
6 |     (acc, _)
  |           ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let n = int.abs(n)
  let sum = list.fold(list.range(0, n), 0, (acc, _) => {
    let digit = n % 10
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let n = int.abs(n)
  let sum = list.fold(list.range(0, n), 0, (acc, i) => {
    let digit = (n / 10 ** i) % 10
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let n = int.abs(n)
  let sum = list.fold(list.range(0, int.to_int(float.log10(n.float_to_int() + 1))), 0, (acc, i) => {
    let digit = (n / 10 ** i) % 10
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined method 'float_to_int' on int
  --> /tmp/dojo-sum-digits-3.almd:3:60
  in method call .float_to_int()
  hint: Almide doesn't use method-call syntax. Write `int.<fn>(x)` (or `x |> int.<fn>`) — there is no method `float_to_int` on `int`. Run `almide explain E002` for examples.
  |
3 |   let sum = list.fold(list.range(0, int.to_int(float.log10(n.float_to_int() + 1))), 0, (acc, i) => {
  |                                                            ^
error[E002]: undefined function 'float.log10'
  --> /tmp/dojo-sum-digits-3.almd:3:79
  in call to float.log10()
  hint: No function 'log10' in module 'float'. See docs/CHEATSHEET.md for available functions
  |
3 |   let sum = list.fold(list.range(0, int.to_int(float.log10(n.float_to_int() + 1))), 0, (acc, i) => {
  |                                                                               ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-3.almd:3:79
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   let sum = list.fold(list.range(0, int.to_int(float.log10(n.float_to_int() + 1))), 0, (acc, i) => {
  |                                                                               ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
