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
    while low <= high do
      let mid = (low + high) / 2
      let mid_val = option.unwrap_or(list.get(xs, mid), -1)
      if mid_val == target then
        some(mid)
      else if mid_val < target then
        low = mid + 1
      else
        high = mid - 1
      end
    end;
    none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-binary-search-0.almd:6:23
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
6 |     while low <= high do
  |                       ^^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:12:21
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 3 |   let low = 0
   |   ------------------- 'low' declared here
...
12 |         low = mid + 1
   |                     ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:14:22
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 4 |   let high = len - 1
   |   -------------------- 'high' declared here
...
14 |         high = mid - 1
   |                      ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-binary-search-0.almd:15:7
  in variable end
  hint: Did you mean `mid`?
  try:
      // end  →  mid
      mid
   |
15 |       end
   |       ^^^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-binary-search-0.almd:16:5
  in variable end
  hint: Did you mean `mid`?
  try:
      // end  →  mid
      mid
   |
16 |     end;
   |     ^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:14:22
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
14 |         high = mid - 1
   |                      ^

6 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide

```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:3:58
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
3 | test "binary_search empty" { assert_eq(binary_search([], 1), none) }
  |                                                          ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:4:66
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
4 | test "binary_search single found" { assert_eq(binary_search([5], 5), some(0)) }
  |                                                                  ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:5:70
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
5 | test "binary_search single not found" { assert_eq(binary_search([5], 3), none) }
  |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:6:71
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
6 | test "binary_search first" { assert_eq(binary_search([1, 3, 5, 7, 9], 1), some(0)) }
  |                                                                       ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:7:72
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
7 | test "binary_search middle" { assert_eq(binary_search([1, 3, 5, 7, 9], 5), some(2)) }
  |                                                                        ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:8:70
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
8 | test "binary_search last" { assert_eq(binary_search([1, 3, 5, 7, 9], 9), some(4)) }
  |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:9:79
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
  |
9 | test "binary_search not found low" { assert_eq(binary_search([1, 3, 5, 7, 9], 0), none) }
  |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:10:79
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
   |
10 | test "binary_search not found mid" { assert_eq(binary_search([1, 3, 5, 7, 9], 4), none) }
   |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-1.almd:11:80
  in call to binary_search()
  hint: Did you mean `list.binary_search`?
  try:
      // binary_search(...)  →  list.binary_search(...)
      list.binary_search(...)
   |
11 | test "binary_search not found high" { assert_eq(binary_search([1, 3, 5, 7, 9], 10), none) }
   |                                                                                ^^

9 error(s) found
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
    let len = list.len(xs) 
    in 
    let rec search(low: Int, high: Int) = 
      if low > high then none 
      else 
        let mid = (low + high) / 2 
        in 
        let mid_val = option.unwrap_or(list.get(xs, mid), -1) 
        in 
        if mid_val == target then some(mid) 
        else if mid_val < target then search(mid + 1, high) 
        else search(low, mid - 1) 
      in 
      search(0, len - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let len = list.len(xs)
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
  if list.is_empty(xs) then none 
  else 
    {
      let len = list.len(xs)
      let rec search(low: Int, high: Int) = 
        if low > high then none 
        else 
          {
            let mid = (low + high) / 2 
            let mid_val = option.unwrap_or(list.get(xs, mid), -1) 
            if mid_val == target then some(mid) 
            else if mid_val < target then search(mid + 1, high) 
            else search(low, mid - 1)
          }
      search(0, len - 1)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-3.almd:6:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
6 |       let rec search(low: Int, high: Int) =
  |           ^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:7:12
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
  |
7 |         if low > high then none
  |            ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:7:18
  in variable high
  hint: Check the variable name
  |
7 |         if low > high then none
  |                  ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:10:24
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
10 |             let mid = (low + high) / 2
   |                        ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:10:30
  in variable high
  hint: Check the variable name
   |
10 |             let mid = (low + high) / 2
   |                              ^^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:13:59
  in variable high
  hint: Check the variable name
   |
13 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:13:59
  in call to search()
  hint: Check the function name
   |
13 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:14:25
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
14 |             else search(low, mid - 1)
   |                         ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:14:36
  in call to search()
  hint: Check the function name
   |
14 |             else search(low, mid - 1)
   |                                    ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:16:23
  in call to search()
  hint: Check the function name
   |
16 |       search(0, len - 1)
   |                       ^

10 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
