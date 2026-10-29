# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.to_float(n) + 1, 2), (x) => n % x != 0)
```

**Diagnostic:**

```
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-0.almd:5:57
  in call to list.range()
  here: else list.all[Int](list.range(3, int.to_float(n) + 1, 2), (x) => n % x != 0)
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
5 |   else list.all[Int](list.range(3, int.to_float(n) + 1, 2), (x) => n % x != 0)
  |                                                         ^
error[E005]: argument 'end' expects Int but got Float
  --> /tmp/dojo-is-prime-0.almd:5:52
  in call to list.range()
  here: else list.all[Int](list.range(3, int.to_float(n) + 1, 2), (x) => n % x != 0)
  hint: Fix the argument type. Or use `float.to_int(x)` to convert Float to Int (truncates)
  try:
      // Try:
      float.to_int(+)
...
5 |   else list.all[Int](list.range(3, int.to_float(n) + 1, 2), (x) => n % x != 0)
  |                                                    ^

2 error(s) found
FAILED: /tmp/dojo-is-prime-0.almd
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.to_int(float.to_int(float.sqrt(int.to_float(n))) + 1), 2), (x) => n % x != 0)
```

**Diagnostic:**

```
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-1.almd:5:36
  in call to int.to_int()
  here: else list.all[Int](list.range(3, int.to_int(float.to_int(float.sqrt(int.to_float(n))) + 1), 2), (x) => n % x != 0)
  hint: Did you mean `int.to_int8`?
  try:
      int.to_int8
  |
5 |   else list.all[Int](list.range(3, int.to_int(float.to_int(float.sqrt(int.to_float(n))) + 1), 2), (x) => n % x != 0)
  |                                    ^^^^^^^^^^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-1.almd:5:95
  in call to list.range()
  here: else list.all[Int](list.range(3, int.to_int(float.to_int(float.sqrt(int.to_float(n))) + 1), 2), (x) => n % x != 0)
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
5 |   else list.all[Int](list.range(3, int.to_int(float.to_int(float.sqrt(int.to_float(n))) + 1), 2), (x) => n % x != 0)
  |                                                                                               ^

2 error(s) found
FAILED: /tmp/dojo-is-prime-1.almd
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.to_int(float.sqrt(int.to_float(n))) + 1, 2), (x) => n % x != 0)
```

**Diagnostic:**

```
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-2.almd:5:36
  in call to int.to_int()
  here: else list.all[Int](list.range(3, int.to_int(float.sqrt(int.to_float(n))) + 1, 2), (x) => n % x != 0)
  hint: Did you mean `int.to_int8`?
  try:
      int.to_int8
  |
5 |   else list.all[Int](list.range(3, int.to_int(float.sqrt(int.to_float(n))) + 1, 2), (x) => n % x != 0)
  |                                    ^^^^^^^^^^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-2.almd:5:81
  in call to list.range()
  here: else list.all[Int](list.range(3, int.to_int(float.sqrt(int.to_float(n))) + 1, 2), (x) => n % x != 0)
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
5 |   else list.all[Int](list.range(3, int.to_int(float.sqrt(int.to_float(n))) + 1, 2), (x) => n % x != 0)
  |                                                                                 ^

2 error(s) found
FAILED: /tmp/dojo-is-prime-2.almd
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.to_int(float.sqrt(int.to_float(n))) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-3.almd:5:36
  in call to int.to_int()
  here: else list.all[Int](list.range(3, int.to_int(float.sqrt(int.to_float(n))) + 1), (x) => n % x != 0)
  hint: Did you mean `int.to_int8`?
  try:
      int.to_int8
  |
5 |   else list.all[Int](list.range(3, int.to_int(float.sqrt(int.to_float(n))) + 1), (x) => n % x != 0)
  |                                    ^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-is-prime-3.almd
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
