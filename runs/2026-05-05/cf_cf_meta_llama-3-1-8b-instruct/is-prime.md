# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool {
  if n <= 1 {
    return false
  }
  if n == 2 {
    return true
  }
  if n % 2 == 0 {
    return false
  }
  let max_divisor = int.sqrt(n)
  let divisors = list.range(3, max_divisor + 1, 2)
  list.all(divisors, fn(x) => n % x != 0)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Missing '=' before function body at line 1:29
  --> /tmp/dojo-is-prime-0.almd:1:29
  hint: Almide requires '=' before the body. Write: fn is_prime(...) -> Type = { ... }
  |
1 | fn is_prime(n: Int) -> Bool {
  |                             ^
error: Expected function name at line 13:24 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:13:24
   |
13 |   list.all(divisors, fn(x) => n % x != 0)
   |                        ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n < 1 {
    return false
  }
  if n == 2 {
    return true
  }
  if n % 2 == 0 {
    return false
  }
  let max_divisor = int.to_int(float.sqrt(int.to_float(n)))
  let divisors = list.range(3, max_divisor + 1, 2)
  list.all(divisors, fn(x) => n % x != 0)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected Then at line 2:12 (got LBrace '{')
  --> /tmp/dojo-is-prime-1.almd:2:12
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n < 1 {
  |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got If 'if')
  --> /tmp/dojo-is-prime-1.almd:5:3
  |
5 |   if n == 2 {
  |   ^
error: Expected function name at line 13:24 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:13:24
   |
13 |   list.all(divisors, fn(x) => n % x != 0)
   |                        ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-1.almd:1:31
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
1 | fn is_prime(n: Int) -> Bool = {
  |                               ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n < 1 {
    return false
  }
  if n == 2 {
    return true
  }
  if n % 2 == 0 {
    return false
  }
  let max_divisor = int.to_int(float.sqrt(int.to_float(n)))
  let divisors = list.range(3, max_divisor + 1, 2)
  list.all(divisors, fn(x) => n % x != 0) && n > 1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected Then at line 2:12 (got LBrace '{')
  --> /tmp/dojo-is-prime-2.almd:2:12
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n < 1 {
  |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got If 'if')
  --> /tmp/dojo-is-prime-2.almd:5:3
  |
5 |   if n == 2 {
  |   ^
error: Expected function name at line 13:24 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:13:24
   |
13 |   list.all(divisors, fn(x) => n % x != 0) && n > 1
   |                        ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-2.almd:1:31
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
1 | fn is_prime(n: Int) -> Bool = {
  |                               ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n < 1 {
    return false
  }
  if n == 2 {
    return true
  }
  if n % 2 == 0 {
    return false
  }
  let max_divisor = int.to_int(float.sqrt(int.to_float(n)))
  let divisors = list.range(3, max_divisor + 1, 2)
  list.all(divisors, fn(x) => n % x != 0) && n > 1
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected Then at line 2:12 (got LBrace '{')
  --> /tmp/dojo-is-prime-3.almd:2:12
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n < 1 {
  |            ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:3 (got If 'if')
  --> /tmp/dojo-is-prime-3.almd:5:3
  |
5 |   if n == 2 {
  |   ^
error: Expected function name at line 13:24 (got LParen '(')
  --> /tmp/dojo-is-prime-3.almd:13:24
   |
13 |   list.all(divisors, fn(x) => n % x != 0) && n > 1
   |                        ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-3.almd:1:31
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
1 | fn is_prime(n: Int) -> Bool = {
  |                               ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
