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
  let sum = list.fold(int.toString(int.abs(n)), 0, (acc, x) => acc + int.parse(x)) 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E002]: undefined function 'int.toString'
  --> /tmp/dojo-sum-digits-1.almd:2:44
  in call to int.toString()
  hint: Did you mean `int.to_string`?
  try:
      // int.toString(...)  →  int.to_string(...)
      int.to_string(...)
  |
2 |   let sum = list.fold(int.toString(int.abs(n)), 0, (acc, x) => acc + int.parse(x))
  |                                            ^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:2:80
  in operator +
  hint: Use + with numeric types, String, or List
  |
2 |   let sum = list.fold(int.toString(int.abs(n)), 0, (acc, x) => acc + int.parse(x))
  |                                                                                ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => match int.parse(x) {
    ok(v) => acc + v,
    err(_) => acc
  })
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-2.almd:4:15
  in call to list.fold()
  hint: Fix the argument type
  |
4 |     err(_) => acc
  |               ^^^
error[E001]: type mismatch in call to list.fold(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-2.almd:4:15
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |     err(_) => acc
  |               ^^^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = list.fold(int.to_string(int.abs(n)), 0, (acc, x) => match int.parse(x) {
    ok(v) => acc + v,
    err(_) => acc
  })
  list.len(int.to_string(int.abs(n)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:4:15
  in call to list.fold()
  hint: Fix the argument type
  |
4 |     err(_) => acc
  |               ^^^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:6:34
  in call to list.len()
  hint: Fix the argument type
  |
6 |   list.len(int.to_string(int.abs(n)))
  |                                  ^
error[E001]: type mismatch in call to list.fold(): expected List[String] but got String
  --> /tmp/dojo-sum-digits-3.almd:4:15
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |     err(_) => acc
  |               ^^^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-3.almd:6:34
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
6 |   list.len(int.to_string(int.abs(n)))
  |                                  ^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
