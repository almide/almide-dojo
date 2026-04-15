# is-palindrome

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  let len = string.len(s)
  let rec loop(i: Int, j: Int) = 
    if i >= j then true
    else if string.get(s, i) != string.get(s, j) then false
    else loop(i + 1, j - 1)
  in loop(0, len - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-is-palindrome-0.almd:3:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
3 |   let rec loop(i: Int, j: Int) =
  |       ^^^
error: 'loop' is not valid in Almide at line 6:10
  --> /tmp/dojo-is-palindrome-0.almd:6:10
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
6 |     else loop(i + 1, j - 1)
  |          ^
error[E001]: type mismatch in fn 'is_palindrome': expected Bool but got Unit
  --> /tmp/dojo-is-palindrome-0.almd:2:24
  in fn 'is_palindrome'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let len = string.len(s)
  |                        ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn loop(s: String, i: Int, j: Int) -> Bool = 
  if i >= j then true
  else if string.get(s, i) != string.get(s, j) then false
  else loop(s, i + 1, j - 1)

fn is_palindrome(s: String) -> Bool = 
  let len = string.len(s)
  in loop(s, 0, len - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-1.almd
error: 'loop' is not valid in Almide at line 4:8
  --> /tmp/dojo-is-palindrome-1.almd:4:8
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
4 |   else loop(s, i + 1, j - 1)
  |        ^
error: Expected expression at line 8:3 (got In 'in')
  --> /tmp/dojo-is-palindrome-1.almd:8:3
  |
8 |   in loop(s, 0, len - 1)
  |   ^
error[E001]: type mismatch in fn 'is_palindrome': expected Bool but got Unit
  --> /tmp/dojo-is-palindrome-1.almd:7:24
  in fn 'is_palindrome'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
7 |   let len = string.len(s)
  |                        ^

3 error(s) found
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  let len = string.len(s)
  in (0 .. len - 1)
    |> list.filter((i) => string.get(s, i) != string.get(s, len - 1 - i))
    |> list.is_empty
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-2.almd
error: Expected expression at line 3:3 (got In 'in')
  --> /tmp/dojo-is-palindrome-2.almd:3:3
  |
3 |   in (0 .. len - 1)
  |   ^
error[E001]: type mismatch in fn 'is_palindrome': expected Bool but got Unit
  --> /tmp/dojo-is-palindrome-2.almd:2:24
  in fn 'is_palindrome'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let len = string.len(s)
  |                        ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  let len = string.len(s)
  in list.is_empty((0 .. len - 1) |> list.filter((i) => string.get(s, i) != string.get(s, len - 1 - i)))
```

**Diagnostic:**

```
Compiling /tmp/dojo-is-palindrome-3.almd
error: Expected expression at line 3:3 (got In 'in')
  --> /tmp/dojo-is-palindrome-3.almd:3:3
  |
3 |   in list.is_empty((0 .. len - 1) |> list.filter((i) => string.get(s, i) != string.get(s, len - 1 - i)))
  |   ^
error[E001]: type mismatch in fn 'is_palindrome': expected Bool but got Unit
  --> /tmp/dojo-is-palindrome-3.almd:2:24
  in fn 'is_palindrome'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Bool:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Bool
  |
2 |   let len = string.len(s)
  |                        ^

2 error(s) found
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed
FAILED: /tmp/dojo-is-palindrome-3.almd

1/1 test file(s) failed

```
