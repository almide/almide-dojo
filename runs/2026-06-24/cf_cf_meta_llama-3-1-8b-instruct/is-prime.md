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
    else {
        let candidate = int.sqrt(n)
        let ok = list.all(list.range(3, candidate + 1, 2), fn(x) => n % x != 0)
        ok
    }
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
error: Expected function name at line 7:62 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:7:62
  |
7 |         let ok = list.all(list.range(3, candidate + 1, 2), fn(x) => n % x != 0)
  |                                                              ^

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
    else {
        let candidate = int.to_float(int.sqrt(n))
        let ok = list.all(list.range(3, candidate + 1, 2), fn(x) => int.to_float(n) % int.to_float(x) != 0)
        ok
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected identifier at line 7:13 (got Ok 'ok')
  --> /tmp/dojo-is-prime-1.almd:7:13
  |
7 |         let ok = list.all(list.range(3, candidate + 1, 2), fn(x) => int.to_float(n) % int.to_float(x) != 0)
  |             ^
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-1.almd:6:47
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
6 |         let candidate = int.to_float(int.sqrt(n))
  |                                               ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-is-prime-1.almd:6:47
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Bool. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Bool) -> Bool = if cond then step(<update>) else x
  |
6 |         let candidate = int.to_float(int.sqrt(n))
  |                                               ^

3 error(s) found
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
    else {
        let candidate = float.to_int(float.sqrt(int.to_float(n)))
        let ok = list.all(list.range(3, candidate + 1, 2), fn(x) => int.to_float(n) % int.to_float(x) != 0)
        ok
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected identifier at line 7:13 (got Ok 'ok')
  --> /tmp/dojo-is-prime-2.almd:7:13
  |
7 |         let ok = list.all(list.range(3, candidate + 1, 2), fn(x) => int.to_float(n) % int.to_float(x) != 0)
  |             ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-is-prime-2.almd:6:62
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Bool. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Bool) -> Bool = if cond then step(<update>) else x
  |
6 |         let candidate = float.to_int(float.sqrt(int.to_float(n)))
  |                                                              ^

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
    else {
        let candidate = float.to_int(float.sqrt(int.to_float(n)))
        let ok = list.all(list.range(3, candidate + 1, 2), fn(x) => int.to_float(n) % int.to_float(x) != 0)
        ok
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected identifier at line 7:13 (got Ok 'ok')
  --> /tmp/dojo-is-prime-3.almd:7:13
  |
7 |         let ok = list.all(list.range(3, candidate + 1, 2), fn(x) => int.to_float(n) % int.to_float(x) != 0)
  |             ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-is-prime-3.almd:6:62
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Bool. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Bool) -> Bool = if cond then step(<update>) else x
  |
6 |         let candidate = float.to_int(float.sqrt(int.to_float(n)))
  |                                                              ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
