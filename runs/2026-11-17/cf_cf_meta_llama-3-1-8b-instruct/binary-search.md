# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

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
      let mid_val = list.get(xs, mid) ?? 0
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
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:10:49
  in low = ...
  here: else if mid_val < target then low = mid + 1
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
10 |       else if mid_val < target then low = mid + 1
   |                                                 ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:11:25
  in high = ...
  here: else high = mid - 1
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
11 |       else high = mid - 1
   |                         ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit — the `then` branch at line 9 fixed the type to Option[Int]
  --> /tmp/dojo-binary-search-0.almd:10:12
  in if branches
  here: else if mid_val < target then low = mid + 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
10 |       else if mid_val < target then low = mid + 1
   |            ^^

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
      let mid_val = list.get(xs, mid) ?? 0
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
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit — the `then` branch at line 10 fixed the type to Option[Int]
  --> /tmp/dojo-binary-search-1.almd:11:12
  in if branches
  here: else if mid_val < target then low = mid + 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
11 |       else if mid_val < target then low = mid + 1
   |            ^^

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
    let step(x: Option[Int]) -> Option[Int] = if low <= high then {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) ?? 0
      if mid_val == target then some(mid)
      else if mid_val < target then step(low = mid + 1)
      else step(high = mid - 1)
    } else none
    step(none)
  }
}
```

**Diagnostic:**

```
error: Expected Eq at line 7:13 (got LParen '(')
  --> /tmp/dojo-binary-search-2.almd:7:13
  here: let step(x: Option[Int]) -> Option[Int] = if low <= high then {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |     let step(x: Option[Int]) -> Option[Int] = if low <= high then {
  |             ^
error: Expected ')' to close function call opened at line 11:41
  --> /tmp/dojo-binary-search-2.almd:11:46
  here: else if mid_val < target then step(low = mid + 1)
  hint: Add ')' or check for a missing delimiter inside the function call
   |
11 |       else if mid_val < target then step(low = mid + 1)
   |                                         --------------- '(' opened here
   |
11 |       else if mid_val < target then step(low = mid + 1)
   |                                              ^
error: Expected expression at line 13:7 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:13:7
  here: } else none
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     } else none
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 16:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-2.almd:16:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 | }
   | ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:14:5
  in call to step()
  here: step(none)
  hint: Check the function name
   |
14 |     step(none)
   |     ^^^^
error[E001]: type mismatch in if branches: expected Option[?0] but got Unit — the `then` branch at line 3 fixed the type to Option[?0]
  --> /tmp/dojo-binary-search-2.almd:4:8
  in if branches
  here: else {
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[?0]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[?0]) -> Option[?0] = if cond then step(<update>) else x
  |
4 |   else {
  |        ^
error[E025]: cannot infer a concrete type for this expression (type Option[?1])
  --> /tmp/dojo-binary-search-2.almd:14:10
  in this expression with an unconstrained type
  here: step(none)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
14 |     step(none)
   |          ^^^^

7 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
  parse error: Expected Eq at line 7:13 (got LParen '(')
  parse error: Expected ')' to close function call opened at line 11:41
  parse error: Expected expression at line 13:7 (got Else 'else')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
    let step(x: Option[Int]) -> Option[Int] = if low <= high then {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) ?? 0
      if mid_val == target then some(mid)
      else if mid_val < target then step(list.get(xs, mid + 1) ?? none)
      else step(list.get(xs, mid - 1) ?? none)
    } else none
    step(list.get(xs, 0) ?? none)
  }
}
```

**Diagnostic:**

```
error: Expected Eq at line 7:13 (got LParen '(')
  --> /tmp/dojo-binary-search-3.almd:7:13
  here: let step(x: Option[Int]) -> Option[Int] = if low <= high then {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
7 |     let step(x: Option[Int]) -> Option[Int] = if low <= high then {
  |             ^
error: Expected expression at line 13:7 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:13:7
  here: } else none
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
13 |     } else none
   |       ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 16:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-3.almd:16:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 | }
   | ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:11:37
  in call to step()
  here: else if mid_val < target then step(list.get(xs, mid + 1) ?? none)
  hint: Check the function name
   |
11 |       else if mid_val < target then step(list.get(xs, mid + 1) ?? none)
   |                                     ^^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:12:12
  in call to step()
  here: else step(list.get(xs, mid - 1) ?? none)
  hint: Check the function name
   |
12 |       else step(list.get(xs, mid - 1) ?? none)
   |            ^^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:14:5
  in call to step()
  here: step(list.get(xs, 0) ?? none)
  hint: Check the function name
   |
14 |     step(list.get(xs, 0) ?? none)
   |     ^^^^
error[E001]: type mismatch in ?? fallback: expected Int but got Option[?1]
  --> /tmp/dojo-binary-search-3.almd:11:67
  in ?? fallback
  here: else if mid_val < target then step(list.get(xs, mid + 1) ?? none)
  hint: Fix the expression type or change the expected type
   |
11 |       else if mid_val < target then step(list.get(xs, mid + 1) ?? none)
   |                                                                   ^^^^
error[E001]: type mismatch in ?? fallback: expected Int but got Option[?2]
  --> /tmp/dojo-binary-search-3.almd:12:42
  in ?? fallback
  here: else step(list.get(xs, mid - 1) ?? none)
  hint: Fix the expression type or change the expected type
   |
12 |       else step(list.get(xs, mid - 1) ?? none)
   |                                          ^^^^
error[E001]: type mismatch in ?? fallback: expected Int but got Option[?3]
  --> /tmp/dojo-binary-search-3.almd:14:29
  in ?? fallback
  here: step(list.get(xs, 0) ?? none)
  hint: Fix the expression type or change the expected type
   |
14 |     step(list.get(xs, 0) ?? none)
   |                             ^^^^

9 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
  parse error: Expected Eq at line 7:13 (got LParen '(')
  parse error: Expected expression at line 13:7 (got Else 'else')
  parse error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 16:1 (got RBrace '}')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
