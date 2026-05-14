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
  let low = 0
  let high = list.len(xs) - 1
in
  while low <= high {
    let mid = (low + high) / 2
    let mid_val = option.unwrap_or(list.get(xs, mid), -1)
    if mid_val == target then
      some(mid)
    else if mid_val < target then
      low = mid + 1
      continue
    else
      high = mid - 1
      continue
  };
  none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected expression at line 13:5 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:13:5
   |
13 |     else
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 16:3 (got RBrace '}')
  --> /tmp/dojo-binary-search-0.almd:16:3
   |
16 |   };
   |   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:14:14
  in variable mid
  hint: Check the variable name
   |
14 |       high = mid - 1
   |              ^^^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:14:20
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 3 |   let high = list.len(xs) - 1
   |   -------------------- 'high' declared here
...
14 |       high = mid - 1
   |                    ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:15:7
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
15 |       continue
   |       ^^^^^^^^

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
    let mid_val = option.unwrap_or(list.get(xs, mid), -1)
    if mid_val == target then
      some(mid)
    else if mid_val < target then
      low = mid + 1
    else
      high = mid - 1
  };
  none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 4:1 (got In 'in')
  --> /tmp/dojo-binary-search-1.almd:4:1
  |
4 | in
  | ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:13:20
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

2 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  var low = 0
  var high = list.len(xs) - 1
  while low <= high {
    let mid = (low + high) / 2
    let mid_val = option.unwrap_or(list.get(xs, mid), -1)
    if mid_val == target then
      some(mid)
    else if mid_val < target then
      low = mid + 1
      continue
    else
      high = mid - 1
      continue
  };
  none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 12:5 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:12:5
   |
12 |     else
   |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:3 (got RBrace '}')
  --> /tmp/dojo-binary-search-2.almd:15:3
   |
15 |   };
   |   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:13:14
  in variable mid
  hint: Check the variable name
   |
13 |       high = mid - 1
   |              ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:14:7
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
14 |       continue
   |       ^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0
  let high = list.len(xs) - 1
  while low <= high {
    let mid = (low + high) / 2
    let mid_val = option.unwrap_or(list.get(xs, mid), -1)
    if mid_val == target then some(mid) 
    else if mid_val < target then low = mid + 1
    else high = mid - 1
  }
  none
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-3.almd:8:47
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
  |
2 |   let low = 0
  |   ------------------- 'low' declared here
...
8 |     else if mid_val < target then low = mid + 1
  |                                               ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-3.almd:9:23
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
  |
3 |   let high = list.len(xs) - 1
  |   -------------------- 'high' declared here
...
9 |     else high = mid - 1
  |                       ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:9:23
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
9 |     else high = mid - 1
  |                       ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
