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
  let sum = option.unwrap_or(list.fold(list.map(int.to_string(n), string.chars), 0, (acc, x) => acc + int.parse(x)), 0)
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-0.almd:2:73
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let sum = option.unwrap_or(list.fold(list.map(int.to_string(n), string.chars), 0, (acc, x) => acc + int.parse(x)), 0)
  |                                                                         ^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-0.almd:2:113
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   let sum = option.unwrap_or(list.fold(list.map(int.to_string(n), string.chars), 0, (acc, x) => acc + int.parse(x)), 0)
  |                                                                                                                 ^
error[E005]: argument 'f' expects fn(Int, List[String]) -> Int but got fn(?0, String) -> ?0
  --> /tmp/dojo-sum-digits-0.almd:2:113
  in call to list.fold()
  hint: Fix the argument type
  |
2 |   let sum = option.unwrap_or(list.fold(list.map(int.to_string(n), string.chars), 0, (acc, x) => acc + int.parse(x)), 0)
  |                                                                                                                 ^
error[E005]: argument 'o' expects Option[A] but got Int
  --> /tmp/dojo-sum-digits-0.almd:2:118
  in call to option.unwrap_or()
  hint: Fix the argument type
  |
2 |   let sum = option.unwrap_or(list.fold(list.map(int.to_string(n), string.chars), 0, (acc, x) => acc + int.parse(x)), 0)
  |                                                                                                                      ^
error[E001]: type mismatch in call to list.map(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-0.almd:2:73
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = option.unwrap_or(list.fold(list.map(int.to_string(n), string.chars), 0, (acc, x) => acc + int.parse(x)), 0)
  |                                                                         ^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, List[String]) -> Int but got fn(Int, String) -> Int
  --> /tmp/dojo-sum-digits-0.almd:2:113
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = option.unwrap_or(list.fold(list.map(int.to_string(n), string.chars), 0, (acc, x) => acc + int.parse(x)), 0)
  |                                                                                                                 ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Option[Int] but got Int
  --> /tmp/dojo-sum-digits-0.almd:2:118
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = option.unwrap_or(list.fold(list.map(int.to_string(n), string.chars), 0, (acc, x) => acc + int.parse(x)), 0)
  |                                                                                                                      ^

7 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(int.to_string(n), string.chars)
  let sum = list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:2:49
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let digits = list.map(int.to_string(n), string.chars)
  |                                                 ^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:3:62
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |   let sum = list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                              ^
error[E005]: argument 'f' expects fn(Int, List[String]) -> Int but got fn(?0, String) -> ?0
  --> /tmp/dojo-sum-digits-1.almd:3:62
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   let sum = list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                              ^
error[E001]: type mismatch in call to list.map(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-1.almd:2:49
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let digits = list.map(int.to_string(n), string.chars)
  |                                                 ^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, List[String]) -> Int but got fn(Int, String) -> Int
  --> /tmp/dojo-sum-digits-1.almd:3:62
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   let sum = list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                              ^

5 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(int.to_string(n), string.chars)
  let sum = list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-2.almd:2:49
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let digits = list.map(int.to_string(n), string.chars)
  |                                                 ^
error[E005]: argument 'f' expects fn(Int, List[String]) -> Int but got fn(?0, String) -> ?0
  --> /tmp/dojo-sum-digits-2.almd:3:95
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   let sum = list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
  |                                                                                               ^^^
error[E001]: type mismatch in call to list.map(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-2.almd:2:49
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let digits = list.map(int.to_string(n), string.chars)
  |                                                 ^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, List[String]) -> Int but got fn(Int, String) -> Int
  --> /tmp/dojo-sum-digits-2.almd:3:95
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   let sum = list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
  |                                                                                               ^^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.map(int.to_string(n), string.chars)
  let sum = list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
  let abs_n = int.abs(n)
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:2:49
  in call to list.map()
  hint: Fix the argument type
  |
2 |   let digits = list.map(int.to_string(n), string.chars)
  |                                                 ^
error[E005]: argument 'f' expects fn(Int, List[String]) -> Int but got fn(?0, String) -> ?0
  --> /tmp/dojo-sum-digits-3.almd:3:95
  in call to list.fold()
  hint: Fix the argument type
  |
3 |   let sum = list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
  |                                                                                               ^^^
error[E001]: type mismatch in call to list.map(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-3.almd:2:49
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |   let digits = list.map(int.to_string(n), string.chars)
  |                                                 ^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, List[String]) -> Int but got fn(Int, String) -> Int
  --> /tmp/dojo-sum-digits-3.almd:3:95
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
3 |   let sum = list.fold(digits, 0, (acc, x) => match int.parse(x) { ok(v) => acc + v, err(_) => acc })
  |                                                                                               ^^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
