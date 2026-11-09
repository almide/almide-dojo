# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  let low = 0
  let high = len - 1
in
  while low <= high do
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid) ?? -1
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
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-binary-search-0.almd:6:21
  in while body
  here: while low <= high do
  hint: Almide uses `while cond { ... }` (curly braces). But `while` requires a `var` accumulator — pure/effect fns usually want recursion instead.
  try:
      // Almide `while` needs braces (not `do ... done`):
      var i = 0
      while cond(i) { i = i + 1 }
      
      // For pure fn, prefer recursion over `var` + while:
      fn loop(i: Int, acc: T) -> T =
      if !cond(i) then acc else loop(i + 1, next(acc, i))
  |
6 |   while low <= high do
  |                     ^^
error: Expected expression at line 15:3 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:15:3
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |   else
   |   ^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:12:19
  in low = ...
  here: low = mid + 1
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 3 |   let low = 0
   |   ------------------- 'low' declared here
...
12 |       low = mid + 1
   |                   ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:14:20
  in high = ...
  here: high = mid - 1
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 4 |   let high = len - 1
   |   -------------------- 'high' declared here
...
14 |       high = mid - 1
   |                    ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit — the `then` branch at line 10 fixed the type to Option[Int]
  --> /tmp/dojo-binary-search-0.almd:11:10
  in if branches
  here: else if mid_val < target then
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
11 |     else if mid_val < target then
   |          ^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:14:20
  in fn 'binary_search'
  here: high = mid - 1
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
14 |       high = mid - 1
   |                    ^

6 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
  parse error: `while ... do ... done` is Pascal/Ruby syntax
  parse error: Expected expression at line 15:3 (got Else 'else')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  let low = 0
  let high = len - 1
in
  fn loop(low: Int, high: Int) -> Option[Int] =
    if low > high then
      none
    else
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) ?? -1
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:10:7
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |       let mid = (low + high) / 2
   |       ^^^
error: 'let' is not an expression in Almide at line 10:7
  --> /tmp/dojo-binary-search-1.almd:10:7
  here: let mid = (low + high) / 2
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |       let mid = (low + high) / 2
   |       ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:4:20
  in fn 'binary_search'
  here: let high = len - 1
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
4 |   let high = len - 1
  |                    ^

3 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 10:7
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  {
    let len = list.len(xs)
    let low = 0
    let high = len - 1
  }
  {
    fn loop(low: Int, high: Int) -> Option[Int] =
      if low > high then
        none
      else
        {
          let mid = (low + high) / 2
          let mid_val = list.get(xs, mid) ?? -1
        }
        if mid_val == target then
          some(mid)
        else if mid_val < target then
          loop(mid + 1, high)
        else
          loop(low, mid - 1)
  }
  loop(low, high)
```

**Diagnostic:**

```
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:7:3
  here: {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |   {
  |   ^
error: this indented line is not part of `fn loop`: a body without braces is a single expression
  --> /tmp/dojo-binary-search-2.almd:16:9
  in fn body
  here: if mid_val == target then
  hint: `fn loop` ends after its first expression (line 15), so line 16 is read as a new top-level declaration. To run several statements, wrap the body in braces:
  try:
          fn loop(low: Int, high: Int) -> Option[Int] = {
            if low > high then
              none
            else
              {
                let mid = (low + high) / 2
                let mid_val = list.get(xs, mid) ?? -1
              }
              if mid_val == target then
                some(mid)
              else if mid_val < target then
                loop(mid + 1, high)
              else
                loop(low, mid - 1)
          }
   |
 8 |     fn loop(low: Int, high: Int) -> Option[Int] =
   |     ------------- declared here
...
16 |         if mid_val == target then
   |         ^^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-binary-search-2.almd:14:34
  in variable xs
  here: let mid_val = list.get(xs, mid) ?? -1
  hint: Check the variable name
   |
14 |           let mid_val = list.get(xs, mid) ?? -1
   |                                  ^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:5:22
  in fn 'binary_search'
  here: let high = len - 1
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
5 |     let high = len - 1
  |                      ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit — Option[Int] is the declared return type, and the branch at line 10 produces it
  --> /tmp/dojo-binary-search-2.almd:12:9
  in if branches
  here: {
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
12 |         {
   |         ^

5 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 7:3 (got LBrace '{')
  parse error: this indented line is not part of `fn loop`: a body without braces is a single expression
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  let low = 0
  let high = len - 1
  fn loop(low: Int, high: Int) -> Option[Int] = {
    if low > high then
      none
    else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) ?? -1
      if mid_val == target then
        some(mid)
      else if mid_val < target then
        loop(mid + 1, high)
      else
        loop(low, mid - 1)
    }
  }
  loop(low, high)
```

**Diagnostic:**

```
error: 'loop' cannot appear at the top level at line 19:3
  --> /tmp/dojo-binary-search-3.almd:19:3
  here: loop(low, high)
  hint: Almide has no top-level loops. Define a function with 'fn' or 'effect fn'.
   |
19 |   loop(low, high)
   |   ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-binary-search-3.almd:10:30
  in variable xs
  here: let mid_val = list.get(xs, mid) ?? -1
  hint: Check the variable name
   |
10 |       let mid_val = list.get(xs, mid) ?? -1
   |                              ^^
error[E003]: undefined variable 'target'
  --> /tmp/dojo-binary-search-3.almd:11:21
  in variable target
  here: if mid_val == target then
  hint: Check the variable name
   |
11 |       if mid_val == target then
   |                     ^^^^^^
error[E003]: undefined variable 'target'
  --> /tmp/dojo-binary-search-3.almd:13:25
  in variable target
  here: else if mid_val < target then
  hint: Check the variable name
   |
13 |       else if mid_val < target then
   |                         ^^^^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:4:20
  in fn 'binary_search'
  here: let high = len - 1
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
4 |   let high = len - 1
  |                    ^

5 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
  parse error: 'loop' cannot appear at the top level at line 19:3
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
