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
  let rec loop(low: Int, high: Int) -> Option[Int] =
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
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-1.almd:5:7
  in let rec
  here: let rec loop(low: Int, high: Int) -> Option[Int] =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
5 |   let rec loop(low: Int, high: Int) -> Option[Int] =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:9:7
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |       let mid = (low + high) / 2
  |       ^^^
error: Expected expression at line 17:3 (got In 'in')
  --> /tmp/dojo-binary-search-1.almd:17:3
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |   in
   |   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:10:51
  in variable mid
  here: let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  hint: Check the variable name
   |
10 |       let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                   ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:12:14
  in variable mid
  here: some(mid)
  hint: Check the variable name
   |
12 |         some(mid)
   |              ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:14:14
  in variable mid
  here: loop(mid + 1, high)
  hint: Check the variable name
   |
14 |         loop(mid + 1, high)
   |              ^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-binary-search-1.almd:14:9
  in call to loop()
  here: loop(mid + 1, high)
  hint: Did you mean `low`?
  try:
      low
   |
14 |         loop(mid + 1, high)
   |         ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:16:19
  in variable mid
  here: loop(low, mid - 1)
  hint: Check the variable name
   |
16 |         loop(low, mid - 1)
   |                   ^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-binary-search-1.almd:16:9
  in call to loop()
  here: loop(low, mid - 1)
  hint: Did you mean `low`?
  try:
      low
   |
16 |         loop(low, mid - 1)
   |         ^^^^
error[E002]: undefined function 'loop'
  --> /tmp/dojo-binary-search-1.almd:18:3
  in call to loop()
  here: loop(low, high)
  hint: Did you mean `low`?
  try:
      low
   |
18 |   loop(low, high)
   |   ^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[Unknown])
  --> /tmp/dojo-binary-search-1.almd:11:7
  in this expression with an unconstrained type
  here: if mid_val == target then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
11 |       if mid_val == target then
   |       ^^

11 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
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
  in
  loop(low, high)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:8:7
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |       let mid = (low + high) / 2
  |       ^^^
error: 'let' is not an expression in Almide at line 8:7
  --> /tmp/dojo-binary-search-2.almd:8:7
  here: let mid = (low + high) / 2
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
8 |       let mid = (low + high) / 2
  |       ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:3:29
  in fn 'binary_search'
  here: let high = list.len(xs) - 1
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

3 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  {
    let low = 0
    let high = list.len(xs) - 1
    fn loop(low: Int, high: Int) -> Option[Int] =
      if low > high then
        none
      else
        {
          let mid = (low + high) / 2
          let mid_val = option.unwrap_or(list.get(xs, mid), -1)
          if mid_val == target then
            some(mid)
          else if mid_val < target then
            loop(mid + 1, high)
          else
            loop(low, mid - 1)
        }
    in
    loop(low, high)
  }
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-3.almd:5:5
  in nested fn
  here: fn loop(low: Int, high: Int) -> Option[Int] =
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
5 |     fn loop(low: Int, high: Int) -> Option[Int] =
  |     ^^
error: Expected expression at line 19:5 (got In 'in')
  --> /tmp/dojo-binary-search-3.almd:19:5
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |     in
   |     ^

2 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
