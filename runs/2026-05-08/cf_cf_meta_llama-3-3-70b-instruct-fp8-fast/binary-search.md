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
  if len == 0 then none
  else
    let mut low = 0
    let mut high = len - 1
    while low <= high do
      let mid = (low + high) / 2
      let mid_val = option.unwrap_or(list.get(xs, mid), -1)
      if mid_val == target then some(mid)
      else if mid_val < target then low = mid + 1
      else high = mid - 1
    end
    none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let mut low = 0
  |     ^^^
error: 'let mut' is not valid in Almide at line 6:9
  --> /tmp/dojo-binary-search-0.almd:6:9
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
6 |     let mut high = len - 1
  |         ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-binary-search-0.almd:7:23
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
7 |     while low <= high do
  |                       ^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:8:18
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
  |
8 |       let mid = (low + high) / 2
  |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:8:24
  in variable high
  hint: Check the variable name
  |
8 |       let mid = (low + high) / 2
  |                        ^^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-binary-search-0.almd:13:5
  in variable end
  hint: Did you mean `mid`?
  try:
      // end  →  mid
      mid
   |
13 |     end
   |     ^^^
error[E001]: type mismatch in if branches: expected Option[Unknown] but got Unit
  --> /tmp/dojo-binary-search-0.almd:12:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Unknown]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Unknown]) -> Option[Unknown] = if cond then step(<update>) else x
   |
12 |       else high = mid - 1
   |                         ^

7 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else
    let low = 0
    let high = list.len(xs) - 1
    let rec loop(low: Int, high: Int) -> Option[Int] =
      if low > high then none
      else
        let mid = (low + high) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        if mid_val == target then some(mid)
        else if mid_val < target then loop(mid + 1, high)
        else loop(low, mid - 1)
    loop(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let low = 0
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
  if list.len(xs) == 0 then none
  else
    {
      let low = 0
      let high = list.len(xs) - 1
      let rec loop(low: Int, high: Int) -> Option[Int] =
        if low > high then none
        else
          let mid = (low + high) / 2
          let mid_val = option.unwrap_or(list.get(xs, mid), -1)
          if mid_val == target then some(mid)
          else if mid_val < target then loop(mid + 1, high)
          else loop(low, mid - 1)
      loop(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:7:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
7 |       let rec loop(low: Int, high: Int) -> Option[Int] =
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:10:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |           let mid = (low + high) / 2
   |           ^^^
error: 'loop' is not valid in Almide at line 13:41
  --> /tmp/dojo-binary-search-2.almd:13:41
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
13 |           else if mid_val < target then loop(mid + 1, high)
   |                                         ^
error: 'loop' is not valid in Almide at line 15:7
  --> /tmp/dojo-binary-search-2.almd:15:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
15 |       loop(low, high)
   |       ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:11:55
  in variable mid
  hint: Check the variable name
   |
11 |           let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                       ^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:11:62
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
11 |           let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                              ^

6 error(s) found
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
      loop(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 7:7 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:7:7
  |
7 |       fn loop(low: Int, high: Int) -> Option[Int] =
  |       ^
error: 'loop' is not valid in Almide at line 14:43
  --> /tmp/dojo-binary-search-3.almd:14:43
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
14 |             else if mid_val < target then loop(mid + 1, high)
   |                                           ^
error: 'loop' is not valid in Almide at line 17:7
  --> /tmp/dojo-binary-search-3.almd:17:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
17 |       loop(low, high)
   |       ^
error[E001]: type mismatch in if branches: expected Option[?1] but got Unit
  --> /tmp/dojo-binary-search-3.almd:12:64
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[?1]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[?1]) -> Option[?1] = if cond then step(<update>) else x
   |
12 |             let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                                ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:12:64
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
12 |             let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                                ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
