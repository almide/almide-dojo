# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then {
    none
  } else {
    let low = 0
    let high = len - 1
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(list.first(xs).unwrap())
      if mid_val == target then {
        some(mid)
      } else if mid_val < target then {
        low = mid + 1
      } else {
        high = mid - 1
      }
    }
    none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-binary-search-0.almd:10:60
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
   |
10 |       let mid_val = list.get(xs, mid).unwrap_or(list.first(xs).unwrap())
   |                                                            ^^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-0.almd:14:21
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 6 |     let low = 0
   |     ------------------- 'low' declared here
...
14 |         low = mid + 1
   |                     ^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:16:22
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 7 |     let high = len - 1
   |     -------------------- 'high' declared here
...
16 |         high = mid - 1
   |                      ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:16:22
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
16 |         high = mid - 1
   |                      ^

4 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then {
    none
  } else {
    var low = 0
    var high = len - 1
    while low <= high {
      var mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(list.first(xs).unwrap())
      if mid_val == target then {
        some(mid)
      } else if mid_val < target then {
        low = mid + 1
      } else {
        high = mid - 1
      }
    }
    none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-binary-search-1.almd:10:60
  in method call .unwrap()
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
   |
10 |       let mid_val = list.get(xs, mid).unwrap_or(list.first(xs).unwrap())
   |                                                            ^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:16:22
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
16 |         high = mid - 1
   |                      ^

2 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then {
    none
  } else {
    var low = 0
    var high = len - 1
    while low <= high {
      var mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(option.some(list.first(xs).unwrap()))
      if mid_val == target then {
        some(mid)
      } else if mid_val < target then {
        low = mid + 1
      } else {
        high = mid - 1
      }
    }
    none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected name at line 10:56 (got Some 'some')
  --> /tmp/dojo-binary-search-2.almd:10:56
   |
10 |       let mid_val = list.get(xs, mid).unwrap_or(option.some(list.first(xs).unwrap()))
   |                                                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-2.almd:21:1
   |
21 | }
   | ^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-2.almd:11:10
  in variable mid_val
  hint: Check the variable name
   |
11 |       if mid_val == target then {
   |          ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:12:14
  in variable mid
  hint: Check the variable name
   |
12 |         some(mid)
   |              ^^^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-2.almd:13:17
  in variable mid_val
  hint: Check the variable name
   |
13 |       } else if mid_val < target then {
   |                 ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:14:15
  in variable mid
  hint: Check the variable name
   |
14 |         low = mid + 1
   |               ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:16:16
  in variable mid
  hint: Check the variable name
   |
16 |         high = mid - 1
   |                ^^^
error[E001]: type mismatch in if branches: expected Option[Unknown] but got Unit
  --> /tmp/dojo-binary-search-2.almd:16:22
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Unknown]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Unknown]) -> Option[Unknown] = if cond then step(<update>) else x
   |
16 |         high = mid - 1
   |                      ^

8 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then {
    none
  } else {
    var low = 0
    var high = len - 1
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(option.some(list.first(xs).unwrap Boca)))
      if mid_val == target then {
        some(mid)
      } else if mid_val < target then {
        low = mid + 1
      } else {
        high = mid - 1
      }
    }
    none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected name at line 10:56 (got Some 'some')
  --> /tmp/dojo-binary-search-3.almd:10:56
   |
10 |       let mid_val = list.get(xs, mid).unwrap_or(option.some(list.first(xs).unwrap Boca)))
   |                                                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-3.almd:21:1
   |
21 | }
   | ^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-3.almd:11:10
  in variable mid_val
  hint: Check the variable name
   |
11 |       if mid_val == target then {
   |          ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:12:14
  in variable mid
  hint: Check the variable name
   |
12 |         some(mid)
   |              ^^^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-3.almd:13:17
  in variable mid_val
  hint: Check the variable name
   |
13 |       } else if mid_val < target then {
   |                 ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:14:15
  in variable mid
  hint: Check the variable name
   |
14 |         low = mid + 1
   |               ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:16:16
  in variable mid
  hint: Check the variable name
   |
16 |         high = mid - 1
   |                ^^^
error[E001]: type mismatch in if branches: expected Option[Unknown] but got Unit
  --> /tmp/dojo-binary-search-3.almd:16:22
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Unknown]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Unknown]) -> Option[Unknown] = if cond then step(<update>) else x
   |
16 |         high = mid - 1
   |                      ^

8 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
