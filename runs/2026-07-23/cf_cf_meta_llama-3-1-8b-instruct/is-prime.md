# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E013`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else 
    let divisors = list.filter(list.range(2, n), fn(x) => n % x == 0)
    divisors.is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let divisors = list.filter(list.range(2, n), fn(x) => n % x == 0)
  |     ^^^
error: Expected function name at line 4:52 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:4:52
  |
4 |     let divisors = list.filter(list.range(2, n), fn(x) => n % x == 0)
  |                                                    ^

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
    list.filter(list.range(2, n), fn(x) => n % x == 0).is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected expression at line 4:35 (got Fn 'fn')
  --> /tmp/dojo-is-prime-1.almd:4:35
  |
4 |     list.filter(list.range(2, n), fn(x) => n % x == 0).is_empty
  |                                   ^
error: Expected function name at line 4:37 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:4:37
  |
4 |     list.filter(list.range(2, n), fn(x) => n % x == 0).is_empty
  |                                     ^

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
    list.filter(list.range(2, n), (x) => n % x == 0).is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E013]: no field 'is_empty' on list
  --> /tmp/dojo-is-prime-2.almd:4:51
  in field access .is_empty
  hint: Almide values have no fields. Use `list.<fn>(x)` (or `x |> list.<fn>`) — see docs/stdlib/list.md for available functions.
  |
4 |     list.filter(list.range(2, n), (x) => n % x == 0).is_empty
  |                                                   ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false 
  else 
    list.filter(list.range(2, n), (x) => n % x == 0).is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E013]: no field 'is_empty' on list
  --> /tmp/dojo-is-prime-3.almd:4:51
  in field access .is_empty
  hint: Almide values have no fields. Use `list.<fn>(x)` (or `x |> list.<fn>`) — see docs/stdlib/list.md for available functions.
  |
4 |     list.filter(list.range(2, n), (x) => n % x == 0).is_empty
  |                                                   ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
