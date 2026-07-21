# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.range(3, int.to_float(n), 2).all(
    fn(x) => n % x != 0
  )
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected expression at line 6:5 (got Fn 'fn')
  --> /tmp/dojo-is-prime-0.almd:6:5
  |
6 |     fn(x) => n % x != 0
  |     ^
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
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.range(3, int.to_float(n), 2).all(
    (x) => n % x != 0
  )
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-1.almd:5:39
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
5 |   else list.range(3, int.to_float(n), 2).all(
  |                                       ^
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-1.almd:5:39
  in call to list.range()
  hint: Fix the argument type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |   else list.range(3, int.to_float(n), 2).all(
  |                                       ^
error[E001]: type mismatch in call to list.range(): expected Int but got Float
  --> /tmp/dojo-is-prime-1.almd:5:39
  in call to list.range()
  hint: Fix the expression type or change the expected type. Or use `to_int(x)` to convert Float to Int (truncates)
  |
5 |   else list.range(3, int.to_float(n), 2).all(
  |                                       ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.range(3, int.to_int(math.floor(float.to_float(n))), 2).all(
    (x) => n % x != 0
  )
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E002]: undefined function 'float.to_float'
  --> /tmp/dojo-is-prime-2.almd:5:59
  in call to float.to_float()
  hint: No function 'to_float' in module 'float'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.range(3, int.to_int(math.floor(float.to_float(n))), 2).all(
  |                                                           ^
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-2.almd:5:33
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |   else list.range(3, int.to_int(math.floor(float.to_float(n))), 2).all(
  |                                 ^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-2.almd:5:33
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.range(3, int.to_int(math.floor(float.to_float(n))), 2).all(
  |                                 ^^^^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-2.almd:5:65
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
5 |   else list.range(3, int.to_int(math.floor(float.to_float(n))), 2).all(
  |                                                                 ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.range(3, int.ceil(math.sqrt(float.to_float(n))), 2).all(
    (x) => n % x != 0
  )
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E002]: undefined function 'float.to_float'
  --> /tmp/dojo-is-prime-3.almd:5:56
  in call to float.to_float()
  hint: No function 'to_float' in module 'float'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.range(3, int.ceil(math.sqrt(float.to_float(n))), 2).all(
  |                                                        ^
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-3.almd:5:31
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |   else list.range(3, int.ceil(math.sqrt(float.to_float(n))), 2).all(
  |                               ^^^^
error[E002]: undefined function 'int.ceil'
  --> /tmp/dojo-is-prime-3.almd:5:31
  in call to int.ceil()
  hint: No function 'ceil' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.range(3, int.ceil(math.sqrt(float.to_float(n))), 2).all(
  |                               ^^^^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-3.almd:5:62
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
5 |   else list.range(3, int.ceil(math.sqrt(float.to_float(n))), 2).all(
  |                                                              ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
