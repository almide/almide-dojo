# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
    let limit = int.sqrt(n) + 1;
    list.all[Int](list.range(3, limit, 2), |x| n % x != 0)
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

1 error(s) found
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
    let limit = int.sqrt(n) + 1;
    list.all[Int](list.range(3, limit, 2), |x| n % x != 0)
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

3 error(s) found
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
    let limit = int.sqrt(n) + 1;
    list.all[Int](list.range(3, limit, 2), |x| n % x != 0)
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

3 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false else {
    if n == 2 then true else {
      if n % 2 == 0 then false else {
        let limit = int.sqrt(n) + 1;
        list.all[Int](list.range(3, limit, 2), |x| n % x != 0)
      }
    }
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: '|x|' closure syntax is not valid in Almide at line 6:48
  --> /tmp/dojo-is-prime-3.almd:6:48
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
6 |         list.all[Int](list.range(3, limit, 2), |x| n % x != 0)
  |                                                ^
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-3.almd:5:30
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
5 |         let limit = int.sqrt(n) + 1;
  |                              ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-is-prime-3.almd:5:35
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Bool. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Bool) -> Bool = if cond then step(<update>) else x
  |
5 |         let limit = int.sqrt(n) + 1;
  |                                   ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
