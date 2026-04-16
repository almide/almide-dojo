# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    let len = list.len(xs)
    let low = 0
    let high = len - 1
in
    if len == 0 then none
    else 
        let rec search(low: Int, high: Int) = 
            if low > high then none
            else 
                let mid = (low + high) / 2
                let mid_val = option.unwrap_or(list.get(xs, mid), -1)
            in
                if mid_val == target then some(mid)
                else if mid_val < target then search(mid + 1, high)
                else search(low, mid - 1)
    in
        search(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:8:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let rec search(low: Int, high: Int) =
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:11:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |                 let mid = (low + high) / 2
   |                 ^^^
error: Expected expression at line 17:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:17:5
   |
17 |     in
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:12:61
  in variable mid
  hint: Check the variable name
   |
12 |                 let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                             ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:14:48
  in variable mid
  hint: Check the variable name
   |
14 |                 if mid_val == target then some(mid)
   |                                                ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:15:54
  in variable mid
  hint: Check the variable name
   |
15 |                 else if mid_val < target then search(mid + 1, high)
   |                                                      ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:15:63
  in call to search()
  hint: Check the function name
   |
15 |                 else if mid_val < target then search(mid + 1, high)
   |                                                               ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:16:34
  in variable mid
  hint: Check the variable name
   |
16 |                 else search(low, mid - 1)
   |                                  ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:16:40
  in call to search()
  hint: Check the function name
   |
16 |                 else search(low, mid - 1)
   |                                        ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:18:21
  in call to search()
  hint: Check the function name
   |
18 |         search(low, high)
   |                     ^^^^

10 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.len(xs) == 0 then none
    else 
        let low = 0
        let high = list.len(xs) - 1
    in
        let rec search(low: Int, high: Int) = 
            if low > high then none
            else 
                let mid = (low + high) / 2
                let mid_val = option.unwrap_or(list.get(xs, mid), -1)
            in
                if mid_val == target then some(mid)
                else if mid_val < target then search(mid + 1, high)
                else search(low, mid - 1)
    in
        search(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:4:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |         let low = 0
  |         ^^^

1 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.len(xs) == 0 then none
    else 
        {
            let low = 0
            let high = list.len(xs) - 1
            let rec search(low: Int, high: Int) = 
                if low > high then none
                else 
                    {
                        let mid = (low + high) / 2
                        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
                    }
                    in
                        if mid_val == target then some(mid)
                        else if mid_val < target then search(mid + 1, high)
                        else search(low, mid - 1)
            search(low, high)
        }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:7:17
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
7 |             let rec search(low: Int, high: Int) =
  |                 ^^^
error: Expected expression at line 14:21 (got In 'in')
  --> /tmp/dojo-binary-search-2.almd:14:21
   |
14 |                     in
   |                     ^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-2.almd:15:28
  in variable mid_val
  hint: Check the variable name
   |
15 |                         if mid_val == target then some(mid)
   |                            ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:15:56
  in variable mid
  hint: Check the variable name
   |
15 |                         if mid_val == target then some(mid)
   |                                                        ^^^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-2.almd:16:33
  in variable mid_val
  hint: Check the variable name
   |
16 |                         else if mid_val < target then search(mid + 1, high)
   |                                 ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:16:62
  in variable mid
  hint: Check the variable name
   |
16 |                         else if mid_val < target then search(mid + 1, high)
   |                                                              ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:16:71
  in call to search()
  hint: Check the function name
   |
16 |                         else if mid_val < target then search(mid + 1, high)
   |                                                                       ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:17:42
  in variable mid
  hint: Check the variable name
   |
17 |                         else search(low, mid - 1)
   |                                          ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:17:48
  in call to search()
  hint: Check the function name
   |
17 |                         else search(low, mid - 1)
   |                                                ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:18:25
  in call to search()
  hint: Check the function name
   |
18 |             search(low, high)
   |                         ^^^^
error[E001]: type mismatch in if branches: expected Option[?1] but got Unit
  --> /tmp/dojo-binary-search-2.almd:12:76
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[?1]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[?1]) -> Option[?1] = if cond then step(<update>) else x
   |
12 |                         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                                            ^

11 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    if list.len(xs) == 0 then none
    else 
        {
            let low = 0
            let high = list.len(xs) - 1
            fn search(low: Int, high: Int) -> Option[Int] = 
                if low > high then none
                else 
                    {
                        let mid = (low + high) / 2
                        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
                        if mid_val == target then some(mid)
                        else if mid_val < target then search(mid + 1, high)
                        else search(low, mid - 1)
                    }
            search(low, high)
        }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 7:13 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:7:13
  |
7 |             fn search(low: Int, high: Int) -> Option[Int] =
  |             ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:14:71
  in call to search()
  hint: Check the function name
   |
14 |                         else if mid_val < target then search(mid + 1, high)
   |                                                                       ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:15:48
  in call to search()
  hint: Check the function name
   |
15 |                         else search(low, mid - 1)
   |                                                ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:17:25
  in call to search()
  hint: Check the function name
   |
17 |             search(low, high)
   |                         ^^^^

4 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
