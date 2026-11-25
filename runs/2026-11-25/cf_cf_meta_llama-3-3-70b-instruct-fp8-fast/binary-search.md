# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  let mut low = 0
  let mut high = len - 1
  while low <= high do
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid) ?? -1
    if mid_val == target then some(mid)
    else if mid_val < target then low = mid + 1
    else high = mid - 1
  else none
```

**Diagnostic:**

```
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-binary-search-0.almd:3:7
  in let mut
  here: let mut low = 0
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
  |
3 |   let mut low = 0
  |       ^^^
error: 'let mut' is not valid in Almide
  --> /tmp/dojo-binary-search-0.almd:4:7
  in let mut
  here: let mut high = len - 1
  hint: Use 'var' for mutable variables. Example: var x = 0
  try:
      var x = 0
  |
4 |   let mut high = len - 1
  |       ^^^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-binary-search-0.almd:5:21
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
5 |   while low <= high do
  |                     ^^
error: Expected expression at line 11:3 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:11:3
  here: else none
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
11 |   else none
   |   ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit — the `then` branch at line 8 fixed the type to Option[Int]
  --> /tmp/dojo-binary-search-0.almd:9:10
  in if branches
  here: else if mid_val < target then low = mid + 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
9 |     else if mid_val < target then low = mid + 1
  |          ^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:10:23
  in fn 'binary_search'
  here: else high = mid - 1
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
10 |     else high = mid - 1
   |                       ^

6 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
  parse error: 'let mut' is not valid in Almide
  parse error: 'let mut' is not valid in Almide
  parse error: `while ... do ... done` is Pascal/Ruby syntax
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  var low = 0
  var high = len - 1
  while low <= high {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid) ?? -1
    if mid_val == target then some(mid)
    else if mid_val < target then low = mid + 1
    else high = mid - 1
  }
  none
```

**Diagnostic:**

```
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit — the `then` branch at line 8 fixed the type to Option[Int]
  --> /tmp/dojo-binary-search-1.almd:9:10
  in if branches
  here: else if mid_val < target then low = mid + 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
9 |     else if mid_val < target then low = mid + 1
  |          ^^

1 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  var low = 0
  var high = len - 1
  while low <= high {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid) ?? -1
    if mid_val == target then some(mid)
    else if mid_val < target then low = mid + 1; none
    else high = mid - 1; none
  }
  none
```

**Diagnostic:**

```
error: Expected expression at line 10:5 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:10:5
  here: else high = mid - 1; none
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
10 |     else high = mid - 1; none
   |     ^
error: this indented line is not part of `fn binary_search`: a body without braces is a single expression
  --> /tmp/dojo-binary-search-2.almd:11:3
  in fn body
  here: }
  hint: `fn binary_search` ends after its first expression (line 10), so line 11 is read as a new top-level declaration. To run several statements, wrap the body in braces:
  try:
      fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
        let len = list.len(xs)
        var low = 0
        var high = len - 1
        while low <= high {
          let mid = (low + high) / 2
          let mid_val = list.get(xs, mid) ?? -1
          if mid_val == target then some(mid)
          else if mid_val < target then low = mid + 1; none
          else high = mid - 1; none
        }
        none
      }
   |
 1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
   | ------------- declared here
...
11 |   }
   |   ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:4:20
  in fn 'binary_search'
  here: var high = len - 1
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
4 |   var high = len - 1
  |                    ^

3 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
  parse error: Expected expression at line 10:5 (got Else 'else')
  parse error: this indented line is not part of `fn binary_search`: a body without braces is a single expression
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  var low = 0
  var high = len - 1
  while low <= high {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid) ?? -1
    if mid_val == target then some(mid)
    else if mid_val < target then low = mid + 1
    else high = mid - 1
  }
  none
}
```

**Diagnostic:**

```
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit — the `then` branch at line 8 fixed the type to Option[Int]
  --> /tmp/dojo-binary-search-3.almd:9:10
  in if branches
  here: else if mid_val < target then low = mid + 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
9 |     else if mid_val < target then low = mid + 1
  |          ^^

1 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
