# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  let rec loop(low: Int, high: Int) -> Option[Int] = 
    if low > high then none
    else 
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
      if mid_val == target then some(mid)
      else if mid_val < target then loop(mid + 1, high)
      else loop(low, mid - 1)
  in loop(0, len - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-0.almd:3:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
3 |   let rec loop(low: Int, high: Int) -> Option[Int] =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:6:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let mid = (low + high) / 2
  |       ^^^
error: 'loop' is not valid in Almide at line 9:37
  --> /tmp/dojo-binary-search-0.almd:9:37
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
9 |       else if mid_val < target then loop(mid + 1, high)
  |                                     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:7:34
  in variable mid
  hint: Check the variable name
  |
7 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                  ^^^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 3
  --> /tmp/dojo-binary-search-0.almd:7:66
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 3
      option.unwrap_or(<o: Option[A]>, <default: A>)
  |
7 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                                                  ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Int but got Option[?0]
  --> /tmp/dojo-binary-search-0.almd:7:66
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                                                  ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:7:66
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
7 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                                                  ^

7 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.is_empty(xs) then none
  else 
    let len = list.len(xs)
    let low = 0
    let high = len - 1
    let rec loop(low: Int, high: Int) -> Option[Int] = 
      if low > high then none
      else 
        let mid = (low + high) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        if mid_val == target then some(mid)
        else if mid_val < target then loop(mid + 1, high)
        else loop(low, mid - 1)
    in loop(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let len = list.len(xs)
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.is_empty(xs) then none
  else 
    {
      let len = list.len(xs)
      let low = 0
      let high = len - 1
      let rec loop(low: Int, high: Int) -> Option[Int] = 
        if low > high then none
        else 
          let mid = (low + high) / 2
          let mid_val = option.unwrap_or(list.get(xs, mid), -1)
          if mid_val == target then some(mid)
          else if mid_val < target then loop(mid + 1, high)
          else loop(low, mid - 1)
      in loop(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:8:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
8 |       let rec loop(low: Int, high: Int) -> Option[Int] =
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:11:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |           let mid = (low + high) / 2
   |           ^^^
error: 'loop' is not valid in Almide at line 14:41
  --> /tmp/dojo-binary-search-2.almd:14:41
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
14 |           else if mid_val < target then loop(mid + 1, high)
   |                                         ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:12:55
  in variable mid
  hint: Check the variable name
   |
12 |           let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                       ^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:12:62
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
12 |           let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                              ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.is_empty(xs) then none
  else 
    {
      let len = list.len(xs)
      let low = 0
      let high = len - 1
      fn loop(low: Int, high: Int) -> Option[Int] = 
        if low > high then none
        else 
          {
            let mid = (low + high) / 2
            let mid_val = option.unwrap_or(list.get(xs, mid), -1)
            if mid_val == target then some(mid)
            else if mid_val < target then loop(mid + 1, high)
            else loop(low, mid - 1)
          }
      in loop(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 8:7 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:8:7
  |
8 |       fn loop(low: Int, high: Int) -> Option[Int] =
  |       ^
error: 'loop' is not valid in Almide at line 15:43
  --> /tmp/dojo-binary-search-3.almd:15:43
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
15 |             else if mid_val < target then loop(mid + 1, high)
   |                                           ^
error: Expected expression at line 18:7 (got In 'in')
  --> /tmp/dojo-binary-search-3.almd:18:7
   |
18 |       in loop(low, high)
   |       ^
error[E001]: type mismatch in if branches: expected Option[?1] but got Unit
  --> /tmp/dojo-binary-search-3.almd:13:64
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[?1]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[?1]) -> Option[?1] = if cond then step(<update>) else x
   |
13 |             let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                                ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:13:64
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
13 |             let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                                ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
