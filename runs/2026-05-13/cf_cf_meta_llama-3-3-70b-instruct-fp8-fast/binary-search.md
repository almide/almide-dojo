# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E009`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0
  and high = list.len(xs) - 1
  in
  while low <= high {
    let mid = (low + high) / 2
    and mid_val = option.unwrap_or(list.get(xs, mid), -1)
    in
    if mid_val == target then
      some(mid)
    else if mid_val < target then
      low = mid + 1
      none
    else
      high = mid - 1
      none
  }
  |> ignore
  none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-binary-search-0.almd:3:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
3 |   and high = list.len(xs) - 1
  |            ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-binary-search-0.almd:7:17
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     and mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                 ^
error: Expected expression at line 14:5 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:14:5
   |
14 |     else
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:3 (got RBrace '}')
  --> /tmp/dojo-binary-search-0.almd:17:3
   |
17 |   }
   |   ^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:3:7
  in variable high
  hint: Check the variable name
  |
3 |   and high = list.len(xs) - 1
  |       ^^^^
error: operator 'and' requires Bool but got Int
  --> /tmp/dojo-binary-search-0.almd:3:7
  in operator and
  hint: Use Bool values with logical operators
  |
3 |   and high = list.len(xs) - 1
  |       ^^^^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-0.almd:9:8
  in variable mid_val
  hint: Check the variable name
  |
9 |     if mid_val == target then
  |        ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:10:12
  in variable mid
  hint: Check the variable name
   |
10 |       some(mid)
   |            ^^^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-0.almd:11:13
  in variable mid_val
  hint: Check the variable name
   |
11 |     else if mid_val < target then
   |             ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:12:13
  in variable mid
  hint: Check the variable name
   |
12 |       low = mid + 1
   |             ^^^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:12:19
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 2 |   let low = 0
   |   ------------------- 'low' declared here
...
12 |       low = mid + 1
   |                   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:15:14
  in variable mid
  hint: Check the variable name
   |
15 |       high = mid - 1
   |              ^^^
error[E001]: type mismatch in if branches: expected Option[Unknown] but got Unit
  --> /tmp/dojo-binary-search-0.almd:11:10
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Unknown]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Unknown]) -> Option[Unknown] = if cond then step(<update>) else x
   |
11 |     else if mid_val < target then
   |          ^^

13 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  var low = 0
  and high = list.len(xs) - 1
  in
  while low <= high {
    let mid = (low + high) / 2
    and mid_val = option.unwrap_or(list.get(xs, mid), -1)
    in
    if mid_val == target then
      some(mid)
    else if mid_val < target then
      low = mid + 1
    else
      high = mid - 1
  }
  none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-binary-search-1.almd:3:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
3 |   and high = list.len(xs) - 1
  |            ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-binary-search-1.almd:7:17
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     and mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:3 (got RBrace '}')
  --> /tmp/dojo-binary-search-1.almd:15:3
   |
15 |   }
   |   ^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:3:7
  in variable high
  hint: Check the variable name
  |
3 |   and high = list.len(xs) - 1
  |       ^^^^
error: operator 'and' requires Bool but got Int
  --> /tmp/dojo-binary-search-1.almd:3:7
  in operator and
  hint: Use Bool values with logical operators
  |
3 |   and high = list.len(xs) - 1
  |       ^^^^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-1.almd:9:8
  in variable mid_val
  hint: Check the variable name
  |
9 |     if mid_val == target then
  |        ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:10:12
  in variable mid
  hint: Check the variable name
   |
10 |       some(mid)
   |            ^^^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-1.almd:11:13
  in variable mid_val
  hint: Check the variable name
   |
11 |     else if mid_val < target then
   |             ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:12:13
  in variable mid
  hint: Check the variable name
   |
12 |       low = mid + 1
   |             ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:14:14
  in variable mid
  hint: Check the variable name
   |
14 |       high = mid - 1
   |              ^^^
error[E001]: type mismatch in if branches: expected Option[Unknown] but got Unit
  --> /tmp/dojo-binary-search-1.almd:14:20
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Unknown]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Unknown]) -> Option[Unknown] = if cond then step(<update>) else x
   |
14 |       high = mid - 1
   |                    ^

11 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0
  and high = list.len(xs) - 1
  in
  while low <= high {
    let mid = (low + high) / 2
    and mid_val = option.unwrap_or(list.get(xs, mid), -1)
    in
    if mid_val == target then
      some(mid)
    else if mid_val < target then
      let low = mid + 1
      in low
    else
      let high = mid - 1
      in high
  }
  none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-binary-search-2.almd:3:12
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
3 |   and high = list.len(xs) - 1
  |            ^
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-binary-search-2.almd:7:17
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
  |
7 |     and mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                 ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:12:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |       let low = mid + 1
   |       ^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:3 (got RBrace '}')
  --> /tmp/dojo-binary-search-2.almd:17:3
   |
17 |   }
   |   ^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:3:7
  in variable high
  hint: Check the variable name
  |
3 |   and high = list.len(xs) - 1
  |       ^^^^
error: operator 'and' requires Bool but got Int
  --> /tmp/dojo-binary-search-2.almd:3:7
  in operator and
  hint: Use Bool values with logical operators
  |
3 |   and high = list.len(xs) - 1
  |       ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:15:18
  in variable mid
  hint: Check the variable name
   |
15 |       let high = mid - 1
   |                  ^^^

7 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0
  let high = list.len(xs) - 1
  in
  while low <= high {
    let mid = (low + high) / 2
    let mid_val = option.unwrap_or(list.get(xs, mid), -1)
    in
    if mid_val == target then
      some(mid)
    else if mid_val < target then
      low = mid + 1
    else
      high = mid - 1
  }
  none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-3.almd:12:19
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 2 |   let low = 0
   |   ------------------- 'low' declared here
...
12 |       low = mid + 1
   |                   ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-3.almd:14:20
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 3 |   let high = list.len(xs) - 1
   |   -------------------- 'high' declared here
...
14 |       high = mid - 1
   |                    ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:14:20
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
14 |       high = mid - 1
   |                    ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
