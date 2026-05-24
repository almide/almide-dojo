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
  in 
  if len == 0 then 
    none
  else 
    let 
      var low = 0
      var high = len - 1
    in 
    while low <= high do 
      let mid = (low + high) / 2
      in 
      match list.get(xs, mid) with 
        some(val) => 
          if val == target then 
            some(mid)
          else if val < target then 
            low = mid + 1
          else 
            high = mid - 1
      | none => 
          none
    ; 
    none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let
  |     ^^^
error: Expected expression at line 10:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:10:5
   |
10 |     in
   |     ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-binary-search-0.almd:11:23
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
11 |     while low <= high do
   |                       ^^
error: Expected LBrace at line 14:31 (got Ident 'with')
  --> /tmp/dojo-binary-search-0.almd:14:31
   |
14 |       match list.get(xs, mid) with
   |                               ^
error: Expected expression at line 22:7 (got Pipe '|')
  --> /tmp/dojo-binary-search-0.almd:22:7
   |
22 |       | none =>
   |       ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-0.almd:16:14
  in variable val
  hint: Check the variable name
   |
16 |           if val == target then
   |              ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-0.almd:18:19
  in variable val
  hint: Check the variable name
   |
18 |           else if val < target then
   |                   ^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:21:26
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
21 |             high = mid - 1
   |                          ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:21:26
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
21 |             high = mid - 1
   |                          ^

9 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then 
    none
  else 
    let 
      low = 0
      high = list.len(xs) - 1
    in 
    let rec loop(low: Int, high: Int) -> Option[Int] = 
      if low > high then 
        none
      else 
        let mid = (low + high) / 2
        in 
        match list.get(xs, mid) with 
          some(val) => 
            if val == target then 
              some(mid)
            else if val < target then 
              loop(mid + 1, high)
            else 
              loop(low, mid - 1)
        | none => 
            none
    in 
    loop(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let
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
  if list.len(xs) == 0 then 
    none
  else 
    {
      let low = 0
      let high = list.len(xs) - 1
      let rec loop(low: Int, high: Int) -> Option[Int] = 
        if low > high then 
          none
        else 
          {
            let mid = (low + high) / 2
            match list.get(xs, mid) with 
              some(val) => 
                if val == target then 
                  some(mid)
                else if val < target then 
                  loop(mid + 1, high)
                else 
                  loop(low, mid - 1)
            | none => 
                none
          }
      loop(low, high)
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
error: Expected LBrace at line 14:37 (got Ident 'with')
  --> /tmp/dojo-binary-search-2.almd:14:37
   |
14 |             match list.get(xs, mid) with
   |                                     ^
error: 'loop' is not valid in Almide at line 19:19
  --> /tmp/dojo-binary-search-2.almd:19:19
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
19 |                   loop(mid + 1, high)
   |                   ^
error: 'loop' is not valid in Almide at line 21:19
  --> /tmp/dojo-binary-search-2.almd:21:19
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
21 |                   loop(low, mid - 1)
   |                   ^
error: 'loop' is not valid in Almide at line 25:7
  --> /tmp/dojo-binary-search-2.almd:25:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
25 |       loop(low, high)
   |       ^
error[E001]: type mismatch in if branches: expected Option[?1] but got Unit
  --> /tmp/dojo-binary-search-2.almd:13:38
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[?1]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[?1]) -> Option[?1] = if cond then step(<update>) else x
   |
13 |             let mid = (low + high) / 2
   |                                      ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:13:38
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
13 |             let mid = (low + high) / 2
   |                                      ^

7 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then 
    none
  else 
    {
      let low = 0
      let high = list.len(xs) - 1
      fn loop(low: Int, high: Int) -> Option[Int] = 
        if low > high then 
          none
        else 
          {
            let mid = (low + high) / 2
            let val_opt = list.get(xs, mid)
            match val_opt with 
              some(val) => 
                if val == target then 
                  some(mid)
                else if val < target then 
                  loop(mid + 1, high)
                else 
                  loop(low, mid - 1)
            | none => 
                none
          }
      loop(low, high)
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
error: Expected LBrace at line 15:27 (got Ident 'with')
  --> /tmp/dojo-binary-search-3.almd:15:27
   |
15 |             match val_opt with
   |                           ^
error: 'loop' is not valid in Almide at line 20:19
  --> /tmp/dojo-binary-search-3.almd:20:19
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
20 |                   loop(mid + 1, high)
   |                   ^
error: 'loop' is not valid in Almide at line 22:19
  --> /tmp/dojo-binary-search-3.almd:22:19
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
22 |                   loop(low, mid - 1)
   |                   ^
error: 'loop' is not valid in Almide at line 26:7
  --> /tmp/dojo-binary-search-3.almd:26:7
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
26 |       loop(low, high)
   |       ^
error[E001]: type mismatch in if branches: expected Option[?1] but got Unit
  --> /tmp/dojo-binary-search-3.almd:14:40
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[?1]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[?1]) -> Option[?1] = if cond then step(<update>) else x
   |
14 |             let val_opt = list.get(xs, mid)
   |                                        ^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:14:40
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
14 |             let val_opt = list.get(xs, mid)
   |                                        ^^^

7 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
