# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let low = 0
  let high = list.len(xs) - 1
  while low <= high {
    let mid = (low + high) / 2
    match list.get(xs, mid) {
      some(mid_val) => {
        if mid_val == target {
          return some(mid)
        } else if mid_val > target {
          high = mid - 1
        } else {
          low = mid + 1
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
Compiling /tmp/dojo-binary-search-0.almd
error: Expected Then at line 8:30 (got LBrace '{')
  --> /tmp/dojo-binary-search-0.almd:8:30
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |         if mid_val == target {
  |                              ^
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
11 |           high = mid - 1
   |                  ^^^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-0.almd:11:24
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 3 |   let high = list.len(xs) - 1
   |   -------------------- 'high' declared here
...
11 |           high = mid - 1
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
11 |           high = mid - 1
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
  let var low = 0
  let var high = list.len(xs) - 1
  while low <= high {
    let mid = (low + high) / 2
    match list.get(xs, mid) {
      some(mid_val) => {
        if mid_val == target {
          return some(mid)
        } else if mid_val > target {
          low = mid + 1
        } else {
          high = mid - 1
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
Compiling /tmp/dojo-binary-search-1.almd
error: Expected identifier at line 2:7 (got Var 'var')
  --> /tmp/dojo-binary-search-1.almd:2:7
  |
2 |   let var low = 0
  |       ^
error: Expected identifier at line 3:7 (got Var 'var')
  --> /tmp/dojo-binary-search-1.almd:3:7
  |
3 |   let var high = list.len(xs) - 1
  |       ^
error: Expected Then at line 8:30 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:8:30
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |         if mid_val == target {
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:11 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:12:11
   |
12 |         } else {
   |           ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:11:17
  in variable mid
  hint: Check the variable name
   |
11 |           low = mid + 1
   |                 ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:11:23
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
11 |           low = mid + 1
   |                       ^

6 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let low = 0
  let high = list.len(xs) - 1
  while low <= high {
    let mid = (low + high) / 2
    match list.get(xs, mid) {
      some(mid_val) => {
        if mid_val == target {
          return some(mid)
        } else if mid_val > target {
          low = mid + 1
        } else {
          high = mid - 1
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
Compiling /tmp/dojo-binary-search-2.almd
error: Expected Then at line 8:30 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:8:30
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |         if mid_val == target {
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:11 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:12:11
   |
12 |         } else {
   |           ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:11:17
  in variable mid
  hint: Check the variable name
   |
11 |           low = mid + 1
   |                 ^^^
error[E009]: cannot reassign immutable binding 'low'
  --> /tmp/dojo-binary-search-2.almd:11:23
  in low = ...
  hint: Use 'var low = ...' instead of 'let low = ...' to declare a mutable variable
  try:
      // let low = ...  →  var low = ...
      var low = <initial value>
   |
 2 |   let low = 0
   |   ------------------- 'low' declared here
...
11 |           low = mid + 1
   |                       ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:11:23
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
11 |           low = mid + 1
   |                       ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  var low = 0
  var high = list.len(xs) - 1
  while low <= high {
    var mid = (low + high) / 2
    match list.get(xs, mid) {
      some(mid_val) => {
        if mid_val == target {
          return some(mid)
        } else if mid_val > target {
          high = mid - 1
        } else {
          low = mid + 1
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
error: Expected Then at line 8:30 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:8:30
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
8 |         if mid_val == target {
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:11 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:12:11
   |
12 |         } else {
   |           ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:11:18
  in variable mid
  hint: Check the variable name
   |
11 |           high = mid - 1
   |                  ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:11:24
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
11 |           high = mid - 1
   |                        ^

4 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
