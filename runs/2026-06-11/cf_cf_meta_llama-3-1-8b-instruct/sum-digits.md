# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  fn aux(x: Int) -> Int = 
    if x == 0 then 0 else (x % 10) + (aux(x / 10))
  aux(int.abs(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-sum-digits-0.almd:2:3
  |
2 |   fn aux(x: Int) -> Int =
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 4:3 (got Ident 'aux')
  --> /tmp/dojo-sum-digits-0.almd:4:3
  |
4 |   aux(int.abs(n))
  |   ^

2 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let aux(x: Int) -> Int = 
    if x == 0 then 0 else (x % 10) + (aux(x / 10))
  aux(int.abs(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: Expected Eq at line 2:10 (got LParen '(')
  --> /tmp/dojo-sum-digits-1.almd:2:10
  |
2 |   let aux(x: Int) -> Int =
  |          ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-sum-digits-1.almd:3:8
  in variable x
  hint: Did you mean `n`?
  try:
      // x  →  n
      n
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(x / 10))
  |        ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-sum-digits-1.almd:3:28
  in variable x
  hint: Did you mean `n`?
  try:
      // x  →  n
      n
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(x / 10))
  |                            ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-sum-digits-1.almd:3:43
  in variable x
  hint: Did you mean `n`?
  try:
      // x  →  n
      n
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(x / 10))
  |                                           ^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-sum-digits-1.almd:3:47
  in call to aux()
  hint: Check the function name
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(x / 10))
  |                                               ^^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-sum-digits-1.almd:4:15
  in call to aux()
  hint: Check the function name
  |
4 |   aux(int.abs(n))
  |               ^

6 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let aux(x: Int) -> Int = 
    if x == 0 then 0 else (x % 10) + (aux(int.to_int(x / 10)))
  aux(int.abs(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: Expected Eq at line 2:10 (got LParen '(')
  --> /tmp/dojo-sum-digits-2.almd:2:10
  |
2 |   let aux(x: Int) -> Int =
  |          ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-sum-digits-2.almd:3:8
  in variable x
  hint: Did you mean `n`?
  try:
      // x  →  n
      n
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(int.to_int(x / 10)))
  |        ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-sum-digits-2.almd:3:28
  in variable x
  hint: Did you mean `n`?
  try:
      // x  →  n
      n
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(int.to_int(x / 10)))
  |                            ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-sum-digits-2.almd:3:54
  in variable x
  hint: Did you mean `n`?
  try:
      // x  →  n
      n
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(int.to_int(x / 10)))
  |                                                      ^
error[E002]: undefined function 'int.to_int'
  --> /tmp/dojo-sum-digits-2.almd:3:58
  in call to int.to_int()
  hint: No function 'to_int' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(int.to_int(x / 10)))
  |                                                          ^^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-sum-digits-2.almd:3:58
  in call to aux()
  hint: Check the function name
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(int.to_int(x / 10)))
  |                                                          ^^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-sum-digits-2.almd:4:15
  in call to aux()
  hint: Check the function name
  |
4 |   aux(int.abs(n))
  |               ^

7 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let aux(x: Int) -> Int = 
    if x == 0 then 0 else (x % 10) + (aux(int.to_float(x / 10)))
  aux(int.abs(n))
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: Expected Eq at line 2:10 (got LParen '(')
  --> /tmp/dojo-sum-digits-3.almd:2:10
  |
2 |   let aux(x: Int) -> Int =
  |          ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-sum-digits-3.almd:3:8
  in variable x
  hint: Did you mean `n`?
  try:
      // x  →  n
      n
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(int.to_float(x / 10)))
  |        ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-sum-digits-3.almd:3:28
  in variable x
  hint: Did you mean `n`?
  try:
      // x  →  n
      n
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(int.to_float(x / 10)))
  |                            ^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-sum-digits-3.almd:3:56
  in variable x
  hint: Did you mean `n`?
  try:
      // x  →  n
      n
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(int.to_float(x / 10)))
  |                                                        ^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-sum-digits-3.almd:3:60
  in call to aux()
  hint: Check the function name
  |
3 |     if x == 0 then 0 else (x % 10) + (aux(int.to_float(x / 10)))
  |                                                            ^^
error[E002]: undefined function 'aux'
  --> /tmp/dojo-sum-digits-3.almd:4:15
  in call to aux()
  hint: Check the function name
  |
4 |   aux(int.abs(n))
  |               ^

6 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
