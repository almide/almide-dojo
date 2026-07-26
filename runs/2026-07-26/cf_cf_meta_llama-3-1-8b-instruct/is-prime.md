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
  else if n <= 3 then true
  else if n mod 2 == 0 then false
  else if n mod 3 == 0 then false
  else {
    let limit = int.sqrt(n)
    let step = 2
    let test = (x) => x * x + step * x - n > 0
    let f = (x) => x * x + step * x - n
    list.all(list.range(5, limit + 1, step), (x) => test(x)) && list.all(list.range(5, limit + 1, step), (x) => f(x) > 0)
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
error: Expected Fn at line 4:17 (got Int '2')
  --> /tmp/dojo-is-prime-0.almd:4:17
  |
4 |   else if n mod 2 == 0 then false
  |                 ^
error: Expected Fn at line 5:17 (got Int '3')
  --> /tmp/dojo-is-prime-0.almd:5:17
  |
5 |   else if n mod 3 == 0 then false
  |                 ^
error: Expected String at line 9:14 (got Eq '=')
  --> /tmp/dojo-is-prime-0.almd:9:14
  |
9 |     let test = (x) => x * x + step * x - n > 0
  |              ^
error: Expected String at line 11:57 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:11:57
   |
11 |     list.all(list.range(5, limit + 1, step), (x) => test(x)) && list.all(list.range(5, limit + 1, step), (x) => f(x) > 0)
   |                                                         ^

5 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n <= 3 then true
  else if n mod 2 == 0 then false
  else if n mod 3 == 0 then false
  else {
    let limit = int.sqrt(n)
    let step = 6
    let test = (x) => x * x + step * x - n > 0
    list.all(list.range(5, limit + 1, step), (x) => test(x))
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: Expected Then at line 4:13 (got Mod 'mod')
  --> /tmp/dojo-is-prime-1.almd:4:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |   else if n mod 2 == 0 then false
  |             ^
error: Expected identifier at line 9:9 (got Test 'test')
  --> /tmp/dojo-is-prime-1.almd:9:9
  hint: `test "..."` is a top-level form. Got here mid-declaration — either the previous fn/type/impl is missing a closing `}`, or the test block shouldn't be in this file at all (harness-submitted code).
  |
9 |     let test = (x) => x * x + step * x - n > 0
  |         ^
error: Expected expression at line 10:53 (got Test 'test')
  --> /tmp/dojo-is-prime-1.almd:10:53
   |
10 |     list.all(list.range(5, limit + 1, step), (x) => test(x))
   |                                                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:1 (got RBrace '}')
  --> /tmp/dojo-is-prime-1.almd:12:1
   |
12 | }
   | ^
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-1.almd:7:26
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
7 |     let limit = int.sqrt(n)
  |                          ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-1.almd:8:16
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
8 |     let step = 6
  |                ^

6 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n <= 3 then true
  else if n mod 2 == 0 then false
  else if n mod 3 == 0 then false
  else {
    let limit = float.to_int(float.sqrt(int.to_float(n)))
    let step = 6
    let test = (x) => x * x + step * x - n > 0
    list.all(list.range(5, limit + 1, step), (x) => test(x))
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: Expected Then at line 4:13 (got Mod 'mod')
  --> /tmp/dojo-is-prime-2.almd:4:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |   else if n mod 2 == 0 then false
  |             ^
error: Expected identifier at line 9:9 (got Test 'test')
  --> /tmp/dojo-is-prime-2.almd:9:9
  hint: `test "..."` is a top-level form. Got here mid-declaration — either the previous fn/type/impl is missing a closing `}`, or the test block shouldn't be in this file at all (harness-submitted code).
  |
9 |     let test = (x) => x * x + step * x - n > 0
  |         ^
error: Expected expression at line 10:53 (got Test 'test')
  --> /tmp/dojo-is-prime-2.almd:10:53
   |
10 |     list.all(list.range(5, limit + 1, step), (x) => test(x))
   |                                                     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:1 (got RBrace '}')
  --> /tmp/dojo-is-prime-2.almd:12:1
   |
12 | }
   | ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-2.almd:8:16
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
8 |     let step = 6
  |                ^

5 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = {
  if n <= 1 then false
  else if n <= 3 then true
  else if n mod 2 == 0 then false
  else if n mod 3 == 0 then false
  else {
    let limit = float.to_int(float.sqrt(int.to_float(n)))
    let step = 6
    let test = (x) => x * x + step * x - n > 0
    !list.any(list.range(5, limit + 1, step), (x) => test(x))
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected Then at line 4:13 (got Mod 'mod')
  --> /tmp/dojo-is-prime-3.almd:4:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |   else if n mod 2 == 0 then false
  |             ^
error: Expected identifier at line 9:9 (got Test 'test')
  --> /tmp/dojo-is-prime-3.almd:9:9
  hint: `test "..."` is a top-level form. Got here mid-declaration — either the previous fn/type/impl is missing a closing `}`, or the test block shouldn't be in this file at all (harness-submitted code).
  |
9 |     let test = (x) => x * x + step * x - n > 0
  |         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:1 (got RBrace '}')
  --> /tmp/dojo-is-prime-3.almd:12:1
   |
12 | }
   | ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-3.almd:8:16
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
8 |     let step = 6
  |                ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
