# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0
  let high = list.len(xs) - 1
in
  while low <= high do
    let mid = (low + high) / 2
    let mid_val = option.unwrap_or(list.get(xs, mid), -1)
    if mid_val == target then
      some(mid)
    else if mid_val < target then
      low = mid + 1
    else
      high = mid - 1
  else
    none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-binary-search-0.almd:5:21
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
5 |   while low <= high do
  |                     ^^
error: Expected expression at line 14:3 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:14:3
   |
14 |   else
   |   ^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:11:19
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 2 |   let low = 0
   |   ------------------- 'low' declared here
...
11 |       low = mid + 1
   |                   ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:13:20
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 3 |   let high = list.len(xs) - 1
   |   -------------------- 'high' declared here
...
13 |       high = mid - 1
   |                    ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:13:20
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
13 |       high = mid - 1
   |                    ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:13:20
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
13 |       high = mid - 1
   |                    ^

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
in
  fn loop(low: Int, high: Int) -> Option[Int] =
    if low > high then
      none
    else
      let mid = (low + high) / 2
      let mid_val = option.unwrap_or(list.get(xs, mid), -1)
      if mid_val == target then
        some(mid)
      else if mid_val < target then
        loop(mid + 1, high)
      else
        loop(low, mid - 1)
  in
  loop(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:9:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |       let mid = (low + high) / 2
  |       ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:3:29
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with `let high = ...` (a statement, returns Unit).
      // Add `high` as the trailing expression so the fn returns Option[Int]:
      //
      //   let high = <computation>
      //   high                         // <-- add this line
      //
      // Or inline the computation as the tail expression directly.
  |
3 |   let high = list.len(xs) - 1
  |                             ^

2 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  {
    let low = 0
    let high = list.len(xs) - 1
    fn loop(low: Int, high: Int) -> Option[Int] =
      if low > high then
        none
      else
        let mid = (low + high) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        if mid_val == target then
          some(mid)
        else if mid_val < target then
          loop(mid + 1, high)
        else
          loop(low, mid - 1)
    loop(low, high)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 5:5 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:5:5
  |
5 |     fn loop(low: Int, high: Int) -> Option[Int] =
  |     ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:9:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |         let mid = (low + high) / 2
  |         ^^^
error: 'loop' is not valid in Almide at line 14:11
  --> /tmp/dojo-binary-search-2.almd:14:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
14 |           loop(mid + 1, high)
   |           ^
error: 'loop' is not valid in Almide at line 16:11
  --> /tmp/dojo-binary-search-2.almd:16:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
16 |           loop(low, mid - 1)
   |           ^
error: 'loop' is not valid in Almide at line 17:5
  --> /tmp/dojo-binary-search-2.almd:17:5
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
17 |     loop(low, high)
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:10:53
  in variable mid
  hint: Check the variable name
   |
10 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                     ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:10:60
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
10 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                            ^

7 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  {
    let low = 0
    let high = list.len(xs) - 1
    while low <= high do
    {
      let mid = (low + high) / 2
      let mid_val = option.unwrap_or(list.get(xs, mid), -1)
      if mid_val == target then
        some(mid)
      else if mid_val < target then
        low = mid + 1
      else
        high = mid - 1
    }
    none
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-binary-search-3.almd:5:23
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
5 |     while low <= high do
  |                       ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:5 (got None 'none')
  --> /tmp/dojo-binary-search-3.almd:16:5
   |
16 |     none
   |     ^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-3.almd:12:21
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 3 |     let low = 0
   |     ------------------- 'low' declared here
...
12 |         low = mid + 1
   |                     ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-3.almd:14:22
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 4 |     let high = list.len(xs) - 1
   |     -------------------- 'high' declared here
...
14 |         high = mid - 1
   |                      ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:14:22
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
14 |         high = mid - 1
   |                      ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
