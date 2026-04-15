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
  else list.for_each(list.range(3, int.sqrt(n) + 1, 2), (x) => if n % x == 0 then false else true)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-0.almd:5:45
  in call to int.sqrt()
  hint: No function 'sqrt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.for_each(list.range(3, int.sqrt(n) + 1, 2), (x) => if n % x == 0 then false else true)
  |                                             ^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-0.almd:5:53
  in call to list.range()
  hint: Check the number of arguments
  |
5 |   else list.for_each(list.range(3, int.sqrt(n) + 1, 2), (x) => if n % x == 0 then false else true)
  |                                                     ^
error[E002]: undefined function 'list.for_each'
  --> /tmp/dojo-is-prime-0.almd:5:94
  in call to list.for_each()
  hint: No function 'for_each' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.for_each(list.range(3, int.sqrt(n) + 1, 2), (x) => if n % x == 0 then false else true)
  |                                                                                              ^^^^

3 error(s) found
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
  else list.fold(list.range(3, int.sqrt(n) + 1, 2), true, (acc, x) => if n % x == 0 then false else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-1.almd:5:41
  in call to int.sqrt()
  hint: No function 'sqrt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.fold(list.range(3, int.sqrt(n) + 1, 2), true, (acc, x) => if n % x == 0 then false else acc)
  |                                         ^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-1.almd:5:49
  in call to list.range()
  hint: Check the number of arguments
  |
5 |   else list.fold(list.range(3, int.sqrt(n) + 1, 2), true, (acc, x) => if n % x == 0 then false else acc)
  |                                                 ^

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
  else list.fold(list.range(3, math.sqrt(n) + 1, 2), true, (acc, x) => if n % x == 0 then false else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-2.almd:5:32
  in variable math
  hint: Did you mean `math.e`?
  |
5 |   else list.fold(list.range(3, math.sqrt(n) + 1, 2), true, (acc, x) => if n % x == 0 then false else acc)
  |                                ^^^^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-2.almd:5:50
  in call to list.range()
  hint: Check the number of arguments
  |
5 |   else list.fold(list.range(3, math.sqrt(n) + 1, 2), true, (acc, x) => if n % x == 0 then false else acc)
  |                                                  ^

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
  else list.fold(list.range(3, int.sqrt(n) + 1, 2), true, (acc, x) => if n % x == 0 then false else acc)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-3.almd:5:41
  in call to int.sqrt()
  hint: No function 'sqrt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |   else list.fold(list.range(3, int.sqrt(n) + 1, 2), true, (acc, x) => if n % x == 0 then false else acc)
  |                                         ^
error[E004]: list.range() expects 2 argument(s) but got 3
  --> /tmp/dojo-is-prime-3.almd:5:49
  in call to list.range()
  hint: Check the number of arguments
  |
5 |   else list.fold(list.range(3, int.sqrt(n) + 1, 2), true, (acc, x) => if n % x == 0 then false else acc)
  |                                                 ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
