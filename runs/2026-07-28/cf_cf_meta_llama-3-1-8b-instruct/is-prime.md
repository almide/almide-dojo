# is-prime

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n <= 3 then true
  else if n % 2 == 0 || n % 3 == 0 then false
  else let div = (int.to_float(n)) / (int.to_float(6))
       list.all(list.range(5, int.to_int(div) + 1, 6), (fn(x) => n % x != 0))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: '||' is not valid in Almide at line 4:22
  --> /tmp/dojo-is-prime-0.almd:4:22
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |   else if n % 2 == 0 || n % 3 == 0 then false
  |                      ^
error: Expected function name at line 6:59 (got LParen '(')
  --> /tmp/dojo-is-prime-0.almd:6:59
  |
6 |        list.all(list.range(5, int.to_int(div) + 1, 6), (fn(x) => n % x != 0))
  |                                                           ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-0.almd:
compile failed
FAILED: /tmp/dojo-is-prime-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n <= 3 then true
  else if n % 2 == 0 || n % 3 == 0 then false
  else let div = (int.to_float(n)) / (int.to_float(6))
       list.all(list.range(5, int.to_int(div) + 1, 6), (fn(x) => n % x != 0))

fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n <= 3 then true
  else if n % 2 == 0 or n % 3 == 0 then false
  else let div = (int.to_float(n)) / (int.to_float(6))
       list.all(list.range(5, int.to_int(div) + 1, 6), fn(x) => n % x != 0)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: '||' is not valid in Almide at line 4:22
  --> /tmp/dojo-is-prime-1.almd:4:22
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |   else if n % 2 == 0 || n % 3 == 0 then false
  |                      ^
error: Expected function name at line 6:59 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:6:59
  |
6 |        list.all(list.range(5, int.to_int(div) + 1, 6), (fn(x) => n % x != 0))
  |                                                           ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-1.almd:12:8
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |   else let div = (int.to_float(n)) / (int.to_float(6))
   |        ^^^
error: Expected function name at line 13:58 (got LParen '(')
  --> /tmp/dojo-is-prime-1.almd:13:58
   |
13 |        list.all(list.range(5, int.to_int(div) + 1, 6), fn(x) => n % x != 0)
   |                                                          ^

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
  else if n <= 3 then true
  else if n % 2 == 0 or n % 3 == 0 then false
  else let div = (int.to_float(n)) / (int.to_float(6))
       list.all(list.range(5, int.to_int(div) + 1, 6), (fn(x) => n % x != 0))

fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n <= 3 then true
  else if n % 2 == 0 or n % 3 == 0 then false
  else {
    let div = (int.to_float(n)) / (int.to_float(6))
    list.all(list.range(5, int.to_int(div) + 1, 6), (fn(x) => n % x != 0))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-is-prime-2.almd:5:8
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |   else let div = (int.to_float(n)) / (int.to_float(6))
  |        ^^^
error: Expected function name at line 6:59 (got LParen '(')
  --> /tmp/dojo-is-prime-2.almd:6:59
  |
6 |        list.all(list.range(5, int.to_int(div) + 1, 6), (fn(x) => n % x != 0))
  |                                                           ^
error: Expected expression at line 14:54 (got Fn 'fn')
  --> /tmp/dojo-is-prime-2.almd:14:54
   |
14 |     list.all(list.range(5, int.to_int(div) + 1, 6), (fn(x) => n % x != 0))
   |                                                      ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-is-prime-2.almd:13:49
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Bool. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Bool) -> Bool = if cond then step(<update>) else x
   |
13 |     let div = (int.to_float(n)) / (int.to_float(6))
   |                                                 ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-2.almd:
compile failed
FAILED: /tmp/dojo-is-prime-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_prime(n: Int) -> Bool = 
  if n <= 1 then false
  else if n <= 3 then true
  else if n % 2 == 0 or n % 3 == 0 then false
  else {
    let div = (int.to_float(n)) / (int.to_float(6))
    list.all(list.range(5, int.to_int(div) + 1, 6), (fn(x) => n % x != 0))
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: Expected expression at line 7:54 (got Fn 'fn')
  --> /tmp/dojo-is-prime-3.almd:7:54
  |
7 |     list.all(list.range(5, int.to_int(div) + 1, 6), (fn(x) => n % x != 0))
  |                                                      ^
error[E001]: type mismatch in if branches: expected Bool but got Unit
  --> /tmp/dojo-is-prime-3.almd:6:49
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Bool. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Bool) -> Bool = if cond then step(<update>) else x
  |
6 |     let div = (int.to_float(n)) / (int.to_float(6))
  |                                                 ^

2 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
