# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected expression at line 5:67 (got Fn 'fn')
  --> /tmp/dojo-is-prime-0.almd:5:67
  |
5 |   else list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  |                                                                   ^
error: Expected function name at line 5:69 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:5:69
  |
5 |   else list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  |                                                                     ^

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
  else list.all[Int_map(fn(x) => n % x != 0), list.range(3, int.to_int(math.sqrt(n)) + 1)]
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected expression at line 5:25 (got Fn 'fn')
  --> /tmp/dojo-is-prime-1.almd:5:25
  |
5 |   else list.all[Int_map(fn(x) => n % x != 0), list.range(3, int.to_int(math.sqrt(n)) + 1)]
  |                         ^
error: Expected function name at line 5:27 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:5:27
  |
5 |   else list.all[Int_map(fn(x) => n % x != 0), list.range(3, int.to_int(math.sqrt(n)) + 1)]
  |                           ^

2 error(s) found
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
  else list.all[Int](list.map[Int, Int](fn(x) => n % x != 0), list.range(3, int.to_int(math.sqrt(n)) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected expression at line 5:41 (got Fn 'fn')
  --> /tmp/dojo-is-prime-2.almd:5:41
  |
5 |   else list.all[Int](list.map[Int, Int](fn(x) => n % x != 0), list.range(3, int.to_int(math.sqrt(n)) + 1))
  |                                         ^
error: Expected function name at line 5:43 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:5:43
  |
5 |   else list.all[Int](list.map[Int, Int](fn(x) => n % x != 0), list.range(3, int.to_int(math.sqrt(n)) + 1))
  |                                           ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all[Int](list.map[Int, Int](fn(x) => n % x != 0), list.range(3, int.to_int(math.sqrt(n)) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected expression at line 5:41 (got Fn 'fn')
  --> /tmp/dojo-is-prime-3.almd:5:41
  |
5 |   else list.all[Int](list.map[Int, Int](fn(x) => n % x != 0), list.range(3, int.to_int(math.sqrt(n)) + 1))
  |                                         ^
error: Expected function name at line 5:43 (got LParen '(')
  --> /tmp/dojo-is-prime-3.almd:5:43
  |
5 |   else list.all[Int](list.map[Int, Int](fn(x) => n % x != 0), list.range(3, int.to_int(math.sqrt(n)) + 1))
  |                                           ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
