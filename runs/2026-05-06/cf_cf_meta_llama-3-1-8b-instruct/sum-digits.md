# sum-digits

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E009`

## Attempts

### Attempt 1 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    let digits = 
      let x = n 
      while x > 0 do 
        let digit = x % 10 
        x = x / 10 
        digits + [digit] 
    list.fold(digits, 0, (acc, x) => acc + x) 
  int.abs(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-0.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let digits =
  |     ^^^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-sum-digits-0.almd:5:19
  in while body
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
5 |       while x > 0 do
  |                   ^^
error[E009]: cannot reassign immutable binding 'x'
  --> /tmp/dojo-sum-digits-0.almd:7:17
  in x = ...
  hint: Use 'var x = ...' instead of 'let x = ...' to declare a mutable variable
  try:
      // let x = ...  →  var x = ...
      var x = <initial value>
  |
4 |       let x = n
  |       ----------------- 'x' declared here
...
7 |         x = x / 10
  |                 ^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:8:9
  in variable digits
  hint: Did you mean `digit`?
  try:
      // digits  →  digit
      digit
  |
8 |         digits + [digit]
  |         ^^^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-0.almd:9:15
  in variable digits
  hint: Did you mean `digit`?
  try:
      // digits  →  digit
      digit
  |
9 |     list.fold(digits, 0, (acc, x) => acc + x)
  |               ^^^^^^

5 error(s) found
Compile error for /tmp/dojo-sum-digits-0.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    let digits = 
      var x = n
      while x > 0 do 
        let digit = x % 10 
        x = x / 10 
        digits + [digit] 
    list.fold(digits, 0, (acc, x) => acc + x) 
  int.abs(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-1.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let digits =
  |     ^^^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-sum-digits-1.almd:5:19
  in while body
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
5 |       while x > 0 do
  |                   ^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-1.almd:8:9
  in variable digits
  hint: Did you mean `digit`?
  try:
      // digits  →  digit
      digit
  |
8 |         digits + [digit]
  |         ^^^^^^
error[E003]: undefined variable 'digits'
  --> /tmp/dojo-sum-digits-1.almd:9:15
  in variable digits
  hint: Did you mean `digit`?
  try:
      // digits  →  digit
      digit
  |
9 |     list.fold(digits, 0, (acc, x) => acc + x)
  |               ^^^^^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-1.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    let digits = 
      var x = n
      var acc = 0
      while x > 0 { 
        let digit = x % 10 
        x = x / 10 
        acc = acc + digit 
      }
    acc 
  int.abs(n)
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-2.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let digits =
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-sum-digits-2.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn sum_digits(n: Int) -> Int = 
  let sum = 
    let acc = 0
    let x = n
    while x > 0 { 
      let digit = x % 10 
      x = x / 10 
      acc = acc + digit 
    }
  int.abs(n) * sum
```

**Diagnostic:**

```
Compiling /tmp/dojo-sum-digits-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-sum-digits-3.almd:3:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
3 |     let acc = 0
  |     ^^^
error[E009]: cannot reassign immutable binding 'x'
  --> /tmp/dojo-sum-digits-3.almd:7:15
  in x = ...
  hint: Use 'var x = ...' instead of 'let x = ...' to declare a mutable variable
  try:
      // let x = ...  →  var x = ...
      var x = <initial value>
  |
4 |     let x = n
  |     ----------------- 'x' declared here
...
7 |       x = x / 10
  |               ^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-sum-digits-3.almd:8:13
  in variable acc
  hint: Check the variable name
  |
8 |       acc = acc + digit
  |             ^^^
error[E003]: undefined variable 'sum'
  --> /tmp/dojo-sum-digits-3.almd:10:16
  in variable sum
  hint: Check the variable name
   |
10 |   int.abs(n) * sum
   |                ^^^

4 error(s) found
Compile error for /tmp/dojo-sum-digits-3.almd:
compile failed
FAILED: /tmp/dojo-sum-digits-3.almd

1/1 test file(s) failed

```
