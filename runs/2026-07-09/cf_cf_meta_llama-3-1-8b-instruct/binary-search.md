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
  if len == 0 then none
  else if target == list.first(xs) then some(0)
  else if target == list.last(xs) then some(len - 1)
  else {
    let low = 0
    let high = len - 1
    let i = 0
    while low <= high {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if target == mid_val then return some(mid)
      else if target < mid_val then high = mid - 1
      else low = mid + 1
      i += 1
      if i > 1000 then return none
    }
    none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Assignments return Unit and can't appear here
  --> /tmp/dojo-binary-search-0.almd:16:10
  in assignment-in-expr
  hint: Almide assignment `x = 5` is a statement, not an expression. Use separate statements: `x = 5; let r = x` — or pick the value directly: `let r = 5`.
   |
16 |       i += 1
   |          ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-0.almd:21:1
   |
21 | }
   | ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:17:7
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
17 |       if i > 1000 then none
   |       ^^

3 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then return none
  else if target == list.first(xs) then return some(0)
  else if target == list.last(xs) then return some(len - 1)
  else {
    let low = 0
    let high = len - 1
    let i = 0
    let step = fn step(low: Int, high: Int, i: Int) -> Option[Int] = {
      if low > high then return none
      else {
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid).unwrap_or(-1)
        if target == mid_val then return some(mid)
        else if target < mid_val then return step(low, mid - 1, i + 1)
        else return step(mid + 1, high, i + 1)
      }
    }
    step(low, high, 0)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 10:16 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:10:16
   |
10 |     let step = fn step(low: Int, high: Int, i: Int) -> Option[Int] = {
   |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 22:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-1.almd:22:1
   |
22 | }
   | ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-1.almd:16:62
  in call to step()
  hint: Check the function name
   |
16 |         else if target < mid_val then step(low, mid - 1, i + 1)
   |                                                              ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-1.almd:17:38
  in call to step()
  hint: Check the function name
   |
17 |         else step(mid + 1, high, i + 1)
   |                                      ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:20:10
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
20 |     step(low, high, 0)
   |          ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:20:15
  in variable high
  hint: Check the variable name
   |
20 |     step(low, high, 0)
   |               ^^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-1.almd:20:21
  in call to step()
  hint: Check the function name
   |
20 |     step(low, high, 0)
   |                     ^

7 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then return none
  else if target == list.first(xs) then return some(0)
  else if target == list.last(xs) then return some(len - 1)
  else {
    let low = 0
    let high = len - 1
    let step = fn step(low: Int, high: Int) -> Option[Int] = {
      if low > high then return none
      else {
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid).unwrap_or(-1)
        if target == mid_val then return some(mid)
        else if target < mid_val then return step(low, mid - 1)
        else return step(mid + 1, high)
      }
    }
    step(low, high)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 9:16 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:9:16
  |
9 |     let step = fn step(low: Int, high: Int) -> Option[Int] = {
  |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-2.almd:21:1
   |
21 | }
   | ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:15:55
  in call to step()
  hint: Check the function name
   |
15 |         else if target < mid_val then step(low, mid - 1)
   |                                                       ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:16:28
  in call to step()
  hint: Check the function name
   |
16 |         else step(mid + 1, high)
   |                            ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:19:10
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
19 |     step(low, high)
   |          ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:19:15
  in variable high
  hint: Check the variable name
   |
19 |     step(low, high)
   |               ^^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:19:15
  in call to step()
  hint: Check the function name
   |
19 |     step(low, high)
   |               ^^^^

7 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then return none
  else if target == list.first(xs) then return some(0)
  else if target == list.last(xs) then return some(len - 1)
  else {
    let low = 0
    let high = len - 1
    fn step(low: Int, high: Int) -> Option[Int] = {
      if low > high then return none
      else {
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid).unwrap_or(-1)
        if target == mid_val then return some(mid)
        else if target < mid_val then return step(low, mid - 1)
        else return step(mid + 1, high)
      }
    }
    step(low, high)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 9:5 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:9:5
  |
9 |     fn step(low: Int, high: Int) -> Option[Int] = {
  |     ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 21:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-3.almd:21:1
   |
21 | }
   | ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:15:55
  in call to step()
  hint: Check the function name
   |
15 |         else if target < mid_val then step(low, mid - 1)
   |                                                       ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:16:28
  in call to step()
  hint: Check the function name
   |
16 |         else step(mid + 1, high)
   |                            ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:19:10
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
19 |     step(low, high)
   |          ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:19:15
  in variable high
  hint: Check the variable name
   |
19 |     step(low, high)
   |               ^^^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:19:15
  in call to step()
  hint: Check the function name
   |
19 |     step(low, high)
   |               ^^^^

7 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
