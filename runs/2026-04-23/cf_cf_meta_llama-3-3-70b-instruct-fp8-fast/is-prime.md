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
  else list.all(list.range(2, int.to_float(n).|> float.sqrt.|> float.to_int), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected name at line 3:47 (got PipeArrow '|>')
  --> /tmp/dojo-is-prime-0.almd:3:47
  |
3 |   else list.all(list.range(2, int.to_float(n).|> float.sqrt.|> float.to_int), (x) => n % x != 0)
  |                                               ^

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
  else list.all(list.range(2, float.to_int(float.sqrt(int.to_float(n)))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.min(int.to_int(float.sqrt(int.to_float(n))) + 1, n)), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-2.almd:3:74
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.all(list.range(2, int.min(int.to_int(float.sqrt(int.to_float(n))) + 1, n)), (x) => n % x != 0)
  |                                                                          ^

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
  else list.all(list.range(2, int.min(int.parse(int.to_string(float.to_int(float.sqrt(int.to_float(n))))) |> result.unwrap_or(0) + 1, n)), (x) => n % x != 0)
```
