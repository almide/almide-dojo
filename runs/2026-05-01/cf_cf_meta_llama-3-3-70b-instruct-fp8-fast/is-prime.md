# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else list.all(list.range(2, int.sqrt(n) |> float.to_int(n) + 1), (x) => n % x != 0)
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
3 |   else list.all(list.range(2, int.sqrt(n) |> float.to_int(n) + 1), (x) => n % x != 0)
  |                                        ^
error[E004]: float.to_int() expects 1 argument(s) but got 2
  --> /tmp/dojo-is-prime-0.almd:3:59
  in call to float.to_int()
  hint: Check the number of arguments
  try:
      // float.to_int() takes 1 arg(s) — you passed 2
      float.to_int(<n: Float>)
  |
3 |   else list.all(list.range(2, int.sqrt(n) |> float.to_int(n) + 1), (x) => n % x != 0)
  |                                                           ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else list.all(list.range(2, float.to_int(float.sqrt(int.to_float(n))) + 1), (x) => n % x != 0)
```
