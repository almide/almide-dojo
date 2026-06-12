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
  else list.all(list.range(2, int.to_float(n).|> float.sqrt().|> float.to_int()), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected name at line 3:47 (got PipeArrow '|>')
  --> /tmp/dojo-is-prime-0.almd:3:47
  |
3 |   else list.all(list.range(2, int.to_float(n).|> float.sqrt().|> float.to_int()), (x) => n % x != 0)
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
  else list.all(list.range(2, float.to_int(float.sqrt(float.from_int(n)))), (x) => n % x != 0)
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
  else if n == 2 then true 
  else if n % 2 == 0 then false 
  else list.all(list.range(3, float.to_int(float.sqrt(float.from_int(n))) + 1, 2), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-2.almd:5:80
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
5 |   else list.all(list.range(3, float.to_int(float.sqrt(float.from_int(n))) + 1, 2), (x) => n % x != 0)
  |                                                                                ^

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
  else if n == 2 then true 
  else if n % 2 == 0 then false 
  else list.all(list.range(3, float.to_int(float.sqrt(float.from_int(n))) + 1), (x) => n % x != 0)
```
