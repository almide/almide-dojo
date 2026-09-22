# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.sqrt(n) |> int.to_int), (x) => n % x != 0)
```

**Diagnostic:**

```
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-0.almd:3:40
  in call to int.sqrt()
  here: else list.all(list.range(2, int.sqrt(n) |> int.to_int), (x) => n % x != 0)
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
  here: else list.all(list.range(2, int.sqrt(n) |> int.to_int), (x) => n % x != 0)
  hint: Did you mean `int.to_int8`?
  try:
      // int.to_int(...)  →  int.to_int8(...)
      int.to_int8(...)
  |
3 |   else list.all(list.range(2, int.sqrt(n) |> int.to_int), (x) => n % x != 0)
  |                                        ^

2 error(s) found
FAILED: /tmp/dojo-is-prime-0.almd
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, float.to_int(float.sqrt(int.to_float(n)))), (x) => n % x != 0)
```

**Diagnostic:**

```
FAILED: /tmp/dojo-is-prime-1.almd
  test: is_prime 4 is false
  at:   /tmp/dojo-is-prime-1.almd:10
  expected: false
  found:    true
  test: is_prime 9 is false
  at:   /tmp/dojo-is-prime-1.almd:12
  expected: false
  found:    true
  test: is_prime 25 is false
  at:   /tmp/dojo-is-prime-1.almd:14
  expected: false
  found:    true

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.min(n, float.to_int(float.sqrt(int.to_float(n)) + 1))), (x) => n % x != 0)
```

**Diagnostic:**

```
internal compiler error: IR verify: AddFloat expects Float operands, got Float and Int (in is_prime) at line 3
FAILED: /tmp/dojo-is-prime-2.almd
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else list.all(list.range(2, int.min(n, int.to_int(float.sqrt(int.to_float(n)) + 1.0))), (x) => n % x != 0)
```

**Diagnostic:**

```
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-3.almd:3:83
  in call to int.to_int()
  here: else list.all(list.range(2, int.min(n, int.to_int(float.sqrt(int.to_float(n)) + 1.0))), (x) => n % x != 0)
  hint: Did you mean `int.to_int8`?
  try:
      int.to_int8
  |
3 |   else list.all(list.range(2, int.min(n, int.to_int(float.sqrt(int.to_float(n)) + 1.0))), (x) => n % x != 0)
  |                                                                                   ^^^

1 error(s) found
FAILED: /tmp/dojo-is-prime-3.almd
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
