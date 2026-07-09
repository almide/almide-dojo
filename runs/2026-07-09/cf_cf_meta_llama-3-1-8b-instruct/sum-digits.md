# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0
  else int.to_int(float.to_int(float.sqrt(int.to_float(int.abs(n))))).to_string().chars().map(string.to_int).sum()
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error[E003]: undefined variable 'string'
  --> /tmp/dojo-sum-digits-0.almd:3:95
  in variable string
  hint: Check the variable name
  |
3 |   else int.to_int(float.to_int(float.sqrt(int.to_float(int.abs(n))))).to_string().chars().map(string.to_int).sum()
  |                                                                                               ^^^^^^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-0.almd:3:64
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else int.to_int(float.to_int(float.sqrt(int.to_float(int.abs(n))))).to_string().chars().map(string.to_int).sum()
  |                                                                ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0
  else list.fold(string.chars(int.to_string(int.abs(n))), 0, (acc, x) => acc + string.to_int(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error[E002]: undefined function 'string.to_int'
  --> /tmp/dojo-sum-digits-1.almd:3:94
  in call to string.to_int()
  hint: Did you mean `int.parse`?
  try:
      // string.to_int(...)  →  int.parse(...)
      int.parse(...)
  |
3 |   else list.fold(string.chars(int.to_string(int.abs(n))), 0, (acc, x) => acc + string.to_int(x))
  |                                                                                              ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0
  else list.fold(string.chars(int.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: operator '+' requires numeric, String, or List types but got ?0 and Result[Int, String]
  --> /tmp/dojo-sum-digits-2.almd:3:90
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |   else list.fold(string.chars(int.to_string(int.abs(n))), 0, (acc, x) => acc + int.parse(x))
  |                                                                                          ^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn sum_digits(n: Int) -> Int = 
  if n == 0 then 0
  else list.fold(string.chars(int.to_string(int.abs(n))), 0, (acc, x) => 
    match int.parse(x) {
      ok(x) => acc + x
      err(_) => acc
    })
```
