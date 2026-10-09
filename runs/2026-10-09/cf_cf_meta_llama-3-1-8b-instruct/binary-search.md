# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    let (low, high) = (0, len - 1)
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid)
      if mid_val == none then none
      else {
        let mid_val = option.unwrap_or(mid_val, -1)
        if mid_val == target then some(mid)
        else if mid_val < target then low = mid + 1
        else high = mid - 1
      }
    }
    none
  }
}
```

**Diagnostic:**

```
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:14:23
  in low = ...
  here: low = mid + 1
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
14 |           low = mid + 1
   |                       ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:16:24
  in high = ...
  here: high = mid - 1
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
16 |           high = mid - 1
   |                        ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:16:24
  in if branches
  here: high = mid - 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
16 |           high = mid - 1
   |                        ^

3 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    var low = 0
    var high = len - 1
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid)
      if mid_val == none then none
      else {
        let mid_val = option.unwrap_or(mid_val, -1)
        if mid_val == target then some(mid)
        else if mid_val < target then low = mid + 1
        else low = mid + 1
      }
    }
    none
  }
}
```

**Diagnostic:**

```
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:17:23
  in if branches
  here: low = mid + 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
17 |           low = mid + 1
   |                       ^

1 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    var low = 0
    var high = len - 1
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid)
      if mid_val == none then none
      else {
        let mid_val = option.unwrap_or(mid_val, -1)
        if mid_val == target then some(mid)
        else if mid_val < target then {
          low = mid + 1
        } else {
          high = mid - 1
        }
      }
    }
    none
  }
}
```

**Diagnostic:**

```
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:17:24
  in if branches
  here: high = mid - 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
17 |           high = mid - 1
   |                        ^

1 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    var low = 0
    var high = len - 1
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid)
      if mid_val == none then none
      else {
        let mid_val = option.unwrap_or(mid_val, -1)
        if mid_val == target then some(mid)
        else if mid_val < target then {
          low = mid + 1
        } else {
          high = mid - 1
        }
      }
    }
    some(-1) // return some(-1) if not found
  }
}
```

**Diagnostic:**

```
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:17:24
  in if branches
  here: high = mid - 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
17 |           high = mid - 1
   |                        ^

1 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
