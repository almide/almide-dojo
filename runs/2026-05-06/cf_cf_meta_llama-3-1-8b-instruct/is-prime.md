# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    let max_divisor = int.sqrt(n)
    let exists_divisor = list.any(list.range(3, max_divisor + 1, 2), fn(x) => n % x == 0)
    not exists_divisor
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let max_divisor = int.sqrt(n)
  |     ^^^
error: Expected function name at line 7:72 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:7:72
  |
7 |     let exists_divisor = list.any(list.range(3, max_divisor + 1, 2), fn(x) => n % x == 0)
  |                                                                        ^

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
  else 
    let max_divisor = int.sqrt(n)
    not (list.any(list.range(3, max_divisor + 1, 2), fn(x) => n % x == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-1.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let max_divisor = int.sqrt(n)
  |     ^^^
error: Expected function name at line 7:56 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:7:56
  |
7 |     not (list.any(list.range(3, max_divisor + 1, 2), fn(x) => n % x == 0))
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
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else 
    not (list.any(list.range(3, int.sqrt(n) + 1, 2), fn(x) => n % x == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected expression at line 6:54 (got Fn 'fn')
  --> /tmp/dojo-is-prime-2.almd:6:54
  |
6 |     not (list.any(list.range(3, int.sqrt(n) + 1, 2), fn(x) => n % x == 0))
  |                                                      ^
error: Expected function name at line 6:56 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:6:56
  |
6 |     not (list.any(list.range(3, int.sqrt(n) + 1, 2), fn(x) => n % x == 0))
  |                                                        ^

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
  else 
    not (list.any(list.range(3, int.sqrt(n) + 1, 2), (x) => n % x == 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-3.almd:6:42
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
6 |     not (list.any(list.range(3, int.sqrt(n) + 1, 2), (x) => n % x == 0))
  |                                          ^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-3.almd:6:50
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
6 |     not (list.any(list.range(3, int.sqrt(n) + 1, 2), (x) => n % x == 0))
  |                                                  ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
