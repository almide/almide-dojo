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
    let sum = 
        list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.get(n, i).unwrap_or(0)) 
    in 
    sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-0.almd:3:41
  in call to int.len()
  hint: Did you mean `int.min`?
  try:
      // int.len(...)  →  int.min(...)
      int.min(...)
  |
3 |         list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.get(n, i).unwrap_or(0))
  |                                         ^
error[E002]: undefined function 'int.get'
  --> /tmp/dojo-sum-digits-0.almd:3:78
  in call to int.get()
  hint: No function 'get' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |         list.fold(list.range(0, int.len(n)), 0, (acc, i) => acc + int.get(n, i).unwrap_or(0))
  |                                                                              ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
    let sum = 
        list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i).unwrap_or("0")).unwrap_or(0))
    in 
    sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:3:56
  in call to list.len()
  hint: Fix the argument type
  |
3 |         list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i).unwrap_or("0")).unwrap_or(0))
  |                                                        ^
error[E002]: undefined function 'int.get'
  --> /tmp/dojo-sum-digits-1.almd:3:119
  in call to int.get()
  hint: No function 'get' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |         list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i).unwrap_or("0")).unwrap_or(0))
  |                                                                                                                       ^
error[E001]: type mismatch in call to list.len(): expected List[A] but got String
  --> /tmp/dojo-sum-digits-1.almd:3:56
  in call to list.len()
  hint: Fix the expression type or change the expected type
  |
3 |         list.fold(list.range(0, list.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i).unwrap_or("0")).unwrap_or(0))
  |                                                        ^

3 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
    let sum = 
        list.fold(list.range(0, int.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i)).unwrap_or(0))
    in 
    sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error[E002]: undefined function 'int.len'
  --> /tmp/dojo-sum-digits-2.almd:3:55
  in call to int.len()
  hint: Did you mean `int.min`?
  try:
      // int.len(...)  →  int.min(...)
      int.min(...)
  |
3 |         list.fold(list.range(0, int.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i)).unwrap_or(0))
  |                                                       ^
error[E002]: undefined function 'int.get'
  --> /tmp/dojo-sum-digits-2.almd:3:118
  in call to int.get()
  hint: No function 'get' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |         list.fold(list.range(0, int.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(int.get(int.to_string(n), i)).unwrap_or(0))
  |                                                                                                                      ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
    let sum = 
        list.fold(list.range(0, string.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(string.get(int.to_string(n), i)).unwrap_or(0))
    in 
    sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-sum-digits-3.almd:3:124
  in call to int.parse()
  hint: Fix the argument type
  |
3 |         list.fold(list.range(0, string.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(string.get(int.to_string(n), i)).unwrap_or(0))
  |                                                                                                                            ^
error[E001]: type mismatch in call to int.parse(): expected String but got Option[String]
  --> /tmp/dojo-sum-digits-3.almd:3:124
  in call to int.parse()
  hint: Fix the expression type or change the expected type
  |
3 |         list.fold(list.range(0, string.len(int.to_string(n))), 0, (acc, i) => acc + int.parse(string.get(int.to_string(n), i)).unwrap_or(0))
  |                                                                                                                            ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
