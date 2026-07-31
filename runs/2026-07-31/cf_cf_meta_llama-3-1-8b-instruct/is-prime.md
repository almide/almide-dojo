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
    false
  } else if n == 2 {
    true
  } else if n % 2 == 0 {
    false
  } else {
    let max_divisor = int.to_float(n).sqrt().to_int();
    let ok = list.range(3, max_divisor + 1)
      |> list.filter(fn(x) => n % x != 0)
      |> list.is_empty();
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
error: Expected function name at line 11:24 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:11:24
   |
11 |       |> list.filter(fn(x) => n % x != 0)
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
  if n <= 1 {
    false
  } else if n == 2 {
    true
  } else if n % 2 == 0 {
    false
  } else {
    let max_divisor = int.to_float(n).sqrt().to_int();
    list.range(3, max_divisor + 1)
      |> list.filter(fn(x) => n % x != 0)
      |> list.is_empty()
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-is-prime-1.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n <= 1 {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-is-prime-1.almd:4:5
  |
4 |   } else if n == 2 {
  |     ^
error: Expected function name at line 11:24 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:11:24
   |
11 |       |> list.filter(fn(x) => n % x != 0)
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
  if n <= 1 {
    false
  } else if n == 2 {
    true
  } else if n % 2 == 0 {
    false
  } else {
    let max_divisor = int.to_float(n).sqrt().to_int();
    list.range(3, max_divisor + 1)
      |> list.filter(fn(x) => n % x != 0)
      |> list.is_empty()
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected Then at line 2:13 (got LBrace '{')
  --> /tmp/dojo-is-prime-2.almd:2:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |   if n <= 1 {
  |             ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:5 (got Else 'else')
  --> /tmp/dojo-is-prime-2.almd:4:5
  |
4 |   } else if n == 2 {
  |     ^
error: Expected function name at line 11:24 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:11:24
   |
11 |       |> list.filter(fn(x) => n % x != 0)
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
  if n <= 1 then false
  else if n == 2 then true
  else if n % 2 == 0 then false
  else {
    let max_divisor = float.to_int(float.sqrt(int.to_float(n)));
    list.range(3, max_divisor + 1)
      |> list.filter(fn(x) => n % x != 0)
      |> list.is_empty()
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected expression at line 8:22 (got Fn 'fn')
  --> /tmp/dojo-is-prime-3.almd:8:22
  |
8 |       |> list.filter(fn(x) => n % x != 0)
  |                      ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-is-prime-3.almd:6:60
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Bool. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Bool) -> Bool = if cond then step(<update>) else x
  |
6 |     let max_divisor = float.to_int(float.sqrt(int.to_float(n)));
  |                                                            ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
