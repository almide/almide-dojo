# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0 
  let high = list.len(xs) - 1 
  let found = false 
  let result = none 
  in 
    while low <= high && !found do 
      let mid = (low + high) / 2 
      let mid_val = option.unwrap_or(list.get(xs, mid), -1) 
      if mid_val == target then 
        result = some(mid) 
      else if mid_val < target then 
        low = mid + 1 
      else 
        high = mid - 1 
      found = result != none 
    ; 
    result
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: '&&' is not valid in Almide at line 7:23
  --> /tmp/dojo-binary-search-0.almd:7:23
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
7 |     while low <= high && !found do
  |                       ^
error[E009]: cannot reassign immutable binding 'result'
  --> /tmp/dojo-binary-search-0.almd:11:23
  in result = ...
  hint: Use 'var result = ...' instead of 'let result = ...' to declare a mutable variable
  try:
      // let result = ...  →  var result = ...
      var result = <initial value>
   |
 5 |   let result = none
   |   ---------------------- 'result' declared here
...
11 |         result = some(mid)
   |                       ^^^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:13:21
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 2 |   let low = 0
   |   ------------------- 'low' declared here
...
13 |         low = mid + 1
   |                     ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:15:22
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 3 |   let high = list.len(xs) - 1
   |   -------------------- 'high' declared here
...
15 |         high = mid - 1
   |                      ^
error[E009]: cannot reassign immutable binding 'found'
  --> /tmp/dojo-binary-search-0.almd:16:25
  in found = ...
  hint: Use 'var found = ...' instead of 'let found = ...' to declare a mutable variable
  try:
      // let found = ...  →  var found = ...
      var found = <initial value>
   |
 4 |   let found = false
   |   --------------------- 'found' declared here
...
16 |       found = result != none
   |                         ^^^^

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
  var result = none 
  in 
    while low <= high and result == none do 
      var mid = (low + high) / 2 
      var mid_val = option.unwrap_or(list.get(xs, mid), -1) 
      if mid_val == target then 
        result = some(mid) 
      else if mid_val < target then 
        low = mid + 1 
      else 
        high = mid - 1 
    ; 
    result
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-binary-search-1.almd:5:3
  |
5 |   in
  |   ^
error: `while ... do ... done` is Pascal/Ruby syntax
  --> /tmp/dojo-binary-search-1.almd:6:42
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
6 |     while low <= high and result == none do
  |                                          ^^

2 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  var low = 0 
  var high = list.len(xs) - 1 
  var result = none 
  while low <= high and result == none {
    var mid = (low + high) / 2 
    var mid_val = option.unwrap_or(list.get(xs, mid), -1) 
    if mid_val == target then 
      result = some(mid) 
    else if mid_val < target then 
      low = mid + 1 
    else 
      high = mid - 1 
  };
  result
```
