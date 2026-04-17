# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 2 then false 
  else list.all(list.range(2, int.sqrt(n) |> int.to_int), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-0.almd:3:40
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
3 |   else list.all(list.range(2, int.sqrt(n) |> int.to_int), (x) => n % x != 0)
  |                                        ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-0.almd:3:40
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |   else list.all(list.range(2, int.sqrt(n) |> int.to_int), (x) => n % x != 0)
  |                                        ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 2 then false 
  else list.all(list.range(2, float.to_int(float.sqrt(int.to_float(n)))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 2 then false 
  else list.all(list.range(2, int.min(float.to_int(float.sqrt(int.to_float(n))) + 1, n)), (x) => n % x != 0)
```
