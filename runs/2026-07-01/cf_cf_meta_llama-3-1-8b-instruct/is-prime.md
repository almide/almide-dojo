# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    if n <= 1 then false
    else if n == 2 then true
    else if n % 2 == 0 then false
    else (2 .. int.to_float(n)).filter(f => f % 2 == 0 && f != 2).is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-is-prime-0.almd:5:42
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
5 |     else (2 .. int.to_float(n)).filter(f => f % 2 == 0 && f != 2).is_empty
  |                                          ^^

1 error(s) found
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
    else (2 .. int.to_float(n)).filter((f) => f % 2 == 0 && f != 2).is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: '&&' is not valid in Almide at line 5:58
  --> /tmp/dojo-is-prime-1.almd:5:58
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |     else (2 .. int.to_float(n)).filter((f) => f % 2 == 0 && f != 2).is_empty
  |                                                          ^

1 error(s) found
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
    else (2 .. int.to_float(n)).filter((f) => f % 2 == 0 and f != 2).is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E013]: no field 'is_empty' on list
  --> /tmp/dojo-is-prime-2.almd:5:29
  in field access .is_empty
  hint: Almide values have no fields. Use `list.<fn>(x)` (or `x |> list.<fn>`) — see docs/stdlib/list.md for available functions.
  |
5 |     else (2 .. int.to_float(n)).filter((f) => f % 2 == 0 and f != 2).is_empty
  |                             ^

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
    else if n == 2 then true
    else if n % 2 == 0 then false
    else list.filter((f) => f % 2 == 0 and f != 2, (2 .. int.to_float(n))).is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E005]: argument 'xs' expects List[A] but got fn(Int) -> Bool
  --> /tmp/dojo-is-prime-3.almd:5:71
  in call to list.filter()
  hint: Fix the argument type
  |
5 |     else list.filter((f) => f % 2 == 0 and f != 2, (2 .. int.to_float(n))).is_empty
  |                                                                       ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[Int]
  --> /tmp/dojo-is-prime-3.almd:5:71
  in call to list.filter()
  hint: Fix the argument type
  |
5 |     else list.filter((f) => f % 2 == 0 and f != 2, (2 .. int.to_float(n))).is_empty
  |                                                                       ^
error[E013]: no field 'is_empty' on list
  --> /tmp/dojo-is-prime-3.almd:5:71
  in field access .is_empty
  hint: Almide values have no fields. Use `list.<fn>(x)` (or `x |> list.<fn>`) — see docs/stdlib/list.md for available functions.
  |
5 |     else list.filter((f) => f % 2 == 0 and f != 2, (2 .. int.to_float(n))).is_empty
  |                                                                       ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(Int) -> Bool
  --> /tmp/dojo-is-prime-3.almd:5:71
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
5 |     else list.filter((f) => f % 2 == 0 and f != 2, (2 .. int.to_float(n))).is_empty
  |                                                                       ^
error[E001]: type mismatch in call to list.filter(): expected fn(A) -> Bool but got List[Int]
  --> /tmp/dojo-is-prime-3.almd:5:71
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
5 |     else list.filter((f) => f % 2 == 0 and f != 2, (2 .. int.to_float(n))).is_empty
  |                                                                       ^

5 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
