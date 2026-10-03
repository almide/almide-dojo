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
      match mid_val {
        some(mid) => {
          if mid == target then some(mid)
          else if mid < target then low = mid + 1
          else high = mid - 1
        },
        none => none
      }
    }
    none
  }
}
```

**Diagnostic:**

```
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:12:49
  in low = ...
  here: else if mid < target then low = mid + 1
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
12 |           else if mid < target then low = mid + 1
   |                                                 ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:13:29
  in high = ...
  here: else high = mid - 1
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
13 |           else high = mid - 1
   |                             ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:13:29
  in if branches
  here: else high = mid - 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
13 |           else high = mid - 1
   |                             ^

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
      match mid_val {
        some(mid) => {
          if mid == target then some(mid)
          else if mid < target then low = mid + 1
          else low = mid + 1
        },
        none => low = high + 1
      }
    }
    if low <= high then some(low) else none
  }
}
```

**Diagnostic:**

```
error: Expected pattern at line 16:21 (got Eq '=')
  --> /tmp/dojo-binary-search-1.almd:16:21
  here: none => low = high + 1
  hint: assignment is a statement, not an expression — a match arm that assigns needs a block body:
    ok(_) => { c = c + 1 }
   |
16 |         none => low = high + 1
   |                     ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 19:5 (got If 'if')
  --> /tmp/dojo-binary-search-1.almd:19:5
  here: if low <= high then some(low) else none
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |     if low <= high then some(low) else none
   |     ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:6:22
  in if branches
  here: var high = len - 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
6 |     var high = len - 1
  |                      ^

3 error(s) found
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
      match mid_val {
        some(mid) => {
          if mid == target then some(mid)
          else if mid < target then low = mid + 1
          else high = mid - 1
        },
        none => high = low - 1
      }
    }
    if low <= high then some(low) else none
  }
}
```

**Diagnostic:**

```
error: Expected pattern at line 16:22 (got Eq '=')
  --> /tmp/dojo-binary-search-2.almd:16:22
  here: none => high = low - 1
  hint: assignment is a statement, not an expression — a match arm that assigns needs a block body:
    ok(_) => { c = c + 1 }
   |
16 |         none => high = low - 1
   |                      ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 19:5 (got If 'if')
  --> /tmp/dojo-binary-search-2.almd:19:5
  here: if low <= high then some(low) else none
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
19 |     if low <= high then some(low) else none
   |     ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:6:22
  in if branches
  here: var high = len - 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
6 |     var high = len - 1
  |                      ^

3 error(s) found
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
      match mid_val {
        some(mid) => {
          if mid == target then some(mid)
          else if mid < target then low = mid + 1
          else high = mid - 1
        },
        none => {
          if low == high then none
          else high = low - 1
        }
      }
    }
    if low <= high then some(low) else none
  }
}
```

**Diagnostic:**

```
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:14:29
  in if branches
  here: else high = mid - 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
14 |           else high = mid - 1
   |                             ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:18:29
  in if branches
  here: else high = low - 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // the else-arm is `high = ...` (assignment, returns Unit).
      // if/else is an *expression*: both arms must produce Option[Int].
      // Rewrite as a rebinding of `high`:
      //
      //   let new_high = if cond then <new-value-for-high> else high
      //
      // Or, if high is a loop-like accumulator, use recursion instead of mutation.
   |
18 |           else high = low - 1
   |                             ^

2 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
