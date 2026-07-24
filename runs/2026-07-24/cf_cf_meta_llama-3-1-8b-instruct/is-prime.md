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
        let max_divisor = int.sqrt(n) |> int.to_int
        let is_divisible = list.range(3, max_divisor + 1) |> list.filter(fn(x) => n % x == 0) |> list.is_empty
        is_divisible
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
error: Expected function name at line 10:76 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:10:76
   |
10 |         let is_divisible = list.range(3, max_divisor + 1) |> list.filter(fn(x) => n % x == 0) |> list.is_empty
   |                                                                            ^

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
        let max_divisor = int.sqrt(n) |> int.to_int
        let is_divisible = list.range(3, max_divisor + 1)
            |> list.filter(fn(x) => n % x == 0)
            |> list.is_empty
        is_divisible
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected Then at line 2:15 (got LBrace '{')
  --> /tmp/dojo-is-prime-1.almd:2:15
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
2 |     if n <= 1 {
  |               ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:7 (got Else 'else')
  --> /tmp/dojo-is-prime-1.almd:4:7
  |
4 |     } else if n == 2 {
  |       ^
error: Expected function name at line 11:30 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:11:30
   |
11 |             |> list.filter(fn(x) => n % x == 0)
   |                              ^
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
    if n <= 1 then false
    else if n == 2 then true
    else if n % 2 == 0 then false
    else {
        let max_divisor = int.sqrt(n) |> int.to_int
        let is_divisible = list.range(3, max_divisor + 1)
            |> list.filter(fn(x) => n % x == 0)
            |> list.is_empty
        is_divisible
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected expression at line 8:28 (got Fn 'fn')
  --> /tmp/dojo-is-prime-2.almd:8:28
  |
8 |             |> list.filter(fn(x) => n % x == 0)
  |                            ^
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-2.almd:6:36
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
6 |         let max_divisor = int.sqrt(n) |> int.to_int
  |                                    ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-is-prime-2.almd:6:36
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
6 |         let max_divisor = int.sqrt(n) |> int.to_int
  |                                    ^
error[E003]: undefined variable 'is_divisible'
  --> /tmp/dojo-is-prime-2.almd:10:9
  in variable is_divisible
  hint: Check the variable name
   |
10 |         is_divisible
   |         ^^^^^^^^^^^^

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
        let root_f = float.sqrt(int.to_float(n))
        let max_divisor = float.to_int(root_f)
        let is_divisible = list.range(3, max_divisor + 1)
            |> list.filter(fn(x) => n % x == 0)
            |> list.is_empty
        is_divisible
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected expression at line 9:28 (got Fn 'fn')
  --> /tmp/dojo-is-prime-3.almd:9:28
  |
9 |             |> list.filter(fn(x) => n % x == 0)
  |                            ^
error[E003]: undefined variable 'is_divisible'
  --> /tmp/dojo-is-prime-3.almd:11:9
  in variable is_divisible
  hint: Check the variable name
   |
11 |         is_divisible
   |         ^^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
