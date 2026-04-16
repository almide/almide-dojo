# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  let sum = list.fold(list.map(list.range(0, int.len(abs_n)), (i) => int.to_int(int.to_string(abs_n) |> string.get(i, 0))), 0, (acc, x) => acc + x)
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-0.almd:3:54
  in call to int.len()
  hint: Did you mean `int.min`?
  try:
      // int.len(...)  →  int.min(...)
      int.min(...)
  |
3 |   let sum = list.fold(list.map(list.range(0, int.len(abs_n)), (i) => int.to_int(int.to_string(abs_n) |> string.get(i, 0))), 0, (acc, x) => acc + x)
  |                                                      ^^^^^
error[E004]: string.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-sum-digits-0.almd:3:119
  in call to string.get()
  hint: Check the number of arguments
  try:
      // string.get() takes 2 arg(s) — you passed 3
      string.get(<s: String>, <i: Int>)
  |
3 |   let sum = list.fold(list.map(list.range(0, int.len(abs_n)), (i) => int.to_int(int.to_string(abs_n) |> string.get(i, 0))), 0, (acc, x) => acc + x)
  |                                                                                                                       ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-0.almd:3:119
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   let sum = list.fold(list.map(list.range(0, int.len(abs_n)), (i) => int.to_int(int.to_string(abs_n) |> string.get(i, 0))), 0, (acc, x) => acc + x)
  |                                                                                                                       ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  let sum = list.fold(list.map(list.range(0, int.len(abs_n)), (i) => int.to_int(string.get(int.to_string(abs_n), i, 0))), 0, (acc, x) => acc + x)
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-1.almd:3:54
  in call to int.len()
  hint: Did you mean `int.min`?
  try:
      // int.len(...)  →  int.min(...)
      int.min(...)
  |
3 |   let sum = list.fold(list.map(list.range(0, int.len(abs_n)), (i) => int.to_int(string.get(int.to_string(abs_n), i, 0))), 0, (acc, x) => acc + x)
  |                                                      ^^^^^
error[E004]: string.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-sum-digits-1.almd:3:117
  in call to string.get()
  hint: Check the number of arguments
  try:
      // string.get() takes 2 arg(s) — you passed 3
      string.get(<s: String>, <i: Int>)
  |
3 |   let sum = list.fold(list.map(list.range(0, int.len(abs_n)), (i) => int.to_int(string.get(int.to_string(abs_n), i, 0))), 0, (acc, x) => acc + x)
  |                                                                                                                     ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-1.almd:3:117
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   let sum = list.fold(list.map(list.range(0, int.len(abs_n)), (i) => int.to_int(string.get(int.to_string(abs_n), i, 0))), 0, (acc, x) => acc + x)
  |                                                                                                                     ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  let sum = list.fold(list.map(list.range(0, int.len(int.to_string(abs_n))), (i) => int.to_int(string.get(int.to_string(abs_n), i, 0))), 0, (acc, x) => acc + x)
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-2.almd:3:68
  in call to int.len()
  hint: Did you mean `int.min`?
  try:
      // int.len(...)  →  int.min(...)
      int.min(...)
  |
3 |   let sum = list.fold(list.map(list.range(0, int.len(int.to_string(abs_n))), (i) => int.to_int(string.get(int.to_string(abs_n), i, 0))), 0, (acc, x) => acc + x)
  |                                                                    ^^^^^
error[E004]: string.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-sum-digits-2.almd:3:132
  in call to string.get()
  hint: Check the number of arguments
  try:
      // string.get() takes 2 arg(s) — you passed 3
      string.get(<s: String>, <i: Int>)
  |
3 |   let sum = list.fold(list.map(list.range(0, int.len(int.to_string(abs_n))), (i) => int.to_int(string.get(int.to_string(abs_n), i, 0))), 0, (acc, x) => acc + x)
  |                                                                                                                                    ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-2.almd:3:132
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   let sum = list.fold(list.map(list.range(0, int.len(int.to_string(abs_n))), (i) => int.to_int(string.get(int.to_string(abs_n), i, 0))), 0, (acc, x) => acc + x)
  |                                                                                                                                    ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let abs_n = int.abs(n)
  let digits = list.map(list.range(0, int.len(int.to_string(abs_n))), (i) => string.get(int.to_string(abs_n), i))
  let sum = list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-3.almd:3:61
  in call to int.len()
  hint: Did you mean `int.min`?
  try:
      // int.len(...)  →  int.min(...)
      int.min(...)
  |
3 |   let digits = list.map(list.range(0, int.len(int.to_string(abs_n))), (i) => string.get(int.to_string(abs_n), i))
  |                                                             ^^^^^
error: operator '+' requires numeric, String, or List types but got ?1 and Result[Int, String]
  --> /tmp/dojo-sum-digits-3.almd:4:62
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |   let sum = list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                              ^
error[E005]: argument 'f' expects fn(Int, Option[String]) -> Int but got fn(?1, String) -> ?1
  --> /tmp/dojo-sum-digits-3.almd:4:62
  in call to list.fold()
  hint: Fix the argument type
  |
4 |   let sum = list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                              ^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, Option[String]) -> Int but got fn(Int, String) -> Int
  --> /tmp/dojo-sum-digits-3.almd:4:62
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |   let sum = list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                              ^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
