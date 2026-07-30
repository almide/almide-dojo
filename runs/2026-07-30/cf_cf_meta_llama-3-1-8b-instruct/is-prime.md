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
  else if n <= 3 then true
  else if n mod 2 == 0 || n mod 3 == 0 then false
  else {
    let test_limit = int.sqrt(n) + 1
    let test_primes = list.range(5, test_limit, 6)
    let all_tests_pass = list.all(test_primes, |p| n mod p != 0)
    all_tests_pass
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: Expected Then at line 4:13 (got Mod 'mod')
  --> /tmp/dojo-is-prime-0.almd:4:13
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
4 |   else if n mod 2 == 0 || n mod 3 == 0 then false
  |             ^
error: '|x|' closure syntax is not valid in Almide at line 8:48
  --> /tmp/dojo-is-prime-0.almd:8:48
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
8 |     let all_tests_pass = list.all(test_primes, |p| n mod p != 0)
  |                                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:1 (got RBrace '}')
  --> /tmp/dojo-is-prime-0.almd:11:1
   |
11 | }
   | ^
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-0.almd:6:31
  in call to int.sqrt()
  hint: Did you mean `float.sqrt(int.to_float(n))`?
  try:
      // Almide has float.sqrt; int.sqrt doesn't exist.
      // Convert → sqrt → (optionally) convert back:
      let root_f = float.sqrt(int.to_float(n))       // Float
      let root_i = float.to_int(root_f)              // Int (truncates)
      // — or inline: float.to_int(float.sqrt(int.to_float(n)))
  |
6 |     let test_limit = int.sqrt(n) + 1
  |                               ^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-0.almd:7:49
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
7 |     let test_primes = list.range(5, test_limit, 6)
  |                                                 ^
error[E003]: undefined variable 'all_tests_pass'
  --> /tmp/dojo-is-prime-0.almd:9:5
  in variable all_tests_pass
  hint: Check the variable name
  |
9 |     all_tests_pass
  |     ^^^^^^^^^^^^^^

6 error(s) found
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
  else if n mod 2 == 0 || n mod 3 == 0 then false
  else {
    let root_i = float.to_int(float.sqrt(int.to_float(n))) + 1
    let test_primes = list.range(5, root_i, 6)
    let all_tests_pass = list.all(test_primes, (x) => n mod x != 0)
    all_tests_pass
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
4 |   else if n mod 2 == 0 || n mod 3 == 0 then false
  |             ^
error: Expected ')' to close function call opened at line 8:34
  --> /tmp/dojo-is-prime-1.almd:8:57
  hint: Add ')' or check for a missing delimiter inside the function call
  |
8 |     let all_tests_pass = list.all(test_primes, (x) => n mod x != 0)
  |                                  --------------- '(' opened here
  |
8 |     let all_tests_pass = list.all(test_primes, (x) => n mod x != 0)
  |                                                         ^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:1 (got RBrace '}')
  --> /tmp/dojo-is-prime-1.almd:11:1
   |
11 | }
   | ^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-1.almd:7:45
  in call to list.range()
  hint: Check the number of arguments
  try:
      // list.range() takes 2 arg(s) — you passed 3
      list.range(<start: Int>, <end: Int>)
  |
7 |     let test_primes = list.range(5, root_i, 6)
  |                                             ^
error[E003]: undefined variable 'all_tests_pass'
  --> /tmp/dojo-is-prime-1.almd:9:5
  in variable all_tests_pass
  hint: Check the variable name
  |
9 |     all_tests_pass
  |     ^^^^^^^^^^^^^^

5 error(s) found
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
  else if n mod 2 == 0 || n mod 3 == 0 then false
  else {
    let root_i = float.to_int(float.sqrt(int.to_float(n))) + 1
    let test_primes = list.range(5, root_i)
    let test_every_6th = (x) => x % 6 == 5
    let all_tests_pass = list.all(list.filter(test_primes, test_every_6th), (x) => n mod x != 0)
    all_tests_pass
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
4 |   else if n mod 2 == 0 || n mod 3 == 0 then false
  |             ^
error: Expected ')' to close function call opened at line 9:34
  --> /tmp/dojo-is-prime-2.almd:9:86
  hint: Add ')' or check for a missing delimiter inside the function call
  |
9 |     let all_tests_pass = list.all(list.filter(test_primes, test_every_6th), (x) => n mod x != 0)
  |                                  --------------- '(' opened here
  |
9 |     let all_tests_pass = list.all(list.filter(test_primes, test_every_6th), (x) => n mod x != 0)
  |                                                                                      ^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:1 (got RBrace '}')
  --> /tmp/dojo-is-prime-2.almd:12:1
   |
12 | }
   | ^
error[E003]: undefined variable 'all_tests_pass'
  --> /tmp/dojo-is-prime-2.almd:10:5
  in variable all_tests_pass
  hint: Check the variable name
   |
10 |     all_tests_pass
   |     ^^^^^^^^^^^^^^

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
  else if n <= 3 then true
  else if n mod 2 == 0 || n mod 3 == 0 then false
  else {
    let root_i = float.to_int(float.sqrt(int.to_float(n))) + 1
    let test_primes = list.range(5, root_i)
    let test_every_6th = (x) => x % 6 == 5
    let all_tests_pass = list.all(list.filter(test_primes, test_every_6th), (x) => x != 0 && n mod x != 0)
    all_tests_pass
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
4 |   else if n mod 2 == 0 || n mod 3 == 0 then false
  |             ^
error: '&&' is not valid in Almide at line 9:91
  --> /tmp/dojo-is-prime-3.almd:9:91
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
9 |     let all_tests_pass = list.all(list.filter(test_primes, test_every_6th), (x) => x != 0 && n mod x != 0)
  |                                                                                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:1 (got RBrace '}')
  --> /tmp/dojo-is-prime-3.almd:12:1
   |
12 | }
   | ^
error[E003]: undefined variable 'all_tests_pass'
  --> /tmp/dojo-is-prime-3.almd:10:5
  in variable all_tests_pass
  hint: Check the variable name
   |
10 |     all_tests_pass
   |     ^^^^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
