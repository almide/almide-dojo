# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

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
  else list.all[Int](list.range(3, int.ceil(math.sqrt(n))), fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected expression at line 5:61 (got Fn 'fn')
  --> /tmp/dojo-is-prime-1.almd:5:61
  |
5 |   else list.all[Int](list.range(3, int.ceil(math.sqrt(n))), fn(x) => n % x != 0)
  |                                                             ^
error: Expected function name at line 5:63 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:5:63
  |
5 |   else list.all[Int](list.range(3, int.ceil(math.sqrt(n))), fn(x) => n % x != 0)
  |                                                               ^

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
  else list.all[Int](list.range(3, int.ceil(math.sqrt(n))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-2.almd:5:45
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |   else list.all[Int](list.range(3, int.ceil(math.sqrt(n))), (x) => n % x != 0)
  |                                             ^^^^
error[E002]: undefined function 'int.ceil'
  --> /tmp/dojo-is-prime-2.almd:5:45
  in call to int.ceil()
  hint: No function 'ceil' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.all[Int](list.range(3, int.ceil(math.sqrt(n))), (x) => n % x != 0)
  |                                             ^^^^

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
  else list.all[Int](list.range(3, math.ceil(math.sqrt(n))), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-3.almd:5:46
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |   else list.all[Int](list.range(3, math.ceil(math.sqrt(n))), (x) => n % x != 0)
  |                                              ^^^^
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-3.almd:5:36
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |   else list.all[Int](list.range(3, math.ceil(math.sqrt(n))), (x) => n % x != 0)
  |                                    ^^^^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
