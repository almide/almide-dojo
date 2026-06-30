# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let n = list.len(xs)
    let (lo, hi) = (0, n - 1)
    while lo <= hi {
      let mid = (lo + hi) / 2
      let mid_val = list.get(xs, mid)
      match mid_val {
        some(mid_val) => {
          if mid_val == target then some(mid)
          else if mid_val < target then lo = mid + 1
          else hi = mid - 1
        },
        none => lo = mid + 1
      }
    }
    option.unwrap_or(list.get(xs, lo), none)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected pattern at line 15:20 (got Eq '=')
  --> /tmp/dojo-binary-search-0.almd:15:20
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
15 |         none => lo = mid + 1
   |                    ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 18:5 (got Ident 'option')
  --> /tmp/dojo-binary-search-0.almd:18:5
   |
18 |     option.unwrap_or(list.get(xs, lo), none)
   |     ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:5:28
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
5 |     let (lo, hi) = (0, n - 1)
  |                            ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let n = list.len(xs)
    let (lo, hi) = (0, n - 1)
    let step = (x: Option[Int]) => {
      if list.is_empty(x) then none
      else {
        let mid = (list.unwrap_or(x, none) + lo + hi) / 2
        let mid_val = list.get(x, mid)
        match mid_val {
          some(mid_val) => {
            if mid_val == target then some(mid)
            else if mid_val < target then step(list.get(x, mid + 1))
            else step(list.get(x, mid - 1))
          },
          none => none
        }
      }
    }
    step(list.get(xs, 0))
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-binary-search-1.almd:7:24
  in call to list.is_empty()
  hint: Fix the argument type
  |
7 |       if list.is_empty(x) then none
  |                        ^
error[E002]: undefined function 'list.unwrap_or'
  --> /tmp/dojo-binary-search-1.almd:9:38
  in call to list.unwrap_or()
  hint: No function 'unwrap_or' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
9 |         let mid = (list.unwrap_or(x, none) + lo + hi) / 2
  |                                      ^^^^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-binary-search-1.almd:10:35
  in call to list.get()
  hint: Fix the argument type
   |
10 |         let mid_val = list.get(x, mid)
   |                                   ^^^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-binary-search-1.almd:14:66
  in call to list.get()
  hint: Fix the argument type
   |
14 |             else if mid_val < target then step(list.get(x, mid + 1))
   |                                                                  ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-1.almd:14:66
  in call to step()
  hint: Check the function name
   |
14 |             else if mid_val < target then step(list.get(x, mid + 1))
   |                                                                  ^
error[E005]: argument 'xs' expects List[A] but got Option[Int]
  --> /tmp/dojo-binary-search-1.almd:15:41
  in call to list.get()
  hint: Fix the argument type
   |
15 |             else step(list.get(x, mid - 1))
   |                                         ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-1.almd:15:41
  in call to step()
  hint: Check the function name
   |
15 |             else step(list.get(x, mid - 1))
   |                                         ^
error[E001]: type mismatch in call to list.is_empty(): expected List[A] but got Option[Int]
  --> /tmp/dojo-binary-search-1.almd:7:24
  in call to list.is_empty()
  hint: Fix the expression type or change the expected type
  |
7 |       if list.is_empty(x) then none
  |                        ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[Int]
  --> /tmp/dojo-binary-search-1.almd:10:35
  in call to list.get()
  hint: Fix the expression type or change the expected type
   |
10 |         let mid_val = list.get(x, mid)
   |                                   ^^^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[Int]
  --> /tmp/dojo-binary-search-1.almd:14:66
  in call to list.get()
  hint: Fix the expression type or change the expected type
   |
14 |             else if mid_val < target then step(list.get(x, mid + 1))
   |                                                                  ^
error[E001]: type mismatch in call to list.get(): expected List[A] but got Option[Int]
  --> /tmp/dojo-binary-search-1.almd:15:41
  in call to list.get()
  hint: Fix the expression type or change the expected type
   |
15 |             else step(list.get(x, mid - 1))
   |                                         ^

11 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let n = list.len(xs)
    let (lo, hi) = (0, n - 1)
    let step = (lo: Int, hi: Int) => {
      if lo > hi then none
      else {
        let mid = (lo + hi) / 2
        let mid_val = list.get(xs, mid)
        match mid_val {
          some(mid_val) => {
            if mid_val == target then some(mid)
            else if mid_val < target then step(lo, hi)
            else step(lo, mid - 1)
          },
          none => step(lo + 1, hi)
        }
      }
    }
    step(lo, hi)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:14:52
  in call to step()
  hint: Check the function name
   |
14 |             else if mid_val < target then step(lo, hi)
   |                                                    ^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:15:33
  in call to step()
  hint: Check the function name
   |
15 |             else step(lo, mid - 1)
   |                                 ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-2.almd:17:32
  in call to step()
  hint: Check the function name
   |
17 |           none => step(lo + 1, hi)
   |                                ^^

3 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.is_empty(xs) then none
  else {
    let n = list.len(xs)
    let (lo, hi) = (0, n - 1)
    let step = (lo: Int, hi: Int) => {
      if lo > hi then none
      else {
        let mid = (lo + hi) / 2
        let mid_val = list.get(xs, mid)
        match mid_val {
          some(mid_val) => {
            if mid_val == target then some(mid)
            else if mid_val < target then step(lo, hi)
            else step(lo, mid - 1)
          },
          none => step(lo + 1, hi)
        }
      }
    }
    step(lo, hi)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:14:52
  in call to step()
  hint: Check the function name
   |
14 |             else if mid_val < target then step(lo, hi)
   |                                                    ^^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:15:33
  in call to step()
  hint: Check the function name
   |
15 |             else step(lo, mid - 1)
   |                                 ^
error[E002]: undefined function 'step'
  --> /tmp/dojo-binary-search-3.almd:17:32
  in call to step()
  hint: Check the function name
   |
17 |           none => step(lo + 1, hi)
   |                                ^^

3 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
