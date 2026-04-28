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
  else if n274 % 2 == 0 then false
  else if n < 2 then false
  else math.isqrt(n) |> int.to_int |>
           fn(x) -> n % x != 0 then true else false end
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected expression at line 7:12 (got Fn 'fn')
  --> /tmp/dojo-is-prime-0.almd:7:12
  |
7 |            fn(x) -> n % x != 0 then true else false end
  |            ^
error: Expected function name at line 7:14 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:7:14
  |
7 |            fn(x) -> n % x != 0 then true else false end
  |              ^

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
  else math.isqrt(n) |> int.to_int |> (fn(x) -> n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected expression at line 5:40 (got Fn 'fn')
  --> /tmp/dojo-is-prime-1.almd:5:40
  |
5 |   else math.isqrt(n) |> int.to_int |> (fn(x) -> n % x != 0)
  |                                        ^
error: Expected function name at line 5:42 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:5:42
  |
5 |   else math.isqrt(n) |> int.to_int |> (fn(x) -> n % x != 0)
  |                                          ^

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
  else math.isqrt(n) |> int.to_int |> (fn(x) -> n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected expression at line 5:40 (got Fn 'fn')
  --> /tmp/dojo-is-prime-2.almd:5:40
  |
5 |   else math.isqrt(n) |> int.to_int |> (fn(x) -> n % x != 0)
  |                                        ^
error: Expected function name at line 5:42 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:5:42
  |
5 |   else math.isqrt(n) |> int.to_int |> (fn(x) -> n % x != 0)
  |                                          ^

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
  else math.isqrt(n) |> int.to_int |> (fn(x) -> n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected expression at line 5:40 (got Fn 'fn')
  --> /tmp/dojo-is-prime-3.almd:5:40
  |
5 |   else math.isqrt(n) |> int.to_int |> (fn(x) -> n % x != 0)
  |                                        ^
error: Expected function name at line 5:42 (got LParen '(')
  --> /tmp/dojo-is-prime-3.almd:5:42
  |
5 |   else math.isqrt(n) |> int.to_int |> (fn(x) -> n % x != 0)
  |                                          ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
