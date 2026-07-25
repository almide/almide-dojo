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
  ; none
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

4 error(s) found
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
  if low > high then none
  else
    let mid = (low + high) / 2
    let mid_val = option.unwrap_or(list.get(xs, mid), -1)
    if mid_val == target then some(mid)
    else if mid_val < target then binary_search(list.drop(xs, low + 1), target) |> option.map((x) => x + mid + 1)
    else binary_search(list.slice(xs, low, mid), target)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let mid = (low + high) / 2
  |     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:8:49
  in variable mid
  hint: Check the variable name
  |
8 |     let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                                                 ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:9:36
  in variable mid
  hint: Check the variable name
  |
9 |     if mid_val == target then some(mid)
  |                                    ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:10:106
  in variable mid
  hint: Check the variable name
   |
10 |     else if mid_val < target then binary_search(list.drop(xs, low + 1), target) |> option.map((x) => x + mid + 1)
   |                                                                                                          ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:11:44
  in variable mid
  hint: Check the variable name
   |
11 |     else binary_search(list.slice(xs, low, mid), target)
   |                                            ^^^

5 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else
    let low = 0
    let high = list.len(xs) - 1
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else
        let mid = (low + high) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1)
    in search(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let low = 0
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else
    {
      let low = 0
      let high = list.len(xs) - 1
      let rec search(low: Int, high: Int) = 
        if low > high then none
        else
          let mid = (low + high) / 2
          let mid_val = option.unwrap_or(list.get(xs, mid), -1)
          if mid_val == target then some(mid)
          else if mid_val < target then search(mid + 1, high)
          else search(low, mid - 1)
      in search(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-3.almd:7:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
7 |       let rec search(low: Int, high: Int) =
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:10:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |           let mid = (low + high) / 2
   |           ^^^
error: Expected expression at line 15:7 (got In 'in')
  --> /tmp/dojo-binary-search-3.almd:15:7
   |
15 |       in search(low, high)
   |       ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:11:55
  in variable mid
  hint: Check the variable name
   |
11 |           let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                       ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:12:42
  in variable mid
  hint: Check the variable name
   |
12 |           if mid_val == target then some(mid)
   |                                          ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:13:48
  in variable mid
  hint: Check the variable name
   |
13 |           else if mid_val < target then search(mid + 1, high)
   |                                                ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:13:57
  in call to search()
  hint: Check the function name
   |
13 |           else if mid_val < target then search(mid + 1, high)
   |                                                         ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:14:28
  in variable mid
  hint: Check the variable name
   |
14 |           else search(low, mid - 1)
   |                            ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:14:34
  in call to search()
  hint: Check the function name
   |
14 |           else search(low, mid - 1)
   |                                  ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:14:34
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
14 |           else search(low, mid - 1)
   |                                  ^

10 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
