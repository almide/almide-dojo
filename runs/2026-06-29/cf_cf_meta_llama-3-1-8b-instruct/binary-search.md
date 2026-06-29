# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.len(xs) == 0 then none
  else {
    let low = 0
    let high = list.len(xs) - 1
    let found = (low <= high) => {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(x) => {
          if x == target then some(mid)
          else if x > target then binary_search(list.drop(xs, low + 1), target)
          else binary_search(list.drop(xs, 0), target)
        }
        none => none
      }
    }
    found.unwrap_or(none)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected ')' to close lambda parameters opened at line 6:17
  --> /tmp/dojo-binary-search-0.almd:6:22
  hint: Add ')' or check for a missing delimiter inside the lambda parameters
  |
6 |     let found = (low <= high) => {
  |                 --------------- '(' opened here
  |
6 |     let found = (low <= high) => {
  |                      ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-0.almd:20:1
   |
20 | }
   | ^
error[E003]: undefined variable 'found'
  --> /tmp/dojo-binary-search-0.almd:18:5
  in variable found
  hint: Check the variable name
   |
18 |     found.unwrap_or(none)
   |     ^^^^^

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
    let low = 0
    let high = list.len(xs) - 1
    let found = (low <= high) => {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(x) => {
          if x == target then some(mid)
          else if x > target then binary_search(list.drop(xs, low + 1), target)
          else binary_search(list.drop(xs, 0), target)
        }
        none => none
      }
    };
    found.unwrap_or(none)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected ')' to close lambda parameters opened at line 6:17
  --> /tmp/dojo-binary-search-1.almd:6:22
  hint: Add ')' or check for a missing delimiter inside the lambda parameters
  |
6 |     let found = (low <= high) => {
  |                 --------------- '(' opened here
  |
6 |     let found = (low <= high) => {
  |                      ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-1.almd:20:1
   |
20 | }
   | ^
error[E003]: undefined variable 'found'
  --> /tmp/dojo-binary-search-1.almd:18:5
  in variable found
  hint: Check the variable name
   |
18 |     found.unwrap_or(none)
   |     ^^^^^

3 error(s) found
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
    let low = 0
    let high = list.len(xs) - 1
    let found = (low <= high) => {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(x) => {
          if x == target then some(mid)
          else if x > target then binary_search(list.drop(xs, low + 1), target)
          else binary_search(list.drop(xs, 0), target)
        }
        none => none
      }
    };
    let result = found()
    result.unwrap_or(none)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected ')' to close lambda parameters opened at line 6:17
  --> /tmp/dojo-binary-search-2.almd:6:22
  hint: Add ')' or check for a missing delimiter inside the lambda parameters
  |
6 |     let found = (low <= high) => {
  |                 --------------- '(' opened here
  |
6 |     let found = (low <= high) => {
  |                      ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-2.almd:21:1
   |
21 | }
   | ^
error[E002]: undefined function 'found'
  --> /tmp/dojo-binary-search-2.almd:18:23
  in call to found()
  hint: Check the function name
   |
18 |     let result = found()
   |                       ^
error[E004]: result.unwrap_or() expects 2 argument(s) but got 1
  --> /tmp/dojo-binary-search-2.almd:19:22
  in call to result.unwrap_or()
  hint: Check the number of arguments
  try:
      // result.unwrap_or() takes 2 arg(s) — you passed 1
      result.unwrap_or(<r: Result[A, E]>, <default: A>)
   |
19 |     result.unwrap_or(none)
   |                      ^^^^
error[E005]: argument 'r' expects Result[A, E] but got Option[?2]
  --> /tmp/dojo-binary-search-2.almd:19:22
  in call to result.unwrap_or()
  hint: Fix the argument type
   |
19 |     result.unwrap_or(none)
   |                      ^^^^
error[E001]: type mismatch in call to result.unwrap_or(): expected Result[A, E] but got Option[?2]
  --> /tmp/dojo-binary-search-2.almd:19:22
  in call to result.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
19 |     result.unwrap_or(none)
   |                      ^^^^

6 error(s) found
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
    let low = 0
    let high = list.len(xs) - 1
    let found = (low <= high) => {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(x) => {
          if x == target then some(mid)
          else if x > target then binary_search(list.drop(xs, low + 1), target)
          else binary_search(list.drop(xs, 0), target)
        }
        none => none
      }
    };
    found()
  }
}.unwrap_or(none)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected ')' to close lambda parameters opened at line 6:17
  --> /tmp/dojo-binary-search-3.almd:6:22
  hint: Add ')' or check for a missing delimiter inside the lambda parameters
  |
6 |     let found = (low <= high) => {
  |                 --------------- '(' opened here
  |
6 |     let found = (low <= high) => {
  |                      ^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 20:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-3.almd:20:1
   |
20 | }.unwrap_or(none)
   | ^
error[E002]: undefined function 'found'
  --> /tmp/dojo-binary-search-3.almd:18:10
  in call to found()
  hint: Check the function name
   |
18 |     found()
   |          ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
