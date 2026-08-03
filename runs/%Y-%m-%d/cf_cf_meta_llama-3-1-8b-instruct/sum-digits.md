# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = list.fold(list.range(0, int.to_int(float.log10(float.to_int(abs_n)) + 1)), 0, (acc, i) => {
    let digit = (abs_n / int.pow(10, i)) % 10
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E005]: argument 'n' expects Float but got Int
  --> /tmp/dojo-sum-digits-0.almd:3:73
  in call to float.to_int()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
3 |   let sum = list.fold(list.range(0, int.to_int(float.log10(float.to_int(abs_n)) + 1)), 0, (acc, i) => {
  |                                                                         ^^^^^
error[E002]: undefined function 'float.log10'
  --> /tmp/dojo-sum-digits-0.almd:3:73
  in call to float.log10()
  hint: No function 'log10' in module 'float'. See docs/CHEATSHEET.md for available functions
  |
3 |   let sum = list.fold(list.range(0, int.to_int(float.log10(float.to_int(abs_n)) + 1)), 0, (acc, i) => {
  |                                                                         ^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-0.almd:3:83
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   let sum = list.fold(list.range(0, int.to_int(float.log10(float.to_int(abs_n)) + 1)), 0, (acc, i) => {
  |                                                                                   ^
error[E002]: undefined function 'int.pow'
  --> /tmp/dojo-sum-digits-0.almd:4:38
  in call to int.pow()
  hint: Did you mean `int.bor`?
  try:
      // int.pow(...)  →  int.bor(...)
      int.bor(...)
  |
4 |     let digit = (abs_n / int.pow(10, i)) % 10
  |                                      ^
error[E001]: type mismatch in call to float.to_int(): expected Float but got Int
  --> /tmp/dojo-sum-digits-0.almd:3:73
  in call to float.to_int()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
3 |   let sum = list.fold(list.range(0, int.to_int(float.log10(float.to_int(abs_n)) + 1)), 0, (acc, i) => {
  |                                                                         ^^^^^

5 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = list.fold(list.range(0, int.to_int(math.log10(float.to_float(abs_n))) + 1), 0, (acc, i) => {
    let digit = (abs_n / int.pow(10, i)) % 10
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E002]: undefined function 'float.to_float'
  --> /tmp/dojo-sum-digits-1.almd:5:74
  in call to float.to_float()
  hint: No function 'to_float' in module 'float'. See docs/CHEATSHEET.md for available functions
  |
5 |   let sum = list.fold(list.range(0, int.to_int(math.log10(float.to_float(abs_n))) + 1), 0, (acc, i) => {
  |                                                                          ^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-1.almd:5:74
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   let sum = list.fold(list.range(0, int.to_int(math.log10(float.to_float(abs_n))) + 1), 0, (acc, i) => {
  |                                                                          ^^^^^
error[E002]: undefined function 'int.pow'
  --> /tmp/dojo-sum-digits-1.almd:6:38
  in call to int.pow()
  hint: Did you mean `int.bor`?
  try:
      // int.pow(...)  →  int.bor(...)
      int.bor(...)
  |
6 |     let digit = (abs_n / int.pow(10, i)) % 10;
  |                                      ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let max_power = math.log10(abs_n)
  let sum = list.fold(list.range(0, int.to_int(max_power) + 1), 0, (acc, i) => {
    let digit = (abs_n / int.pow(10, i)) % 10
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E005]: argument 'x' expects Float but got Int
  --> /tmp/dojo-sum-digits-2.almd:5:30
  in call to math.log10()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
5 |   let max_power = math.log10(abs_n);
  |                              ^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-2.almd:6:48
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |   let sum = list.fold(list.range(0, int.to_int(max_power) + 1), 0, (acc, i) => {
  |                                                ^^^^^^^^^
error[E002]: undefined function 'int.pow'
  --> /tmp/dojo-sum-digits-2.almd:7:38
  in call to int.pow()
  hint: Did you mean `int.bor`?
  try:
      // int.pow(...)  →  int.bor(...)
      int.bor(...)
  |
7 |     let digit = (abs_n / int.pow(10, i)) % 10;
  |                                      ^
error[E001]: type mismatch in call to math.log10(): expected Float but got Int
  --> /tmp/dojo-sum-digits-2.almd:5:30
  in call to math.log10()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
5 |   let max_power = math.log10(abs_n);
  |                              ^^^^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = {
  let abs_n = int.abs(n)
  let sum = list.fold(list.range(0, int.to_float(math.log10(abs_n)) + 1), 0, (acc, i) => {
    let digit = (abs_n / int.pow(10, i)) % 10
    acc + digit
  })
  sum
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 'x' expects Float but got Int
  --> /tmp/dojo-sum-digits-3.almd:5:61
  in call to math.log10()
  hint: Fix the argument type. Or use `to_float(x)` to convert Int to Float
  |
5 |   let sum = list.fold(list.range(0, int.to_float(math.log10(abs_n)) + 1), 0, (acc, i) => {
  |                                                             ^^^^^
error[E005]: argument 'n' expects Int but got Float
  --> /tmp/dojo-sum-digits-3.almd:5:61
  in call to int.to_float()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |   let sum = list.fold(list.range(0, int.to_float(math.log10(abs_n)) + 1), 0, (acc, i) => {
  |                                                             ^^^^^
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-sum-digits-3.almd:5:71
  in call to list.range()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |   let sum = list.fold(list.range(0, int.to_float(math.log10(abs_n)) + 1), 0, (acc, i) => {
  |                                                                       ^
error[E002]: undefined function 'int.pow'
  --> /tmp/dojo-sum-digits-3.almd:6:38
  in call to int.pow()
  hint: Did you mean `int.bor`?
  try:
      // int.pow(...)  →  int.bor(...)
      int.bor(...)
  |
6 |     let digit = (abs_n / int.pow(10, i)) % 10;
  |                                      ^
error[E001]: type mismatch in call to math.log10(): expected Float but got Int
  --> /tmp/dojo-sum-digits-3.almd:5:61
  in call to math.log10()
  hint: Fix the expression type or change the expected type. Or use `to_float(x)` to convert Int to Float
  |
5 |   let sum = list.fold(list.range(0, int.to_float(math.log10(abs_n)) + 1), 0, (acc, i) => {
  |                                                             ^^^^^
error[E001]: type mismatch in call to int.to_float(): expected Int but got Float
  --> /tmp/dojo-sum-digits-3.almd:5:61
  in call to int.to_float()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |   let sum = list.fold(list.range(0, int.to_float(math.log10(abs_n)) + 1), 0, (acc, i) => {
  |                                                             ^^^^^
error[E001]: type mismatch in call to list.range(): expected Int but got Float
  --> /tmp/dojo-sum-digits-3.almd:5:71
  in call to list.range()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |   let sum = list.fold(list.range(0, int.to_float(math.log10(abs_n)) + 1), 0, (acc, i) => {
  |                                                                       ^

7 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
