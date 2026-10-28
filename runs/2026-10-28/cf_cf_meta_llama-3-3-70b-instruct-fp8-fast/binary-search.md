# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

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
error: Expected expression at line 14:3 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:14:3
  here: else
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |   else
   |   ^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:11:19
  in low = ...
  here: low = mid + 1
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
  here: high = mid - 1
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
  here: high = mid - 1
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
  here: high = mid - 1
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
FAILED: /tmp/dojo-binary-search-0.almd
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0
  let high = list.len(xs) - 1
in
  if low > high then none
  else
    let mid = (low + high) / 2
    let mid_val = option.unwrap_or(list.get(xs, mid), -1)
    if mid_val == target then some(mid)
    else if mid_val < target then binary_search(list.drop(xs, low + 1), target) |> option.map((x) => x + low + 1)
    else binary_search(list.slice(xs, low, mid), target)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:7:5
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let mid = (low + high) / 2
  |     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:8:49
  in variable mid
  here: let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  hint: Check the variable name
  |
8 |     let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                                                 ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:9:36
  in variable mid
  here: if mid_val == target then some(mid)
  hint: Check the variable name
  |
9 |     if mid_val == target then some(mid)
  |                                    ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:11:44
  in variable mid
  here: else binary_search(list.slice(xs, low, mid), target)
  hint: Check the variable name
   |
11 |     else binary_search(list.slice(xs, low, mid), target)
   |                                            ^^^

4 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  {
    let low = 0
    let high = list.len(xs) - 1
    if low > high then none
    else
      {
        let mid = (low + high) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        if mid_val == target then some(mid)
        else if mid_val < target then 
          {
            let new_low = mid + 1
            binary_search(list.drop(xs, new_low), target) |> option.map((x) => x + new_low)
          }
        else binary_search(list.slice(xs, low, mid), target)
      }
  }
```
