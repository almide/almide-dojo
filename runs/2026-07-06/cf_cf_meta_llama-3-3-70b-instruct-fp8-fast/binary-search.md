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
  };
  none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error[E004]: option.unwrap_or() expects 2 argument(s) but got 3
  --> /tmp/dojo-binary-search-0.almd:7:64
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 3
      option.unwrap_or(<o: Option[A]>, <default: A>)
  |
7 |     let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                                                ^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:9:47
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
  |
2 |   let low = 0
  |   ------------------- 'low' declared here
...
9 |     else if mid_val < target then low = mid + 1
  |                                               ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:10:23
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 3 |   let high = list.len(xs) - 1
   |   -------------------- 'high' declared here
...
10 |     else high = mid - 1
   |                       ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Int but got Option[?0]
  --> /tmp/dojo-binary-search-0.almd:7:64
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |     let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                                                ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:10:23
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
10 |     else high = mid - 1
   |                       ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  var low = 0
  var high = list.len(xs) - 1
  in
  while low <= high {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid) |> option.unwrap_or(-1)
    if mid_val == target then some(mid)
    else if mid_val < target then low = mid + 1
    else high = mid - 1
  };
  none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 4:3 (got In 'in')
  --> /tmp/dojo-binary-search-1.almd:4:3
  |
4 |   in
  |   ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:10:23
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
10 |     else high = mid - 1
   |                       ^

2 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let rec step(low: Int, high: Int) = 
    if low > high then none
    else 
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) |> option.unwrap_or(-1)
      if mid_val == target then some(mid)
      else if mid_val < target then step(mid + 1, high)
      else step(low, mid - 1)
  in step(0, list.len(xs) - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:2:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
2 |   let rec step(low: Int, high: Int) =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let mid = (low + high) / 2
  |       ^^^
error: Expected expression at line 10:3 (got In 'in')
  --> /tmp/dojo-binary-search-2.almd:10:3
   |
10 |   in step(0, list.len(xs) - 1)
   |   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:6:34
  in variable mid
  hint: Check the variable name
  |
6 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(-1)
  |                                  ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:7:38
  in variable mid
  hint: Check the variable name
  |
7 |       if mid_val == target then some(mid)
  |                                      ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:8:42
  in variable mid
  hint: Check the variable name
  |
8 |       else if mid_val < target then step(mid + 1, high)
  |                                          ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:8:51
  in variable high
  hint: Check the variable name
  |
8 |       else if mid_val < target then step(mid + 1, high)
  |                                                   ^^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:8:51
  in call to step()
  hint: Check the function name
  |
8 |       else if mid_val < target then step(mid + 1, high)
  |                                                   ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:9:17
  in variable low
  hint: Check the variable name
  |
9 |       else step(low, mid - 1)
  |                 ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:9:22
  in variable mid
  hint: Check the variable name
  |
9 |       else step(low, mid - 1)
  |                      ^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:9:28
  in call to step()
  hint: Check the function name
  |
9 |       else step(low, mid - 1)
  |                            ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:9:28
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
9 |       else step(low, mid - 1)
  |                            ^

12 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  fn step(low: Int, high: Int) -> Option[Int] = 
    if low > high then none
    else 
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) |> option.unwrap_or(-1)
      if mid_val == target then some(mid)
      else if mid_val < target then step(mid + 1, high)
      else step(low, mid - 1)
  in step(0, list.len(xs) - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:2:3
  |
2 |   fn step(low: Int, high: Int) -> Option[Int] =
  |   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let mid = (low + high) / 2
  |       ^^^

2 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
