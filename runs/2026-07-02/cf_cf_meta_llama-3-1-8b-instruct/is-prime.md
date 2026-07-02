# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else 
    let divisors = list.filter(range(2, n), fn(x) => n % x == 0)
    list.is_empty(divisors)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let divisors = list.filter(range(2, n), fn(x) => n % x == 0)
  |     ^^^
error: Expected function name at line 4:47 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:4:47
  |
4 |     let divisors = list.filter(range(2, n), fn(x) => n % x == 0)
  |                                               ^

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
  else 
    list.is_empty(list.filter(list.range(2, n), fn(x) => n % x == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected expression at line 4:49 (got Fn 'fn')
  --> /tmp/dojo-is-prime-1.almd:4:49
  |
4 |     list.is_empty(list.filter(list.range(2, n), fn(x) => n % x == 0))
  |                                                 ^
error: Expected function name at line 4:51 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:4:51
  |
4 |     list.is_empty(list.filter(list.range(2, n), fn(x) => n % x == 0))
  |                                                   ^

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
  else 
    list.is_empty(list.filter(list.range(2, n), fn(x) => (n % x) == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected expression at line 4:49 (got Fn 'fn')
  --> /tmp/dojo-is-prime-2.almd:4:49
  |
4 |     list.is_empty(list.filter(list.range(2, n), fn(x) => (n % x) == 0))
  |                                                 ^
error: Expected function name at line 4:51 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:4:51
  |
4 |     list.is_empty(list.filter(list.range(2, n), fn(x) => (n % x) == 0))
  |                                                   ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else 
    list.is_empty(list.filter(list.range(2, n), (x) => (n % x) == 0))
```
