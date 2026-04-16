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
  else list.all(x => n % x != 0, list.range(3, int.sqrt(n) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-is-prime-0.almd:5:19
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
5 |   else list.all(x => n % x != 0, list.range(3, int.sqrt(n) + 1))
  |                   ^^

1 error(s) found
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
  else list.all((x) => n % x != 0, list.range(3, int.sqrt(n) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-1.almd:5:59
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
5 |   else list.all((x) => n % x != 0, list.range(3, int.sqrt(n) + 1))
  |                                                           ^
error[E005]: argument 'xs' expects List[A] but got fn(?0) -> Bool
  --> /tmp/dojo-is-prime-1.almd:5:64
  in call to list.all()
  hint: Fix the argument type
  |
5 |   else list.all((x) => n % x != 0, list.range(3, int.sqrt(n) + 1))
  |                                                                ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[Int]
  --> /tmp/dojo-is-prime-1.almd:5:64
  in call to list.all()
  hint: Fix the argument type
  |
5 |   else list.all((x) => n % x != 0, list.range(3, int.sqrt(n) + 1))
  |                                                                ^
error[E001]: type mismatch in call to list.all(): expected List[A] but got fn(?0) -> Bool
  --> /tmp/dojo-is-prime-1.almd:5:64
  in call to list.all()
  hint: Fix the expression type or change the expected type
  |
5 |   else list.all((x) => n % x != 0, list.range(3, int.sqrt(n) + 1))
  |                                                                ^
error[E001]: type mismatch in call to list.all(): expected fn(A) -> Bool but got List[Int]
  --> /tmp/dojo-is-prime-1.almd:5:64
  in call to list.all()
  hint: Fix the expression type or change the expected type
  |
5 |   else list.all((x) => n % x != 0, list.range(3, int.sqrt(n) + 1))
  |                                                                ^

5 error(s) found
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
  else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E005]: argument 'xs' expects List[A] but got fn(?1) -> ?1
  --> /tmp/dojo-is-prime-2.almd:5:117
  in call to list.map()
  hint: Fix the argument type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E005]: argument 'f' expects fn(A) -> B but got List[Int]
  --> /tmp/dojo-is-prime-2.almd:5:117
  in call to list.map()
  hint: Fix the argument type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E005]: argument 'xs' expects List[A] but got fn(?0) -> Bool
  --> /tmp/dojo-is-prime-2.almd:5:117
  in call to list.all()
  hint: Fix the argument type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[?3]
  --> /tmp/dojo-is-prime-2.almd:5:117
  in call to list.all()
  hint: Fix the argument type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E001]: type mismatch in call to list.map(): expected List[A] but got fn(?1) -> ?1
  --> /tmp/dojo-is-prime-2.almd:5:117
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got List[Int]
  --> /tmp/dojo-is-prime-2.almd:5:117
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E001]: type mismatch in call to list.all(): expected List[A] but got fn(?0) -> Bool
  --> /tmp/dojo-is-prime-2.almd:5:117
  in call to list.all()
  hint: Fix the expression type or change the expected type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E001]: type mismatch in call to list.all(): expected fn(A) -> Bool but got List[?3]
  --> /tmp/dojo-is-prime-2.almd:5:117
  in call to list.all()
  hint: Fix the expression type or change the expected type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^

8 error(s) found
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
  else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E005]: argument 'xs' expects List[A] but got fn(?1) -> ?1
  --> /tmp/dojo-is-prime-3.almd:5:117
  in call to list.map()
  hint: Fix the argument type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E005]: argument 'f' expects fn(A) -> B but got List[Int]
  --> /tmp/dojo-is-prime-3.almd:5:117
  in call to list.map()
  hint: Fix the argument type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E005]: argument 'xs' expects List[A] but got fn(?0) -> Bool
  --> /tmp/dojo-is-prime-3.almd:5:117
  in call to list.all()
  hint: Fix the argument type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E005]: argument 'f' expects fn(A) -> Bool but got List[?3]
  --> /tmp/dojo-is-prime-3.almd:5:117
  in call to list.all()
  hint: Fix the argument type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E001]: type mismatch in call to list.map(): expected List[A] but got fn(?1) -> ?1
  --> /tmp/dojo-is-prime-3.almd:5:117
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E001]: type mismatch in call to list.map(): expected fn(A) -> B but got List[Int]
  --> /tmp/dojo-is-prime-3.almd:5:117
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E001]: type mismatch in call to list.all(): expected List[A] but got fn(?0) -> Bool
  --> /tmp/dojo-is-prime-3.almd:5:117
  in call to list.all()
  hint: Fix the expression type or change the expected type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^
error[E001]: type mismatch in call to list.all(): expected fn(A) -> Bool but got List[?3]
  --> /tmp/dojo-is-prime-3.almd:5:117
  in call to list.all()
  hint: Fix the expression type or change the expected type
  |
5 |   else list.all((x) => n % x != 0, list.map((i) => i + 2, list.range(3, float.to_int(float.sqrt(int.to_float(n))) + 1)))
  |                                                                                                                     ^

8 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
