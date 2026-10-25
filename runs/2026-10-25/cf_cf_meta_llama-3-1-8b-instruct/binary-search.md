# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E012`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    let (lo, hi) = (0, len - 1)
    while lo <= hi {
      let mid = (lo + hi) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(mid_val) => {
          if mid_val == target then some(mid)
          else if mid_val < target then lo = mid + 1
          else hi = mid - 1
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
error[E009]: cannot reassign immutable binding 'lo'
  --> /tmp/dojo-binary-search-0.almd:12:52
  in lo = ...
  here: else if mid_val < target then lo = mid + 1
  hint: Use 'var lo = ...' instead of 'let lo = ...' to declare a mutable variable
  try:
      // let lo = ...  →  var lo = ...
      var lo = <initial value>
   |
12 |           else if mid_val < target then lo = mid + 1
   |                                                    ^
error[E009]: cannot reassign immutable binding 'hi'
  --> /tmp/dojo-binary-search-0.almd:13:27
  in hi = ...
  here: else hi = mid - 1
  hint: Use 'var hi = ...' instead of 'let hi = ...' to declare a mutable variable
  try:
      // let hi = ...  →  var hi = ...
      var hi = <initial value>
   |
13 |           else hi = mid - 1
   |                           ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:13:27
  in if branches
  here: else hi = mid - 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
13 |           else hi = mid - 1
   |                           ^

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
    var lo = 0
    var hi = len - 1
    while lo <= hi {
      let mid = (lo + hi) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(mid_val) => {
          if mid_val == target then some(mid)
          else if mid_val < target then lo = mid + 1
          else lo = mid + 1
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
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:14:27
  in if branches
  here: else lo = mid + 1
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
14 |           else lo = mid + 1
   |                           ^

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
    var lo = 0
    var hi = len - 1
    while lo <= hi {
      let mid = (lo + hi) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(mid_val) => {
          if mid_val == target then some(mid)
          else if mid_val < target then {
            lo = mid + 1
            some(mid)
          }
          else {
            hi = mid - 1
            some(mid)
          }
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
warning[E015]: fn 'binary_search' has the same signature as stdlib `list.binary_search`
  --> /tmp/dojo-binary-search-2.almd:1:1
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Only the name and signature were compared; equivalent behaviour is not established. Review `list.binary_search` before deciding whether it implements your intended operation.
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  | ^^
FAILED: /tmp/dojo-binary-search-2.almd
Compile error for /tmp/dojo-binary-search-2.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
    --> <generated.rs>:4361:25
     |
4360 | /                     if almide_eq!(mid_val, target) {
4361 | |                         Some(mid)
     | |                         ^^^^^^^^^ expected `()`, found `Option<i64>`
4362 | |                     } else {
4363 | |                         if (mid_val < target) {
...    |
4370 | |                     }
     | |_____________________- expected this to be `()`
     |
     = note: expected unit type `()`
                     found enum `Option<i64>`
help: you might have meant to return this value
     |
4361 |                         return Some(mid);
     |                         ++++++          +


error[E0308]: mismatched types
    --> <generated.rs>:4365:29
     |
4363 | /                         if (mid_val < target) {
4364 | |                             lo = (mid).wrapping_add(1i64);
4365 | |                             Some(mid)
     | |                             ^^^^^^^^^ expected `()`, found `Option<i64>`
4366 | |                         } else {
4367 | |                             hi = (mid).wrapping_sub(1i64);
4368 | |                             Some(mid)
4369 | |                         }
     | |_________________________- expected this to be `()`
     |
     = note: expected unit type `()`
                     found enum `Option<i64>`
help: you might have meant to return this value
     |
4365 |                             return Some(mid);
     |                             ++++++          +


error[E0308]: mismatched types
    --> <generated.rs>:4368:29
     |
4363 | /                         if (mid_val < target) {
4364 | |                             lo = (mid).wrapping_add(1i64);
4365 | |                             Some(mid)
4366 | |                         } else {
4367 | |                             hi = (mid).wrapping_sub(1i64);
4368 | |                             Some(mid)
     | |                             ^^^^^^^^^ expected `()`, found `Option<i64>`
4369 | |                         }
     | |_________________________- expected this to be `()`
     |
     = note: expected unit type `()`
                     found enum `Option<i64>`
help: you might have meant to return this value
     |
4368 |                             return Some(mid);
     |                             ++++++          +


error: could not compile `almide-generated` (bin "almide-generated" test) due to 3 previous errors; 6 warnings emitted

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    var lo = 0
    var hi = len - 1
    while lo <= hi {
      let mid = (lo + hi) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(mid_val) => {
          if mid_val == target then some(mid)
          else if mid_val < target then {
            lo = mid + 1
            some(mid)
          }
          else {
            hi = mid - 1
            some(mid)
          }
        }
        none => none
      }
    }
    none
  }
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    var lo = 0
    var hi = len - 1
    while lo <= hi {
      let mid = (lo + hi) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(mid_val) => {
          if mid_val == target then some(mid)
          else if mid_val < target then {
            lo = mid + 1
            none
          }
          else {
            hi = mid - 1
            none
          }
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
error[E012]: duplicate function 'binary_search'
  at line 29
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ---------------------------------------- first definition of 'binary_search' here
...
29 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ^

1 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
