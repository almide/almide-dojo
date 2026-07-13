# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: import-error
- **diagnostic code**: `E004`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then
    false
  else if n == 2 then
    true
  else if n % 2 == 0 then
    false
  else
    (n > 3) && list.all[Int](list.range(3, int.to_float(n), 2), (divisor) => n % divisor != 0)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: '&&' is not valid in Almide at line 9:13
  --> /tmp/dojo-is-prime-0.almd:9:13
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
9 |     (n > 3) && list.all[Int](list.range(3, int.to_float(n), 2), (divisor) => n % divisor != 0)
  |             ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-0.almd:1:31
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
1 | fn is_prime(n: Int) -> Bool = {
  |                               ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then
    false
  else if n == 2 then
    true
  else if n % 2 == 0 then
    false
  else
    (n > 3) and list.all[Int](list.range(3, int.to_float(n), 2), (divisor) => n % divisor != 0)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-1.almd:9:62
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
9 |     (n > 3) and list.all[Int](list.range(3, int.to_float(n), 2), (divisor) => n % divisor != 0)
  |                                                              ^
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-1.almd:9:62
  in call to list.range()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
9 |     (n > 3) and list.all[Int](list.range(3, int.to_float(n), 2), (divisor) => n % divisor != 0)
  |                                                              ^
error[E001]: type mismatch in call to list.range(): expected Int but got Float
  --> /tmp/dojo-is-prime-1.almd:9:62
  in call to list.range()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
9 |     (n > 3) and list.all[Int](list.range(3, int.to_float(n), 2), (divisor) => n % divisor != 0)
  |                                                              ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then
    false
  else if n == 2 then
    true
  else if n % 2 == 0 then
    false
  else
    (n > 3) and list.all[Int](list.range(3, int.to_int(math.floor(int.to_float(n))), 2), (divisor) => n % divisor != 0)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-2.almd:9:56
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
9 |     (n > 3) and list.all[Int](list.range(3, int.to_int(math.floor(int.to_float(n))), 2), (divisor) => n % divisor != 0)
  |                                                        ^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-2.almd:9:56
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
9 |     (n > 3) and list.all[Int](list.range(3, int.to_int(math.floor(int.to_float(n))), 2), (divisor) => n % divisor != 0)
  |                                                        ^^^^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-2.almd:9:86
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
9 |     (n > 3) and list.all[Int](list.range(3, int.to_int(math.floor(int.to_float(n))), 2), (divisor) => n % divisor != 0)
  |                                                                                      ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then
    false
  else if n == 2 then
    true
  else if n % 2 == 0 then
    false
  else
    (n > 3) and list.all[Int](list.range(3, n - 1, 2), (divisor) => n % divisor != 0)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-3.almd:9:52
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
9 |     (n > 3) and list.all[Int](list.range(3, n - 1, 2), (divisor) => n % divisor != 0)
  |                                                    ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
