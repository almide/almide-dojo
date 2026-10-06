# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

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
        some(mid_val) => {
          if mid_val == target then some(mid)
          else if mid_val < target then low = mid + 1
          else high = mid - 1
        }
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
  --> /tmp/dojo-binary-search-0.almd:12:53
  in low = ...
  here: else if mid_val < target then low = mid + 1
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
12 |           else if mid_val < target then low = mid + 1
   |                                                     ^
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
    let (low, high) = (0, len - 1)
    let step = fn (low: Int, high: Int) -> Option[Int] = {
      if low > high then none
      else {
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid)
        match mid_val {
          some(mid_val) => {
            if mid_val == target then some(mid)
            else if mid_val < target then step(low, mid - 1)
            else step(mid + 1, high)
          }
          none => none
        }
      }
    }
    step(low, high)
  }
}
```

**Diagnostic:**

```
error: Expected expression at line 6:16 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:6:16
  here: let step = fn (low: Int, high: Int) -> Option[Int] = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |     let step = fn (low: Int, high: Int) -> Option[Int] = {
  |                ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 23:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-1.almd:23:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 | }
   | ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-1.almd:14:43
  in call to step()
  here: else if mid_val < target then step(low, mid - 1)
  hint: Check the function name
   |
14 |             else if mid_val < target then step(low, mid - 1)
   |                                           ^^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-1.almd:15:18
  in call to step()
  here: else step(mid + 1, high)
  hint: Check the function name
   |
15 |             else step(mid + 1, high)
   |                  ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:21:10
  in variable low
  here: step(low, high)
  hint: Did you mean `len`?
  try:
      len
   |
21 |     step(low, high)
   |          ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:21:15
  in variable high
  here: step(low, high)
  hint: Check the variable name
   |
21 |     step(low, high)
   |               ^^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-1.almd:21:5
  in call to step()
  here: step(low, high)
  hint: Check the function name
   |
21 |     step(low, high)
   |     ^^^^

7 error(s) found
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
    let (low, high) = (0, len - 1)
    let step = (low, high) => {
      if low > high then none
      else {
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid)
        match mid_val {
          some(mid_val) => {
            if mid_val == target then some(mid)
            else if mid_val < target then step(low, mid - 1)
            else step(mid + 1, high)
          }
          none => none
        }
      }
    }
    step(low, high)
  }
}
```

**Diagnostic:**

```
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:14:43
  in call to step()
  here: else if mid_val < target then step(low, mid - 1)
  hint: Check the function name
   |
14 |             else if mid_val < target then step(low, mid - 1)
   |                                           ^^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:15:18
  in call to step()
  here: else step(mid + 1, high)
  hint: Check the function name
   |
15 |             else step(mid + 1, high)
   |                  ^^^^

2 error(s) found
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
    let (low, high) = (0, len - 1)
    let step = (low, high) => {
      if low > high then none
      else {
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid)
        match mid_val {
          some(mid_val) => {
            if mid_val == target then some(mid)
            else if mid_val < target then step(low, mid - 1)
            else step(mid + 1, high)
          }
          none => none
        }
      }
    }
    step(low, high)
  }
}
```

**Diagnostic:**

```
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:14:43
  in call to step()
  here: else if mid_val < target then step(low, mid - 1)
  hint: Check the function name
   |
14 |             else if mid_val < target then step(low, mid - 1)
   |                                           ^^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:15:18
  in call to step()
  here: else step(mid + 1, high)
  hint: Check the function name
   |
15 |             else step(mid + 1, high)
   |                  ^^^^

2 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
