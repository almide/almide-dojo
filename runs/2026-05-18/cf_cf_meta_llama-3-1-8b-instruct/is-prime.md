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
  | list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0) -> true
  | _ -> false
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:10 (got Arrow '->')
  --> /tmp/dojo-is-prime-0.almd:2:10
  |
2 |   n <= 1 -> false
  |          ^
error: Expected function name at line 5:66 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:5:66
  |
5 |   | list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0) -> true
  |                                                                  ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  n < 1 -> false
  | n == 2 -> true
  | n % 2 == 0 -> false
  | list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), (x) => n % x != 0) -> true
  | _ -> false
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:9 (got Arrow '->')
  --> /tmp/dojo-is-prime-1.almd:2:9
  |
2 |   n < 1 -> false
  |         ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  n < 1 -> false
  | n == 2 -> true
  | n % 2 == 0 -> false
  | n == 3 -> true
  | list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), (x) => n % x != 0) -> true
  | _ -> false
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:9 (got Arrow '->')
  --> /tmp/dojo-is-prime-2.almd:2:9
  |
2 |   n < 1 -> false
  |         ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  n < 1 -> false
  | n == 2 -> true
  | n % 2 == 0 -> false
  | n == 3 -> true
  | n == 0 || n == 1 -> false
  | list.all[Int](list.range(3, int.to_int(math.sqrt(n)) + 1), (x) => n % x != 0) -> true
  | _ -> false
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 2:9 (got Arrow '->')
  --> /tmp/dojo-is-prime-3.almd:2:9
  |
2 |   n < 1 -> false
  |         ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
