# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.sqrt(n) + 1), fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected expression at line 5:54 (got Fn 'fn')
  --> /tmp/dojo-is-prime-0.almd:5:54
  |
5 |   else list.all[Int](list.range(3, int.sqrt(n) + 1), fn(x) => n % x != 0)
  |                                                      ^
error: Expected function name at line 5:56 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:5:56
  |
5 |   else list.all[Int](list.range(3, int.sqrt(n) + 1), fn(x) => n % x != 0)
  |                                                        ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.sqrt(n) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-1.almd:5:45
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
5 |   else list.all[Int](list.range(3, int.sqrt(n) + 1), (x) => n % x != 0)
  |                                             ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 2 then false
  else n == 2 || list.all[Int](list.range(3, int.to_int(math.sqrt(int.to_float(n))) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: '||' is not valid in Almide at line 3:15
  --> /tmp/dojo-is-prime-3.almd:3:15
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
3 |   else n == 2 || list.all[Int](list.range(3, int.to_int(math.sqrt(int.to_float(n))) + 1), (x) => n % x != 0)
  |               ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
