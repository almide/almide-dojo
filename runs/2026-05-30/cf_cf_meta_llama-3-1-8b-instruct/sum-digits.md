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
  let sum = list.fold(list.chars(string.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x)) 
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'string.to_string'
  --> /tmp/dojo-sum-digits-0.almd:2:59
  in call to string.to_string()
  hint: No function 'to_string' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
2 |   let sum = list.fold(list.chars(string.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x))
  |                                                           ^
error[E002]: undefined function 'list.chars'
  --> /tmp/dojo-sum-digits-0.almd:2:59
  in call to list.chars()
  hint: No function 'chars' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
2 |   let sum = list.fold(list.chars(string.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x))
  |                                                           ^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-0.almd:2:96
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   let sum = list.fold(list.chars(string.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x))
  |                                                                                                ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(string.from_bytes(int.to_bytes(int.abs(n))), int.parse), 0, (acc, x) => acc + x)
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E002]: undefined function 'int.to_bytes'
  --> /tmp/dojo-sum-digits-1.almd:2:71
  in call to int.to_bytes()
  hint: No function 'to_bytes' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
2 |   let sum = list.fold(list.map(string.from_bytes(int.to_bytes(int.abs(n))), int.parse), 0, (acc, x) => acc + x)
  |                                                                       ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:2:80
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let sum = list.fold(list.map(string.from_bytes(int.to_bytes(int.abs(n))), int.parse), 0, (acc, x) => acc + x)
  |                                                                                ^
error[E001]: type mismatch in call to list.map(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-1.almd:2:80
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = list.fold(list.map(string.from_bytes(int.to_bytes(int.abs(n))), int.parse), 0, (acc, x) => acc + x)
  |                                                                                ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(list.map(string.from_codepoint(int.abs(n)), int.parse), 0, (acc, x) => acc + x)
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-2.almd:2:70
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let sum = list.fold(list.map(string.from_codepoint(int.abs(n)), int.parse), 0, (acc, x) => acc + x)
  |                                                                      ^
error[E001]: type mismatch in call to list.map(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-2.almd:2:70
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = list.fold(list.map(string.from_codepoint(int.abs(n)), int.parse), 0, (acc, x) => acc + x)
  |                                                                      ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(string.from_codepoint(int.abs(n)), int.parse)
  in list.fold(digits, 0, (acc, x) => acc + x)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:2:63
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let digits = list.map(string.from_codepoint(int.abs(n)), int.parse)
  |                                                               ^
error[E001]: type mismatch in call to list.map(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-3.almd:2:63
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let digits = list.map(string.from_codepoint(int.abs(n)), int.parse)
  |                                                               ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
