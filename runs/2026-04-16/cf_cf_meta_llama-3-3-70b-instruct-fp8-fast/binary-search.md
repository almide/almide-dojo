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
  while low <= high {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
    if mid_val == target then some(mid)
    else if mid_val < target then low = mid + 1
    else high = mid - 1
  } 
  |> none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: `let ... in <expr>` is OCaml/Haskell syntax
  --> /tmp/dojo-binary-search-0.almd:4:3
  in let ... in
  hint: In Almide, multiple lets chain by newlines inside a block — no `in` keyword.
  try:
      let x = 1
      let y = 2
      x + y
  |
4 |   in
  |   ^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:3:29
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
  while low <= high {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
    if mid_val == target then some(mid)
    else if mid_val < target then low = mid + 1
    else high = mid - 1
  } 
  |> none

should be rewritten to 

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0
  let high = list.len(xs) - 1
  let rec loop(low: Int, high: Int) = 
    if low > high then none
    else 
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
      if mid_val == target then some(mid)
      else if mid_val < target then loop(mid + 1, high)
      else loop(low, mid - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-1.almd:18:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
   |
18 |   let rec loop(low: Int, high: Int) =
   |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:21:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
21 |       let mid = (low + high) / 2
   |       ^^^
error: 'loop' is not valid in Almide at line 24:37
  --> /tmp/dojo-binary-search-1.almd:24:37
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
24 |       else if mid_val < target then loop(mid + 1, high)
   |                                     ^
error[E012]: duplicate function 'binary_search'
  at line 15
  in fn binary_search
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
   | ---------------------------------------- first definition of 'binary_search' here
...
15 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
   | ^^^^^^^^^^^^^^^^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 3
  --> /tmp/dojo-binary-search-1.almd:6:64
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 3
      option.unwrap_or(<o: Option[A]>, <default: A>)
  |
6 |     let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                                                ^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-1.almd:8:47
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
  --> /tmp/dojo-binary-search-1.almd:9:23
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
error[E003]: undefined variable 'should'
  --> /tmp/dojo-binary-search-1.almd:13:1
  in variable should
  hint: Check the variable name
   |
13 | should be rewritten to
   | ^^^^^^
error[E003]: undefined variable 'be'
  --> /tmp/dojo-binary-search-1.almd:13:8
  in variable be
  hint: Did you mean `xs`?
  try:
      // be  →  xs
      xs
   |
13 | should be rewritten to
   |        ^^
error[E003]: undefined variable 'rewritten'
  --> /tmp/dojo-binary-search-1.almd:13:11
  in variable rewritten
  hint: Check the variable name
   |
13 | should be rewritten to
   |           ^^^^^^^^^
error[E003]: undefined variable 'to'
  --> /tmp/dojo-binary-search-1.almd:13:21
  in variable to
  hint: Did you mean `xs`?
  try:
      // to  →  xs
      xs
   |
13 | should be rewritten to
   |                     ^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:22:34
  in variable mid
  hint: Check the variable name
   |
22 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
   |                                  ^^^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 3
  --> /tmp/dojo-binary-search-1.almd:22:66
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 3
      option.unwrap_or(<o: Option[A]>, <default: A>)
   |
22 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
   |                                                                  ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Int but got Option[?0]
  --> /tmp/dojo-binary-search-1.almd:6:64
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
6 |     let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                                                ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:9:23
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
error[E001]: type mismatch in pipe call: expected Option[?1] but got fn(Unit) -> ?2
  --> /tmp/dojo-binary-search-1.almd:11:6
  in pipe call
  hint: Fix the expression type or change the expected type
   |
11 |   |> none
   |      ^^^^
error[E001]: type mismatch in call to option.unwrap_or(): expected Int but got Option[?3]
  --> /tmp/dojo-binary-search-1.almd:22:66
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
22 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
   |                                                                  ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:22:66
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
22 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
   |                                                                  ^

18 error(s) found
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
  fn loop(low: Int, high: Int) -> Option[Int] = 
    if low > high then none
    else 
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) |> option.unwrap_or(-1)
      if mid_val == target then some(mid)
      else if mid_val < target then loop(mid + 1, high)
      else loop(low, mid - 1)
  loop(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let mid = (low + high) / 2
  |       ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:3:29
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
    fn loop(low: Int, high: Int) -> Option[Int] = 
      if low > high then none
      else 
        {
          let mid = (low + high) / 2
          let mid_val = list.get(xs, mid) |> option.unwrap_or(-1)
          if mid_val == target then some(mid)
          else if mid_val < target then loop(mid + 1, high)
          else loop(low, mid - 1)
        }
    loop(low, high)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 5:5 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:5:5
  |
5 |     fn loop(low: Int, high: Int) -> Option[Int] =
  |     ^
error: 'loop' is not valid in Almide at line 12:41
  --> /tmp/dojo-binary-search-3.almd:12:41
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
12 |           else if mid_val < target then loop(mid + 1, high)
   |                                         ^
error: 'loop' is not valid in Almide at line 15:5
  --> /tmp/dojo-binary-search-3.almd:15:5
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
15 |     loop(low, high)
   |     ^
error[E001]: type mismatch in if branches: expected Option[?0] but got Unit
  --> /tmp/dojo-binary-search-3.almd:10:64
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[?0]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[?0]) -> Option[?0] = if cond then step(<update>) else x
   |
10 |           let mid_val = list.get(xs, mid) |> option.unwrap_or(-1)
   |                                                                ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:10:64
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
10 |           let mid_val = list.get(xs, mid) |> option.unwrap_or(-1)
   |                                                                ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
