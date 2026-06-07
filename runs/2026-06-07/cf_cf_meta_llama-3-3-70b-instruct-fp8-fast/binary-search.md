# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E002`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
  let len = list.len(xs)
  let low = 0
  let high = len - 1
in
  if len == 0 then
    none
  else
    let rec search(low: Int, high: Int) =
      if low > high then
        none
      else
        let mid = (low + high) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        if mid_val == target then
          some(mid)
        else if mid_val < target then
          search(mid + 1, high)
        else
          search(low, mid - 1)
    in
      search(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:9:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |     let rec search(low: Int, high: Int) =
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:13:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let mid = (low + high) / 2
   |         ^^^
error: Expected expression at line 21:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:21:5
   |
21 |     in
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:14:53
  in variable mid
  hint: Check the variable name
   |
14 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:16:16
  in variable mid
  hint: Check the variable name
   |
16 |           some(mid)
   |                ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:18:18
  in variable mid
  hint: Check the variable name
   |
18 |           search(mid + 1, high)
   |                  ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:18:27
  in call to search()
  hint: Check the function name
   |
18 |           search(mid + 1, high)
   |                           ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:20:23
  in variable mid
  hint: Check the variable name
   |
20 |           search(low, mid - 1)
   |                       ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:20:29
  in call to search()
  hint: Check the function name
   |
20 |           search(low, mid - 1)
   |                             ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:22:19
  in call to search()
  hint: Check the function name
   |
22 |       search(low, high)
   |                   ^^^^

10 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
  if list.len(xs) == 0 then
    none
  else
    let low = 0
    let high = list.len(xs) - 1
  in
    { 
      fn search(low: Int, high: Int) -> Option[Int] =
        if low > high then
          none
        else
          let mid = (low + high) / 2
          let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        in
          if mid_val == target then
            some(mid)
          else if mid_val < target then
            search(mid + 1, high)
          else
            search(low, mid - 1)
      ;
      search(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let low = 0
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:13:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |           let mid = (low + high) / 2
   |           ^^^

2 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
  if list.len(xs) == 0 then
    none
  else
    {
      let low = 0
      let high = list.len(xs) - 1
      fn search(low: Int, high: Int) -> Option[Int] =
        if low > high then
          none
        else
          {
            let mid = (low + high) / 2
            let mid_val = option.unwrap_or(list.get(xs, mid), -1)
          }
          if mid_val == target then
            some(mid)
          else if mid_val < target then
            search(mid + 1, high)
          else
            search(low, mid - 1)
      ;
      search(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 8:7 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:8:7
  |
8 |       fn search(low: Int, high: Int) -> Option[Int] =
  |       ^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-2.almd:16:14
  in variable mid_val
  hint: Check the variable name
   |
16 |           if mid_val == target then
   |              ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:17:18
  in variable mid
  hint: Check the variable name
   |
17 |             some(mid)
   |                  ^^^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-2.almd:18:19
  in variable mid_val
  hint: Check the variable name
   |
18 |           else if mid_val < target then
   |                   ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:19:20
  in variable mid
  hint: Check the variable name
   |
19 |             search(mid + 1, high)
   |                    ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:19:29
  in call to search()
  hint: Check the function name
   |
19 |             search(mid + 1, high)
   |                             ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:21:25
  in variable mid
  hint: Check the variable name
   |
21 |             search(low, mid - 1)
   |                         ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:21:31
  in call to search()
  hint: Check the function name
   |
21 |             search(low, mid - 1)
   |                               ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:23:19
  in call to search()
  hint: Check the function name
   |
23 |       search(low, high)
   |                   ^^^^
error[E001]: type mismatch in if branches: expected Option[?1] but got Unit
  --> /tmp/dojo-binary-search-2.almd:14:64
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[?1]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[?1]) -> Option[?1] = if cond then step(<update>) else x
   |
14 |             let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                                ^

10 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
  if list.len(xs) == 0 then
    none
  else
    {
      let low = 0
      let high = list.len(xs) - 1
      let rec search(low: Int, high: Int) -> Option[Int] =
        if low > high then
          none
        else
          {
            let mid = (low + high) / 2
            let mid_val = option.unwrap_or(list.get(xs, mid), -1)
            if mid_val == target then
              some(mid)
            else if mid_val < target then
              search(mid + 1, high)
            else
              search(low, mid - 1)
          }
      search(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-3.almd:8:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
8 |       let rec search(low: Int, high: Int) -> Option[Int] =
  |           ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:18:31
  in call to search()
  hint: Check the function name
   |
18 |               search(mid + 1, high)
   |                               ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:20:33
  in call to search()
  hint: Check the function name
   |
20 |               search(low, mid - 1)
   |                                 ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:22:19
  in call to search()
  hint: Check the function name
   |
22 |       search(low, high)
   |                   ^^^^

4 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
