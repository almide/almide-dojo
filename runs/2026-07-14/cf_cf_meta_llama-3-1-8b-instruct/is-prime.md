# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    n <= 1 -> false
    | n == 2 -> true
    | n % 2 == 0 -> false
    | list.range(3, int.to_float(n), 2.0) |> list.for_each(fn(x) => n % x == 0 -> false)
    | true -> true
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:12 (got Arrow '->')
  --> /tmp/dojo-is-prime-0.almd:2:12
  |
2 |     n <= 1 -> false
  |            ^
error: Expected function name at line 5:62 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:5:62
  |
5 |     | list.range(3, int.to_float(n), 2.0) |> list.for_each(fn(x) => n % x == 0 -> false)
  |                                                              ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    n <= 1 -> false
    | n == 2 -> true
    | n % 2 == 0 -> false
    | list.range(3, int.to_float(n), 2.0) |> list.for_each(fn(x) => (n % x == 0) -> false)
    | true -> true
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:12 (got Arrow '->')
  --> /tmp/dojo-is-prime-1.almd:2:12
  |
2 |     n <= 1 -> false
  |            ^
error: Expected function name at line 5:62 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:5:62
  |
5 |     | list.range(3, int.to_float(n), 2.0) |> list.for_each(fn(x) => (n % x == 0) -> false)
  |                                                              ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    n <= 1 -> false
    | n == 2 -> true
    | n % 2 == 0 -> false
    | list.range(3, int.to_float(n), 2.0) |> list.for_each(fn(x) => (n % x == 0) -> false)
    | true -> true
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:12 (got Arrow '->')
  --> /tmp/dojo-is-prime-2.almd:2:12
  |
2 |     n <= 1 -> false
  |            ^
error: Expected function name at line 5:62 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:5:62
  |
5 |     | list.range(3, int.to_float(n), 2.0) |> list.for_each(fn(x) => (n % x == 0) -> false)
  |                                                              ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    n <= 1 -> false
    | n == 2 -> true
    | n % 2 == 0 -> false
    | list.filter(list.range(3, int.to_float(n), 2.0), fn(x) => (n % x == 0)) |> list.is_empty -> true
    | true -> false
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:12 (got Arrow '->')
  --> /tmp/dojo-is-prime-3.almd:2:12
  |
2 |     n <= 1 -> false
  |            ^
error: Expected function name at line 5:58 (got LParen '(')
  --> /tmp/dojo-is-prime-3.almd:5:58
  |
5 |     | list.filter(list.range(3, int.to_float(n), 2.0), fn(x) => (n % x == 0)) |> list.is_empty -> true
  |                                                          ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
