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
    else if n % 2 == 0 || n % 3 == 0 then false
    else {
        let (divisors, i) = (2, 5)
        while i * i <= n do {
            if n % i == 0 || n % (i + 2) == 0 then return false
            let i = i + 6
        }
        true
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-0.almd
error: '||' is not valid in Almide at line 4:24
  --> /tmp/dojo-is-prime-0.almd:4:24
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     else if n % 2 == 0 || n % 3 == 0 then false
  |                        ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-is-prime-0.almd:7:26
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
7 |         while i * i <= n do {
  |                          ^^
error: '||' is not valid in Almide at line 8:27
  --> /tmp/dojo-is-prime-0.almd:8:27
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
8 |             if n % i == 0 || n % (i + 2) == 0 then return false
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:9 (got True 'true')
  --> /tmp/dojo-is-prime-0.almd:11:9
   |
11 |         true
   |         ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-0.almd:9:25
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let i = ...` (a statement, returns Unit).
      // Add `i` as the trailing expression so the fn returns Bool:
      //
      //   let i = <computation>
      //   i                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
9 |             let i = i + 6
  |                         ^

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
    else if n % 2 == 0 || n % 3 == 0 then false
    else {
        let (divisors, i) = (2, 5)
        while i * i <= n {
            if n % i == 0 || n % (i + 2) == 0 then return false
            let i = i + 6
        }
        true
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-1.almd
error: '||' is not valid in Almide at line 4:24
  --> /tmp/dojo-is-prime-1.almd:4:24
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     else if n % 2 == 0 || n % 3 == 0 then false
  |                        ^
error: '||' is not valid in Almide at line 8:27
  --> /tmp/dojo-is-prime-1.almd:8:27
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
8 |             if n % i == 0 || n % (i + 2) == 0 then return false
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:9 (got True 'true')
  --> /tmp/dojo-is-prime-1.almd:11:9
   |
11 |         true
   |         ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-1.almd:9:25
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let i = ...` (a statement, returns Unit).
      // Add `i` as the trailing expression so the fn returns Bool:
      //
      //   let i = <computation>
      //   i                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
9 |             let i = i + 6
  |                         ^

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
    else if n <= 3 then true
    else if n % 2 == 0 || n % 3 == 0 then false
    else {
        let (divisors, i) = (2, 5)
        while i * i <= n {
            if n % i == 0 || n % (i + 2) == 0 then return false
            i = i + 6
        }
        i
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-2.almd
error: '||' is not valid in Almide at line 4:24
  --> /tmp/dojo-is-prime-2.almd:4:24
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     else if n % 2 == 0 || n % 3 == 0 then false
  |                        ^
error: '||' is not valid in Almide at line 8:27
  --> /tmp/dojo-is-prime-2.almd:8:27
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
8 |             if n % i == 0 || n % (i + 2) == 0 then return false
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:9 (got Ident 'i')
  --> /tmp/dojo-is-prime-2.almd:11:9
   |
11 |         i
   |         ^
error[E009]: cannot reassign immutable binding 'i'
  --> /tmp/dojo-is-prime-2.almd:9:21
  in i = ...
  hint: Use 'var i = ...' instead of 'let i = ...' to declare a mutable variable
  try:
      // let i = ...  →  var i = ...
      var i = <initial value>
  |
9 |             i = i + 6
  |                     ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-2.almd:9:21
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
9 |             i = i + 6
  |                     ^

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
    else if n % 2 == 0 || n % 3 == 0 then false
    else {
        var i = 5
        while i * i <= n {
            if n % i == 0 || n % (i + 2) == 0 then return false
            i = i + 6
        }
        true
    }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-prime-3.almd
error: '||' is not valid in Almide at line 4:24
  --> /tmp/dojo-is-prime-3.almd:4:24
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
4 |     else if n % 2 == 0 || n % 3 == 0 then false
  |                        ^
error: '||' is not valid in Almide at line 8:27
  --> /tmp/dojo-is-prime-3.almd:8:27
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
8 |             if n % i == 0 || n % (i + 2) == 0 then return false
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:9 (got True 'true')
  --> /tmp/dojo-is-prime-3.almd:11:9
   |
11 |         true
   |         ^
error[E001]: type mismatch in fn 'is_prime': expected Bool but got Unit
  --> /tmp/dojo-is-prime-3.almd:9:21
  in fn 'is_prime'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
9 |             i = i + 6
  |                     ^

4 error(s) found
Compile error for /tmp/dojo-is-prime-3.almd:
compile failed
FAILED: /tmp/dojo-is-prime-3.almd

1/1 test file(s) failed

```
