# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
  if low > high then none
  else
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid) ?? -1
    if mid_val == target then some(mid)
    else if mid_val < target then binary_search(list.drop(xs, mid + 1), target) |> (x) => x.map((y) => y + mid + 1)
    else binary_search(list.slice(xs, low, mid), target)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:8:5
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let mid = (low + high) / 2
  |     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:9:32
  in variable mid
  here: let mid_val = list.get(xs, mid) ?? -1
  hint: Check the variable name
  |
9 |     let mid_val = list.get(xs, mid) ?? -1
  |                                ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:10:36
  in variable mid
  here: if mid_val == target then some(mid)
  hint: Check the variable name
   |
10 |     if mid_val == target then some(mid)
   |                                    ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:11:63
  in variable mid
  here: else if mid_val < target then binary_search(list.drop(xs, mid + 1), target) |> (x) => x.map((y) => y + mid + 1)
  hint: Check the variable name
   |
11 |     else if mid_val < target then binary_search(list.drop(xs, mid + 1), target) |> (x) => x.map((y) => y + mid + 1)
   |                                                               ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:11:108
  in variable mid
  here: else if mid_val < target then binary_search(list.drop(xs, mid + 1), target) |> (x) => x.map((y) => y + mid + 1)
  hint: Check the variable name
   |
11 |     else if mid_val < target then binary_search(list.drop(xs, mid + 1), target) |> (x) => x.map((y) => y + mid + 1)
   |                                                                                                            ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:12:44
  in variable mid
  here: else binary_search(list.slice(xs, low, mid), target)
  hint: Check the variable name
   |
12 |     else binary_search(list.slice(xs, low, mid), target)
   |                                            ^^^
error[E001]: type mismatch in pipe call: expected fn(fn(fn(?5) -> ?5) -> ?7) -> ?7 but got fn(Option[Int]) -> Option[Unknown]
  --> /tmp/dojo-binary-search-1.almd:11:91
  in pipe call
  here: else if mid_val < target then binary_search(list.drop(xs, mid + 1), target) |> (x) => x.map((y) => y + mid + 1)
  hint: Fix the expression type or change the expected type
   |
11 |     else if mid_val < target then binary_search(list.drop(xs, mid + 1), target) |> (x) => x.map((y) => y + mid + 1)
   |                                                                                           ^

7 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else
    let len = list.len(xs)
    let low = 0
    let high = len - 1
    let rec search(low: Int, high: Int) -> Option[Int] = 
      if low > high then none
      else
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid) ?? -1
        if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1)
    in search(low, high)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:4:5
  in let-in
  here: let len = list.len(xs)
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let len = list.len(xs)
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-binary-search-2.almd:4:5
  here: let len = list.len(xs)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let len = list.len(xs)
  |     ^

2 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 4:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else
    {
      let len = list.len(xs)
      let low = 0
      let high = len - 1
      let rec search(low: Int, high: Int) -> Option[Int] = 
        if low > high then none
        else
          let mid = (low + high) / 2
          let mid_val = list.get(xs, mid) ?? -1
          if mid_val == target then some(mid)
          else if mid_val < target then search(mid + 1, high)
          else search(low, mid - 1)
      in search(low, high)
    }
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-3.almd:8:11
  in let rec
  here: let rec search(low: Int, high: Int) -> Option[Int] =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
8 |       let rec search(low: Int, high: Int) -> Option[Int] =
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:11:11
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |           let mid = (low + high) / 2
   |           ^^^
error: Expected expression at line 16:7 (got In 'in')
  --> /tmp/dojo-binary-search-3.almd:16:7
  here: in search(low, high)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |       in search(low, high)
   |       ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:12:38
  in variable mid
  here: let mid_val = list.get(xs, mid) ?? -1
  hint: Check the variable name
   |
12 |           let mid_val = list.get(xs, mid) ?? -1
   |                                      ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:13:42
  in variable mid
  here: if mid_val == target then some(mid)
  hint: Check the variable name
   |
13 |           if mid_val == target then some(mid)
   |                                          ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:14:48
  in variable mid
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the variable name
   |
14 |           else if mid_val < target then search(mid + 1, high)
   |                                                ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:14:41
  in call to search()
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the function name
   |
14 |           else if mid_val < target then search(mid + 1, high)
   |                                         ^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:15:28
  in variable mid
  here: else search(low, mid - 1)
  hint: Check the variable name
   |
15 |           else search(low, mid - 1)
   |                            ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:15:16
  in call to search()
  here: else search(low, mid - 1)
  hint: Check the function name
   |
15 |           else search(low, mid - 1)
   |                ^^^^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit — Option[Int] is the declared return type, and the branch at line 2 produces it
  --> /tmp/dojo-binary-search-3.almd:4:5
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
4 |     {
  |     ^
error[E025]: cannot infer a concrete type for this expression (type Option[Unknown])
  --> /tmp/dojo-binary-search-3.almd:13:11
  in this expression with an unconstrained type
  here: if mid_val == target then some(mid)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
13 |           if mid_val == target then some(mid)
   |           ^^

11 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
  parse error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 16:7 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
