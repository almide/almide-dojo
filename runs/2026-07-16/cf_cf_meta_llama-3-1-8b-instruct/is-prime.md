# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E010`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  match n {
    some(0) => false,
    some(1) => false,
    _ => 
      match n {
        some(x) => 
          if x <= 1 then false
          else 
            list.all(list.range(2, x), fn(y) => n % y != 0)
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected expression at line 10:40 (got Fn 'fn')
  --> /tmp/dojo-is-prime-0.almd:10:40
   |
10 |             list.all(list.range(2, x), fn(y) => n % y != 0)
   |                                        ^
error: Expected function name at line 10:42 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:10:42
   |
10 |             list.all(list.range(2, x), fn(y) => n % y != 0)
   |                                          ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  match n {
    some(0) => false,
    some(1) => false,
    none => false,
    some(x) => 
      if x <= 1 then false
      else list.all(list.range(2, x), fn(y) => n % y != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected expression at line 8:39 (got Fn 'fn')
  --> /tmp/dojo-is-prime-1.almd:8:39
  |
8 |       else list.all(list.range(2, x), fn(y) => n % y != 0)
  |                                       ^
error: Expected function name at line 8:41 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:8:41
  |
8 |       else list.all(list.range(2, x), fn(y) => n % y != 0)
  |                                         ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  match n {
    some(0) => false,
    some(1) => false,
    none => false,
    some(x) => 
      if x <= 1 then false
      else list.all(list.range(2, x), (y) => n % y != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-is-prime-2.almd:2:9
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
2 |   match n {
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
  match n {
    some(0) => false,
    some(1) => false,
    none => false,
    some(x) => 
      if x <= 1 then false
      else list.all(list.range(2, x), (y) => n % y != 0)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-is-prime-3.almd:2:9
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
2 |   match n {
  |         ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
