# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let (left, right) = (0, list.len(xs) - 1)
  while left <= right {
    let mid = (left + right) / 2
    let mid_value = list.get(xs, mid)
    match mid_value {
      some(mid_value) => {
        if mid_value == target {
          return some(mid)
        } else if mid_value < target {
          left = mid + 1
        } else {
          right = mid - 1
        }
      }
      none => return none
    }
  }
  none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected Then at line 8:32 (got LBrace '{')
  --> /tmp/dojo-binary-search-0.almd:8:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |         if mid_value == target {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:11 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:12:11
   |
12 |         } else {
   |           ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:11:18
  in variable mid
  hint: Check the variable name
   |
11 |           left = mid + 1
   |                  ^^^
error[E009]: cannot reassign immutable binding 'left'
  --> /tmp/dojo-binary-search-0.almd:11:24
  in left = ...
  hint: Use 'var left = ...' instead of 'let left = ...' to declare a mutable variable
  try:
      // let left = ...  →  var left = ...
      var left = <initial value>
   |
11 |           left = mid + 1
   |                        ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:11:24
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
11 |           left = mid + 1
   |                        ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let (left, right) = (0, list.len(xs) - 1)
  while left <= right {
    let mid = (left + right) / 2
    let mid_value = list.get(xs, mid)
    match mid_value {
      some(mid_value) => {
        if mid_value == target {
          return some(mid)
        } else if mid_value < target {
          left = mid + 1
        } else {
          right = mid - 1
        }
      }
      none => return none
    }
  }
  none
}

// Corrected code:
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  var left = 0
  var right = list.len(xs) - 1
  while left <= right {
    let mid = (left + right) / 2
    let mid_value = list.get(xs, mid)
    match mid_value {
      some(mid_value) => {
        if mid_value == target {
          return some(mid)
        } else if mid_value < target {
          left = mid + 1
        } else {
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected Then at line 8:32 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:8:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |         if mid_value == target {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:11 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:12:11
   |
12 |         } else {
   |           ^
error: Expected Then at line 31:32 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:31:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
   |
31 |         if mid_value == target {
   |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 35:11 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:35:11
   |
35 |         } else {
   |           ^
error[E012]: duplicate function 'binary_search'
  at line 23
  in fn binary_search
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
   |
 1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ---------------------------------------- first definition of 'binary_search' here
...
23 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
   | ^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:11:18
  in variable mid
  hint: Check the variable name
   |
11 |           left = mid + 1
   |                  ^^^
error[E009]: cannot reassign immutable binding 'left'
  --> /tmp/dojo-binary-search-1.almd:11:24
  in left = ...
  hint: Use 'var left = ...' instead of 'let left = ...' to declare a mutable variable
  try:
      // let left = ...  →  var left = ...
      var left = <initial value>
   |
11 |           left = mid + 1
   |                        ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:34:18
  in variable mid
  hint: Check the variable name
   |
34 |           left = mid + 1
   |                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:11:24
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
11 |           left = mid + 1
   |                        ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:34:24
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
34 |           left = mid + 1
   |                        ^

10 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  var left = 0
  var right = list.len(xs) - 1
  while left <= right {
    let mid = (left + right) / 2
    let mid_value = list.get(xs, mid)
    match mid_value {
      some(mid_value) => {
        if mid_value == target {
          return some(mid)
        } else if mid_value < target {
          left = mid + 1
        } else {
          right = mid - 1
        }
      }
      none => {
        return none
      }
    }
  }
  none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected Then at line 9:32 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:9:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |         if mid_value == target {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:11 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:13:11
   |
13 |         } else {
   |           ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:12:18
  in variable mid
  hint: Check the variable name
   |
12 |           left = mid + 1
   |                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:12:24
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
12 |           left = mid + 1
   |                        ^

4 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  var left = 0
  var right = list.len(xs) - 1
  while left <= right {
    let mid = (left + right) / 2
    let mid_value = list.get(xs, mid)
    match mid_value {
      some(mid_value) => {
        if mid_value == target {
          return some(mid)
        } else if mid_value < target {
          left = mid + 1
        } else {
          right = mid - 1
        }
      }
      none => {
        return none
      }
    }
  }
  return none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected Then at line 9:32 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:9:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |         if mid_value == target {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:11 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:13:11
   |
13 |         } else {
   |           ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:12:18
  in variable mid
  hint: Check the variable name
   |
12 |           left = mid + 1
   |                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:12:24
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
12 |           left = mid + 1
   |                        ^

4 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
