# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
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
  if len == 0 then 
    none
  else 
    let rec search(low: Int, high: Int) -> Option[Int] = 
      if low > high then 
        none
      else 
        let mid = (low + high) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        if mid_val == target then 
          some(mid)
        else if mid_val < target then 
          search(mid + 1, high)
        else 
          search(low, mid - 1)
    in 
      search(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:9:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |     let rec search(low: Int, high: Int) -> Option[Int] =
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:13:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let mid = (low + high) / 2
   |         ^^^
error: Expected expression at line 21:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:21:5
   |
21 |     in
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:14:53
  in variable mid
  hint: Check the variable name
   |
14 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:16:16
  in variable mid
  hint: Check the variable name
   |
16 |           some(mid)
   |                ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:18:18
  in variable mid
  hint: Check the variable name
   |
18 |           search(mid + 1, high)
   |                  ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:18:27
  in call to search()
  hint: Check the function name
   |
18 |           search(mid + 1, high)
   |                           ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:20:23
  in variable mid
  hint: Check the variable name
   |
20 |           search(low, mid - 1)
   |                       ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:20:29
  in call to search()
  hint: Check the function name
   |
20 |           search(low, mid - 1)
   |                             ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:22:19
  in call to search()
  hint: Check the function name
   |
22 |       search(low, high)
   |                   ^^^^

10 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  {
    let len = list.len(xs);
    let low = 0;
    let high = len - 1;
    if len == 0 then 
      none
    else 
      {
        fn search(low: Int, high: Int) -> Option[Int] = 
          if low > high then 
            none
          else 
            {
              let mid = (low + high) / 2;
              let mid_val = option.unwrap_or(list.get(xs, mid), -1);
              if mid_val == target then 
                some(mid)
              else if mid_val < target then 
                search(mid + 1, high)
              else 
                search(low, mid - 1)
            };
        search(low, high)
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 10:9 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:10:9
   |
10 |         fn search(low: Int, high: Int) -> Option[Int] =
   |         ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:20:33
  in call to search()
  hint: Check the function name
   |
20 |                 search(mid + 1, high)
   |                                 ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:22:35
  in call to search()
  hint: Check the function name
   |
22 |                 search(low, mid - 1)
   |                                   ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:24:21
  in call to search()
  hint: Check the function name
   |
24 |         search(low, high)
   |                     ^^^^

4 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  {
    let len = list.len(xs);
    if len == 0 then 
      none
    else 
      {
        let low = 0;
        let high = len - 1;
        while low <= high do
          {
            let mid = (low + high) / 2;
            let mid_val = option.unwrap_or(list.get(xs, mid), -1);
            if mid_val == target then 
              some(mid)
            else if mid_val < target then 
              low = mid + 1
            else 
              high = mid - 1
          };
        none
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-binary-search-2.almd:10:27
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
10 |         while low <= high do
   |                           ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 23:3 (got RBrace '}')
  --> /tmp/dojo-binary-search-2.almd:23:3
   |
23 |   }
   |   ^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-2.almd:17:27
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 8 |         let low = 0;
   |         ------------------- 'low' declared here
...
17 |               low = mid + 1
   |                           ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-2.almd:19:28
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 9 |         let high = len - 1;
   |         -------------------- 'high' declared here
...
19 |               high = mid - 1
   |                            ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:19:28
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
19 |               high = mid - 1
   |                            ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs);
  if len == 0 then 
    none
  else 
    let low = 0;
    let high = len - 1;
    let rec loop(low: Int, high: Int) -> Option[Int] = 
      if low > high then 
        none
      else 
        let mid = (low + high) / 2;
        let mid_val = option.unwrap_or(list.get(xs, mid), -1);
        if mid_val == target then 
          some(mid)
        else if mid_val < target then 
          loop(mid + 1, high)
        else 
          loop(low, mid - 1)
    in loop(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let low = 0;
  |     ^^^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-3.almd:8:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
8 |     let rec loop(low: Int, high: Int) -> Option[Int] =
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:12:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |         let mid = (low + high) / 2;
   |         ^^^
error: 'loop' is not valid in Almide at line 17:11
  --> /tmp/dojo-binary-search-3.almd:17:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
17 |           loop(mid + 1, high)
   |           ^
error: 'loop' is not valid in Almide at line 19:11
  --> /tmp/dojo-binary-search-3.almd:19:11
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
19 |           loop(low, mid - 1)
   |           ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:13:53
  in variable mid
  hint: Check the variable name
   |
13 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1);
   |                                                     ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:13:60
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
13 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1);
   |                                                            ^

7 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
