# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    if n <= 1 then false
    else 
        if n == 2 then true
        else 
            if n % 2 == 0 then false
            else 
                let is_prime_candidate = fn (i: Int) -> i * i > n
                let check_divisor = fn (i: Int) -> n % i == 0
                let primes = list.filter(list.range(3, n), check_divisor)
                list.all(primes, is_prime_candidate)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-0.almd:8:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |                 let is_prime_candidate = fn (i: Int) -> i * i > n
  |                 ^^^
error: Expected function name at line 8:45 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:8:45
  |
8 |                 let is_prime_candidate = fn (i: Int) -> i * i > n
  |                                             ^
error: Expected function name at line 9:40 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:9:40
  |
9 |                 let check_divisor = fn (i: Int) -> n % i == 0
  |                                        ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    if n <= 1 then false
    else 
        if n == 2 then true
        else 
            if n % 2 == 0 then false
            else 
                let is_prime_candidate = (i: Int) -> i * i > n
                let check_divisor = (i: Int) -> n % i == 0
                list.filter(list.range(3, n), check_divisor) |>
                list.all(_, is_prime_candidate)

fn is_prime_candidate(i: Int) -> Bool = i * i > n
fn check_divisor(i: Int) -> Bool = n % i == 0

fn is_prime(n: Int) -> Bool = 
    if n <= 1 then false
    else 
        if n == 2 then true
        else 
            if n % 2 == 0 then false
            else 
                let primes = list.filter(list.range(3, n), check_divisor)
                list.all(primes, is_prime_candidate)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-1.almd:8:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |                 let is_prime_candidate = (i: Int) -> i * i > n
  |                 ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-1.almd:23:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
23 |                 let primes = list.filter(list.range(3, n), check_divisor)
   |                 ^^^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-is-prime-1.almd:13:49
  in variable n
  hint: Did you mean `i`?
  try:
      // n  →  i
      i
   |
13 | fn is_prime_candidate(i: Int) -> Bool = i * i > n
   |                                                 ^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-is-prime-1.almd:14:36
  in variable n
  hint: Did you mean `i`?
  try:
      // n  →  i
      i
   |
14 | fn check_divisor(i: Int) -> Bool = n % i == 0
   |                                    ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-1.almd:
compile failed
FAILED: /tmp/dojo-is-prime-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    if n <= 1 then false
    else 
        if n == 2 then true
        else 
            if n % 2 == 0 then false
            else 
                let is_prime_candidate = (i: Int) -> i * i > n
                let check_divisor = (i: Int) -> n % i == 0
                list.filter(list.range(3, n), check_divisor) |>
                list.all(_, is_prime_candidate)

fn is_prime_candidate(i: Int) -> Bool = i * i > n
fn check_divisor(i: Int) -> Bool = n % i == 0

fn is_prime(n: Int) -> Bool = 
    if n <= 1 then false
    else 
        if n == 2 then true
        else 
            if n % 2 == 0 then false
            else 
                let primes = list.filter(list.range(3, n), check_divisor)
                list.all(primes, is_prime_candidate)

fn is_prime(n: Int) -> Bool = 
    if n <= 1 then false
    else 
        if n == 2 then true
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-2.almd:8:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |                 let is_prime_candidate = (i: Int) -> i * i > n
  |                 ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-2.almd:23:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
23 |                 let primes = list.filter(list.range(3, n), check_divisor)
   |                 ^^^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-is-prime-2.almd:13:49
  in variable n
  hint: Did you mean `i`?
  try:
      // n  →  i
      i
   |
13 | fn is_prime_candidate(i: Int) -> Bool = i * i > n
   |                                                 ^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-is-prime-2.almd:14:36
  in variable n
  hint: Did you mean `i`?
  try:
      // n  →  i
      i
   |
14 | fn check_divisor(i: Int) -> Bool = n % i == 0
   |                                    ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-is-prime-2.almd:29:9
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Bool. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Bool) -> Bool = if cond then step(<update>) else x
   |
29 |         if n == 2 then true
   |         ^^

5 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
    if n <= 1 then false
    else 
        if n == 2 then true
        else 
            if n % 2 == 0 then false
            else 
                let is_prime_candidate = (i: Int) -> i * i > n
                let check_divisor = (i: Int) -> n % i == 0
                list.filter(list.range(3, int.to_int(math.sqrt(n)) + 1), check_divisor) |>
                list.all(_, is_prime_candidate)

fn is_prime_candidate(i: Int) -> Bool = i * i > n
fn check_divisor(i: Int) -> Bool = n % i == 0
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-3.almd:8:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |                 let is_prime_candidate = (i: Int) -> i * i > n
  |                 ^^^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-is-prime-3.almd:13:49
  in variable n
  hint: Did you mean `i`?
  try:
      // n  →  i
      i
   |
13 | fn is_prime_candidate(i: Int) -> Bool = i * i > n
   |                                                 ^
error[E003]: undefined variable 'n'
  --> /tmp/dojo-is-prime-3.almd:14:36
  in variable n
  hint: Did you mean `i`?
  try:
      // n  →  i
      i
   |
14 | fn check_divisor(i: Int) -> Bool = n % i == 0
   |                                    ^

3 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
