# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = int.fold(int.abs(n), 0, (acc, x) => acc + x % 10) 
  in sum
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
  let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => acc + int.parse(x) % 10) 
  in sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: operator '%' requires numeric types but got Result[Int, String] and Int
  --> /tmp/dojo-sum-digits-1.almd:2:86
  in operator %
  hint: Use numeric types (Int or Float)
  |
2 |   let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => acc + int.parse(x) % 10)
  |                                                                                      ^^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:2:86
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => acc + int.parse(x) % 10)
  |                                                                                      ^^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:2:86
  in call to list.fold()
  hint: Fix the argument type
  |
2 |   let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => acc + int.parse(x) % 10)
  |                                                                                      ^^
error[E001]: type mismatch in call to list.fold(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-1.almd:2:86
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
2 |   let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => acc + int.parse(x) % 10)
  |                                                                                      ^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = int.to_string(int.abs(n)) |> string.chars
  in list.fold(digits, 0, (acc, x) => acc + int.parse(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-2.almd:3:52
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |   list.fold(digits, 0, (acc, x) => acc + int.parse(x))
  |                                                    ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = int.to_string(int.abs(n)) |> string.chars
  in list.fold(digits, 0, (acc, x) => acc + int.parse(x).unwrap_or(0))
```
