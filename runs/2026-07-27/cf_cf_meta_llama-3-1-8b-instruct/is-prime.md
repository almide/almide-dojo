# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, list.interrupt(n, 2), 2), fn(x) => n % x != 0)
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
error: Expected function name at line 5:59 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:5:59
  |
5 |   else list.all(list.range(3, list.interrupt(n, 2), 2), fn(x) => n % x != 0)
  |                                                           ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, list.interrupt(n, 2), 2), fn(x) => n % x != 0)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected expression at line 5:57 (got Fn 'fn')
  --> /tmp/dojo-is-prime-1.almd:5:57
  |
5 |   else list.all(list.range(3, list.interrupt(n, 2), 2), fn(x) => n % x != 0)
  |                                                         ^
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

2 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, list.interrupt(n, 2), 2), fn(x) => n % x != 0)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected expression at line 5:57 (got Fn 'fn')
  --> /tmp/dojo-is-prime-2.almd:5:57
  |
5 |   else list.all(list.range(3, list.interrupt(n, 2), 2), fn(x) => n % x != 0)
  |                                                         ^
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

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, list.interrupt(n, 2), 2), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected expression at line 7:1 (got Test 'test')
  --> /tmp/dojo-is-prime-3.almd:7:1
  |
7 | test "is_prime -1 is false" { assert_eq(is_prime(-1), false) }
  | ^
error[E002]: undefined function 'list.interrupt'
  --> /tmp/dojo-is-prime-3.almd:5:49
  in call to list.interrupt()
  hint: No function 'interrupt' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.all(list.range(3, list.interrupt(n, 2), 2), (x) => n % x != 0)
  |                                                 ^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-3.almd:5:53
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
5 |   else list.all(list.range(3, list.interrupt(n, 2), 2), (x) => n % x != 0)
  |                                                     ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-3.almd:5:73
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
5 |   else list.all(list.range(3, list.interrupt(n, 2), 2), (x) => n % x != 0)
  |                                                                         ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
