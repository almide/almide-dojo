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
  let sum = list.fold(list.map(string.from_codepoint(int.abs(n)), int.to_string), 0, (acc, x) => acc + int.parse(x))
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:2:70
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let sum = list.fold(list.map(string.from_codepoint(int.abs(n)), int.to_string), 0, (acc, x) => acc + int.parse(x))
  |                                                                      ^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:2:114
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   let sum = list.fold(list.map(string.from_codepoint(int.abs(n)), int.to_string), 0, (acc, x) => acc + int.parse(x))
  |                                                                                                                  ^
error[E001]: type mismatch in call to list.map(): expected List[Int] but got String
  --> /tmp/dojo-sum-digits-1.almd:2:70
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = list.fold(list.map(string.from_codepoint(int.abs(n)), int.to_string), 0, (acc, x) => acc + int.parse(x))
  |                                                                      ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(int.to_string(int.abs(n)), string.chars)
  in list.fold(digits, 0, (acc, x) => acc + int.parse(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-2.almd:2:58
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let digits = list.map(int.to_string(int.abs(n)), string.chars)
  |                                                          ^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-2.almd:3:52
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |   list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                    ^
error[E005]: argument 'f' expects fn(Int, List[String]) -> Int but got fn(?0, String) -> ?0
  --> /tmp/dojo-sum-digits-2.almd:3:52
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                    ^
error[E001]: type mismatch in call to list.map(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-2.almd:2:58
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let digits = list.map(int.to_string(int.abs(n)), string.chars)
  |                                                          ^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, List[String]) -> Int but got fn(Int, String) -> Int
  --> /tmp/dojo-sum-digits-2.almd:3:52
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                    ^

5 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(int.to_string(int.abs(n)), string.chars)
  in list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:2:58
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let digits = list.map(int.to_string(int.abs(n)), string.chars)
  |                                                          ^
error[E005]: argument 'f' expects fn(Int, List[String]) -> Int but got fn(?0, String) -> ?0
  --> /tmp/dojo-sum-digits-3.almd:3:85
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
  |                                                                                     ^^^
error[E001]: type mismatch in call to list.map(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-3.almd:2:58
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let digits = list.map(int.to_string(int.abs(n)), string.chars)
  |                                                          ^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, List[String]) -> Int but got fn(Int, String) -> Int
  --> /tmp/dojo-sum-digits-3.almd:3:85
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
  |                                                                                     ^^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
