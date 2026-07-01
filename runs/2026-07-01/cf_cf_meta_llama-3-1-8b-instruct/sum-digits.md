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
  let digits = list.range(0, int.len(int.to_string(n))) 
  let sum = list.fold(digits, 0, (acc, i) => 
    acc + int.parse(string.get(string.from_bytes(int.to_bytes(n)), i).unwrap_or("0"))) 
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-0.almd:2:52
  in call to int.len()
  hint: Did you mean `int.min`?
  try:
      // int.len(...)  →  int.min(...)
      int.min(...)
  |
2 |   let digits = list.range(0, int.len(int.to_string(n)))
  |                                                    ^
error[E002]: undefined function 'int.to_bytes'
  --> /tmp/dojo-sum-digits-0.almd:4:63
  in call to int.to_bytes()
  hint: No function 'to_bytes' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
4 |     acc + int.parse(string.get(string.from_bytes(int.to_bytes(n)), i).unwrap_or("0")))
  |                                                               ^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-0.almd:4:68
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |     acc + int.parse(string.get(string.from_bytes(int.to_bytes(n)), i).unwrap_or("0")))
  |                                                                    ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.range(0, string.len(int.to_string(n)))
  let sum = list.fold(digits, 0, (acc, i) => 
    acc + int.parse(string.get(string.from_bytes(int.to_string(n)), i).unwrap_or("0")))
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 'bytes' expects List[Int] but got String
  --> /tmp/dojo-sum-digits-1.almd:4:64
  in call to string.from_bytes()
  hint: Fix the argument type
  |
4 |     acc + int.parse(string.get(string.from_bytes(int.to_string(n)), i).unwrap_or("0")))
  |                                                                ^
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-1.almd:4:69
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |     acc + int.parse(string.get(string.from_bytes(int.to_string(n)), i).unwrap_or("0")))
  |                                                                     ^
error[E001]: type mismatch in call to string.from_bytes(): expected List[Int] but got String
  --> /tmp/dojo-sum-digits-1.almd:4:64
  in call to string.from_bytes()
  hint: Fix the expression type or change the expected type
  |
4 |     acc + int.parse(string.get(string.from_bytes(int.to_string(n)), i).unwrap_or("0")))
  |                                                                ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.range(0, string.len(int.to_string(n)))
  let sum = list.fold(digits, 0, (acc, _) => 
    acc + int.parse(string.get(int.to_string(n), _).unwrap_or("0")))
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-2.almd:4:50
  in operator +
  hint: Use + with numeric types, String, or List
  |
4 |     acc + int.parse(string.get(int.to_string(n), _).unwrap_or("0")))
  |                                                  ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let digits = list.range(0, string.len(int.to_string(n)))
  let sum = list.fold(digits, 0, (acc, i) => 
    acc + int.parse(string.get(int.to_string(n), i).unwrap_or("0")).unwrap())
  sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E002]: undefined method 'unwrap' on result
  --> /tmp/dojo-sum-digits-3.almd:4:50
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `result.<fn>(x)` (or `x |> result.<fn>`) — there is no method `unwrap` on `result`. Run `almide explain E002` for examples.
  |
4 |     acc + int.parse(string.get(int.to_string(n), i).unwrap_or("0")).unwrap())
  |                                                  ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
