# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = int.fold(int.abs(n), 0, (acc, x) => acc + x % 10) 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'int.fold'
  --> /tmp/dojo-sum-digits-0.almd:2:59
  in call to int.fold()
  hint: No function 'fold' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   let sum = int.fold(int.abs(n), 0, (acc, x) => acc + x % 10)
  |                                                           ^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(int.to_list(int.abs(n)), 0, (acc, x) => acc + x % 10) 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E002]: undefined function 'int.to_list'
  --> /tmp/dojo-sum-digits-1.almd:2:43
  in call to int.to_list()
  hint: No function 'to_list' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   let sum = list.fold(int.to_list(int.abs(n)), 0, (acc, x) => acc + x % 10)
  |                                           ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => acc + string.to_int(x) % 10) 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E002]: undefined function 'string.to_int'
  --> /tmp/dojo-sum-digits-2.almd:2:85
  in call to string.to_int()
  hint: Did you mean `int.parse`?
  try:
      // string.to_int(...)  →  int.parse(...)
      int.parse(...)
  |
2 |   let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => acc + string.to_int(x) % 10)
  |                                                                                     ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-2.almd:2:90
  in call to list.fold()
  hint: Fix the argument type
  |
2 |   let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => acc + string.to_int(x) % 10)
  |                                                                                          ^^
error[E001]: type mismatch in call to list.fold(): expected List[?1] but got String
  --> /tmp/dojo-sum-digits-2.almd:2:90
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => acc + string.to_int(x) % 10)
  |                                                                                          ^^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let str = int.to_string(int.abs(n))
  let sum = list.fold(str, 0, (acc, x) => acc + int.parse(x))
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-3.almd:3:59
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |   let sum = list.fold(str, 0, (acc, x) => acc + int.parse(x))
  |                                                           ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:3:59
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   let sum = list.fold(str, 0, (acc, x) => acc + int.parse(x))
  |                                                           ^
error[E001]: type mismatch in call to list.fold(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-3.almd:3:59
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   let sum = list.fold(str, 0, (acc, x) => acc + int.parse(x))
  |                                                           ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
