# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.len(xs) == 0 then none
  else {
    let low = 0
    let high = list.len(xs) - 1
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target then some(mid)
      else if mid_val < target then low = mid + 1
      else high = mid - 1
    }
    none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:10:49
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 4 |     let low = 0
   |     ------------------- 'low' declared here
...
10 |       else if mid_val < target then low = mid + 1
   |                                                 ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:11:25
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 5 |     let high = list.len(xs) - 1
   |     -------------------- 'high' declared here
...
11 |       else high = mid - 1
   |                         ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:11:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
11 |       else high = mid - 1
   |                         ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.len(xs) == 0 then none
  else {
    var low = 0
    var high = list.len(xs) - 1
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target then some(mid)
      else if mid_val < target then low = mid + 1
      else high = mid - 1
    }
    none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:11:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
11 |       else high = mid - 1
   |                         ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.len(xs) == 0 then none
  else {
    var low = 0
    var high = list.len(xs) - 1
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target then some(mid)
      else if mid_val < target then low = mid + 1
      else high = mid - 1
    }
    none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:11:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
11 |       else high = mid - 1
   |                         ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.len(xs) == 0 then none
  else {
    var low = 0
    var high = list.len(xs) - 1
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target then some(mid)
      else if mid_val < target then low = mid + 1
      else high = mid - 1
    }
    none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:11:25
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
11 |       else high = mid - 1
   |                         ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
