# is-prime

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool =
  if n <= 1 then
    false
  else
    list.all(list.range(2, int.sqrt(n.to_float()).to_string().parse().unwrap_or(1) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error[E002]: undefined function 'int.sqrt'
  --> /tmp/dojo-is-prime-0.almd:5:37
  in call to int.sqrt()
  hint: No function 'sqrt' in module 'int'. See docs/CHEATSHEET.md for available functions
  |
5 |     list.all(list.range(2, int.sqrt(n.to_float()).to_string().parse().unwrap_or(1) + 1), (x) => n % x != 0)
  |                                     ^

1 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool =
  if n <= 1 then
    false
  else
    list.all(list.range(2, math.sqrt(n.to_float()).to_string().parse().unwrap_or(1) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-1.almd:5:28
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |     list.all(list.range(2, math.sqrt(n.to_float()).to_string().parse().unwrap_or(1) + 1), (x) => n % x != 0)
  |                            ^^^^

1 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool =
  if n <= 1 then
    false
  else
    list.all(list.range(2, int.to_float(math.sqrt(n.to_float())).to_string().parse().unwrap_or(1) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-2.almd:5:41
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |     list.all(list.range(2, int.to_float(math.sqrt(n.to_float())).to_string().parse().unwrap_or(1) + 1), (x) => n % x != 0)
  |                                         ^^^^
error[E002]: undefined method 'to_string' on float
  --> /tmp/dojo-is-prime-2.almd:5:41
  in method call .to_string()
  hint: Almide doesn't use method-call syntax. Write `float.<fn>(x)` (or `x |> float.<fn>`) — there is no method `to_string` on `float`. Run `almide explain E002` for examples.
  |
5 |     list.all(list.range(2, int.to_float(math.sqrt(n.to_float())).to_string().parse().unwrap_or(1) + 1), (x) => n % x != 0)
  |                                         ^^^^

2 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool =
  if n <= 1 then
    false
  else
    list.all(list.range(2, int.to_float(math.sqrt(int.to_float(n))).to_string() |> int.parse().unwrap_or(1) + 1), (x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error[E003]: undefined variable 'math'
  --> /tmp/dojo-is-prime-3.almd:5:41
  in variable math
  hint: Did you mean `math.e`?
  try:
      // math  →  math.e
      math.e
  |
5 |     list.all(list.range(2, int.to_float(math.sqrt(int.to_float(n))).to_string() |> int.parse().unwrap_or(1) + 1), (x) => n % x != 0)
  |                                         ^^^^
error[E002]: undefined method 'to_string' on float
  --> /tmp/dojo-is-prime-3.almd:5:41
  in method call .to_string()
  hint: Almide doesn't use method-call syntax. Write `float.<fn>(x)` (or `x |> float.<fn>`) — there is no method `to_string` on `float`. Run `almide explain E002` for examples.
  |
5 |     list.all(list.range(2, int.to_float(math.sqrt(int.to_float(n))).to_string() |> int.parse().unwrap_or(1) + 1), (x) => n % x != 0)
  |                                         ^^^^
error[E004]: int.parse() expects 1 argument(s) but got 0
  --> /tmp/dojo-is-prime-3.almd:5:93
  in call to int.parse()
  hint: Check the number of arguments
  try:
      // int.parse() takes 1 arg(s) — you passed 0
      int.parse(<s: String>)
  |
5 |     list.all(list.range(2, int.to_float(math.sqrt(int.to_float(n))).to_string() |> int.parse().unwrap_or(1) + 1), (x) => n % x != 0)
  |                                                                                             ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
