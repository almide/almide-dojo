# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected expression at line 5:62 (got Fn 'fn')
  --> /tmp/dojo-is-prime-0.almd:5:62
  |
5 |   else list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0)
  |                                                              ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-0.almd:1:31
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
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0) then true else false
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected expression at line 5:62 (got Fn 'fn')
  --> /tmp/dojo-is-prime-1.almd:5:62
  |
5 |   else list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0) then true else false
  |                                                              ^
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
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0) then true
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected expression at line 5:62 (got Fn 'fn')
  --> /tmp/dojo-is-prime-2.almd:5:62
  |
5 |   else list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0) then true
  |                                                              ^
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
  if n < 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0) then true
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected expression at line 5:62 (got Fn 'fn')
  --> /tmp/dojo-is-prime-3.almd:5:62
  |
5 |   else list.all(list.range(3, int.to_int(math.sqrt(n)) + 1), fn(x) => n % x != 0) then true
  |                                                              ^
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

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
