# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E009`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.is_empty(xs) then 
        none
    else 
        let len = list.len(xs)
        let low = 0
        let high = len - 1
        in 
            loop(low, high)

        fn loop(low: Int, high: Int) -> Option[Int] = 
            if low > high then 
                none
            else 
                let mid = (low + high) / 2
                let mid_val = option.unwrap_or(list.get(xs, mid), -1)
                in 
                    if mid_val == target then 
                        some(mid)
                    else if mid_val < target then 
                        loop(mid + 1, high)
                    else 
                        loop(low, mid - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let len = list.len(xs)
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:15:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
15 |                 let mid = (low + high) / 2
   |                 ^^^

2 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.is_empty(xs) then 
        none
    else 
        {
            let len = list.len(xs)
            let low = 0
            let high = len - 1
            loop(low, high)
        }

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
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'loop' is not valid in Almide at line 9:13
  --> /tmp/dojo-binary-search-1.almd:9:13
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
  |
9 |             loop(low, high)
  |             ^
error: 'loop' is not valid in Almide at line 22:21
  --> /tmp/dojo-binary-search-1.almd:22:21
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
22 |                     loop(mid + 1, high)
   |                     ^
error: 'loop' is not valid in Almide at line 24:21
  --> /tmp/dojo-binary-search-1.almd:24:21
  hint: Use 'while true { ... }' or 'do { guard COND else ok(()) ... }' for loops.
   |
24 |                     loop(low, mid - 1)
   |                     ^
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-binary-search-1.almd:18:57
  in variable xs
  hint: Check the variable name
   |
18 |                 let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                         ^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:8:30
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
8 |             let high = len - 1
  |                              ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:18:68
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
18 |                 let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                                    ^

6 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.is_empty(xs) then 
        none
    else 
        let len = list.len(xs)
        let high = len - 1
        let low = 0
        let result = 
            while low <= high {
                let mid = (low + high) / 2
                let mid_val = option.unwrap_or(list.get(xs, mid), -1)
                if mid_val == target then 
                    some(mid)
                else if mid_val < target then 
                    low = mid + 1
                else 
                    high = mid - 1
            }
        if low > high then 
            none
        else 
            let mid_val = option.unwrap_or(list.get(xs, low), -1)
            if mid_val == target then 
                some(low)
            else 
                none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let len = list.len(xs)
  |         ^^^

1 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.is_empty(xs) then 
        none
    else 
        {
            let len = list.len(xs)
            let high = len - 1
            let low = 0
            let result = 
                while low <= high {
                    let mid = (low + high) / 2
                    let mid_val = option.unwrap_or(list.get(xs, mid), -1)
                    if mid_val == target then 
                        some(mid)
                    else if mid_val < target then 
                        low = mid + 1
                    else 
                        high = mid - 1
                }
            if low > high then 
                none
            else 
                let mid_val = option.unwrap_or(list.get(xs, low), -1)
                if mid_val == target then 
                    some(low)
                else 
                    none
        }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:23:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
23 |                 let mid_val = option.unwrap_or(list.get(xs, low), -1)
   |                 ^^^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-3.almd:16:37
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 8 |             let low = 0
   |             ------------------- 'low' declared here
...
16 |                         low = mid + 1
   |                                     ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-3.almd:18:38
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 7 |             let high = len - 1
   |             -------------------- 'high' declared here
...
18 |                         high = mid - 1
   |                                      ^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-3.almd:24:20
  in variable mid_val
  hint: Check the variable name
   |
24 |                 if mid_val == target then
   |                    ^^^^^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:18:38
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
18 |                         high = mid - 1
   |                                      ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
