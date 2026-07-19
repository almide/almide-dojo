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
  else (2 until int.sqrt(n) + 1).all(fn(i) => n % i != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected ')' to close parenthesized expression opened at line 5:8
  --> /tmp/dojo-is-prime-0.almd:5:11
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   else (2 until int.sqrt(n) + 1).all(fn(i) => n % i != 0)
  |        --------------- '(' opened here
  |
5 |   else (2 until int.sqrt(n) + 1).all(fn(i) => n % i != 0)
  |           ^^^^^
error: Expected function name at line 5:40 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:5:40
  |
5 |   else (2 until int.sqrt(n) + 1).all(fn(i) => n % i != 0)
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
  if n <= 1 then false 
  else if n == 2 then true 
  else if n % 2 == 0 then false 
  else list.all((2 until int.sqrt(n) + 1).to_list(), fn(i) => n % i != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected ')' to close parenthesized expression opened at line 5:17
  --> /tmp/dojo-is-prime-1.almd:5:20
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   else list.all((2 until int.sqrt(n) + 1).to_list(), fn(i) => n % i != 0)
  |                 --------------- '(' opened here
  |
5 |   else list.all((2 until int.sqrt(n) + 1).to_list(), fn(i) => n % i != 0)
  |                    ^^^^^
error: Expected function name at line 5:56 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:5:56
  |
5 |   else list.all((2 until int.sqrt(n) + 1).to_list(), fn(i) => n % i != 0)
  |                                                        ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n == 2 then true 
  else if n % 2 == 0 then false 
  else list.all((2 until int.sqrt(n) + 1).to_list(), (fn(i) => n % i != 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected ')' to close parenthesized expression opened at line 5:17
  --> /tmp/dojo-is-prime-2.almd:5:20
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   else list.all((2 until int.sqrt(n) + 1).to_list(), (fn(i) => n % i != 0))
  |                 --------------- '(' opened here
  |
5 |   else list.all((2 until int.sqrt(n) + 1).to_list(), (fn(i) => n % i != 0))
  |                    ^^^^^
error: Expected function name at line 5:57 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:5:57
  |
5 |   else list.all((2 until int.sqrt(n) + 1).to_list(), (fn(i) => n % i != 0))
  |                                                         ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else if n == 2 then true 
  else if n % 2 == 0 then false 
  else list.all((2 until int.sqrt(n) + 1).to_list(), (fn(i) => (n % i != 0)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected ')' to close parenthesized expression opened at line 5:17
  --> /tmp/dojo-is-prime-3.almd:5:20
  hint: Add ')' or check for a missing delimiter inside the parenthesized expression
  |
5 |   else list.all((2 until int.sqrt(n) + 1).to_list(), (fn(i) => (n % i != 0)))
  |                 --------------- '(' opened here
  |
5 |   else list.all((2 until int.sqrt(n) + 1).to_list(), (fn(i) => (n % i != 0)))
  |                    ^^^^^
error: Expected function name at line 5:57 (got LParen '(')
  --> /tmp/dojo-is-prime-3.almd:5:57
  |
5 |   else list.all((2 until int.sqrt(n) + 1).to_list(), (fn(i) => (n % i != 0)))
  |                                                         ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
