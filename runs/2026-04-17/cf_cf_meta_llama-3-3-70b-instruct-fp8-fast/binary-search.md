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
  let high = list.len(xs) - 1 
  while low <= high do 
    let mid = (low + high) / 2 
    let mid_val = option.unwrap_or(list.get(xs, mid), -1) 
    if mid_val == target then some(mid) 
    else if mid_val < target then low = mid + 1 
    else high = mid - 1 
  else none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-binary-search-0.almd:4:21
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
4 |   while low <= high do
  |                     ^^
error: Expected expression at line 10:3 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:10:3
   |
10 |   else none
   |   ^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:8:47
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
  |
2 |   let low = 0
  |   ------------------- 'low' declared here
...
8 |     else if mid_val < target then low = mid + 1
  |                                               ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:9:23
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
  |
3 |   let high = list.len(xs) - 1
  |   -------------------- 'high' declared here
...
9 |     else high = mid - 1
  |                       ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:9:23
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
9 |     else high = mid - 1
  |                       ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:9:23
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
9 |     else high = mid - 1
  |                       ^

6 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0 
  let high = list.len(xs) - 1 
  let loop = fn(i: Int, j: Int) -> Option[Int] = 
    if i > j then none 
    else 
      let mid = (i + j) / 2 
      let mid_val = option.unwrap_or(list.get(xs, mid), -1) 
      if mid_val == target then some(mid) 
      else if mid_val < target then loop(mid + 1, j) 
      else loop(i, mid - 1) 
  loop(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 4:14 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:4:14
  |
4 |   let loop = fn(i: Int, j: Int) -> Option[Int] =
  |              ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let mid = (i + j) / 2
  |       ^^^
error: 'loop' is not valid in Almide at line 10:37
  --> /tmp/dojo-binary-search-1.almd:10:37
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
10 |       else if mid_val < target then loop(mid + 1, j)
   |                                     ^
error: 'loop' is not valid in Almide at line 12:3
  --> /tmp/dojo-binary-search-1.almd:12:3
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
12 |   loop(low, high)
   |   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:8:51
  in variable mid
  hint: Check the variable name
  |
8 |       let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                                                   ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:8:58
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
8 |       let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                                                          ^

6 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0 
  let high = list.len(xs) - 1 
  {
    let loop = (i: Int, j: Int) => 
      if i > j then none 
      else 
        let mid = (i + j) / 2 
        let mid_val = option.unwrap_or(list.get(xs, mid), -1) 
        if mid_val == target then some(mid) 
        else if mid_val < target then loop(mid + 1, j) 
        else loop(i, mid - 1) 
    loop(low, high)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:8:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let mid = (i + j) / 2
  |         ^^^
error: 'loop' is not valid in Almide at line 11:39
  --> /tmp/dojo-binary-search-2.almd:11:39
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
11 |         else if mid_val < target then loop(mid + 1, j)
   |                                       ^
error: 'loop' is not valid in Almide at line 13:5
  --> /tmp/dojo-binary-search-2.almd:13:5
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
13 |     loop(low, high)
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:9:53
  in variable mid
  hint: Check the variable name
  |
9 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                                                     ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:9:60
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
9 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                                                            ^

5 error(s) found
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
  {
    while low <= high {
      let mid = (low + high) / 2 
      let mid_val = option.unwrap_or(list.get(xs, mid), -1) 
      if mid_val == target then some(mid) 
      else if mid_val < target then low = mid + 1 
      else high = mid - 1
    }
    none
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-3.almd:9:49
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
  |
2 |   let low = 0
  |   ------------------- 'low' declared here
...
9 |       else if mid_val < target then low = mid + 1
  |                                                 ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-3.almd:10:25
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 3 |   let high = list.len(xs) - 1
   |   -------------------- 'high' declared here
...
10 |       else high = mid - 1
   |                         ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:10:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
10 |       else high = mid - 1
   |                         ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
