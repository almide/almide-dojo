# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.sqrt(int.to_float(n)) |> float.to_int), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-0.almd:3:53
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
3 |   else list.all(list.range(2, int.sqrt(int.to_float(n)) |> float.to_int), (x) => n % x != 0)
  |                                                     ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, float.to_int(float.sqrt(int.to_float(n))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected ')' to close function call opened at line 3:16
  --> /tmp/dojo-is-prime-1.almd:5:1
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   else list.all(list.range(2, float.to_int(float.sqrt(int.to_float(n))), (x) => n % x != 0)
  |                --------------- '(' opened here
...
5 | test "is_prime -1 is false" { assert_eq(is_prime(-1), false) }
  | ^^^^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, float.to_int(float.sqrt(int.to_float(n)) + 1.0), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected ')' to close function call opened at line 3:16
  --> /tmp/dojo-is-prime-2.almd:5:1
  hint: Add ')' or check for a missing delimiter inside the function call
  |
3 |   else list.all(list.range(2, float.to_int(float.sqrt(int.to_float(n)) + 1.0), (x) => n % x != 0)
  |                --------------- '(' opened here
...
5 | test "is_prime -1 is false" { assert_eq(is_prime(-1), false) }
  | ^^^^

1 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, float.to_int(float.sqrt(int.to_float(n)) + 1.0)), (x) => n % x != 0)
```
