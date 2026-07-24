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
  in if len == 0 then none
  else 
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else 
        let mid = (low + high) / 2
        in match list.get(xs, mid) {
          some(mid_val) => 
            if mid_val == target then some(mid)
            else if mid_val < target then search(mid + 1, high)
            else search(low, mid - 1)
          none => none
        }
    in search(0, len - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let rec search(low: Int, high: Int) =
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:8:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let mid = (low + high) / 2
  |         ^^^
error: Expected expression at line 14:16 (got FatArrow '=>')
  --> /tmp/dojo-binary-search-0.almd:14:16
   |
14 |           none => none
   |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 15:9 (got RBrace '}')
  --> /tmp/dojo-binary-search-0.almd:15:9
   |
15 |         }
   |         ^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-0.almd:11:16
  in variable mid_val
  hint: Check the variable name
   |
11 |             if mid_val == target then some(mid)
   |                ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:11:44
  in variable mid
  hint: Check the variable name
   |
11 |             if mid_val == target then some(mid)
   |                                            ^^^
error[E003]: undefined variable 'mid_val'
  --> /tmp/dojo-binary-search-0.almd:12:21
  in variable mid_val
  hint: Check the variable name
   |
12 |             else if mid_val < target then search(mid + 1, high)
   |                     ^^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:12:50
  in variable mid
  hint: Check the variable name
   |
12 |             else if mid_val < target then search(mid + 1, high)
   |                                                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:12:59
  in variable high
  hint: Check the variable name
   |
12 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:12:59
  in call to search()
  hint: Check the function name
   |
12 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:13:25
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
13 |             else search(low, mid - 1)
   |                         ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:13:30
  in variable mid
  hint: Check the variable name
   |
13 |             else search(low, mid - 1)
   |                              ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:13:36
  in call to search()
  hint: Check the function name
   |
13 |             else search(low, mid - 1)
   |                                    ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:14:11
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
14 |           none => none
   |           ^^^^

14 error(s) found
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
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else 
        let mid = (low + high) / 2
        in match list.get(xs, mid) {
          some(val) => 
            if val == target then some(mid)
            else if val < target then search(mid + 1, high)
            else search(low, mid - 1)
          none => none
        }
    in search(0, list.len(xs) - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let rec search(low: Int, high: Int) =
  |     ^^^

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
      fn search(low: Int, high: Int) -> Option[Int] = 
        if low > high then none
        else 
          let mid = (low + high) / 2
          in match list.get(xs, mid) {
            some(val) => 
              if val == target then some(mid)
              else if val < target then search(mid + 1, high)
              else search(low, mid - 1)
            none => none
          }
      ; search(0, list.len(xs) - 1)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 5:7 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:5:7
  |
5 |       fn search(low: Int, high: Int) -> Option[Int] =
  |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:8:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |           let mid = (low + high) / 2
  |           ^^^
error: Expected expression at line 14:18 (got FatArrow '=>')
  --> /tmp/dojo-binary-search-2.almd:14:18
   |
14 |             none => none
   |                  ^
error: Semicolons are not used in Almide at line 16:7
  --> /tmp/dojo-binary-search-2.almd:16:7
  hint: Remove the ';'. Almide uses newlines to separate statements.
   |
16 |       ; search(0, list.len(xs) - 1)
   |       ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-2.almd:11:18
  in variable val
  hint: Check the variable name
   |
11 |               if val == target then some(mid)
   |                  ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:11:42
  in variable mid
  hint: Check the variable name
   |
11 |               if val == target then some(mid)
   |                                          ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-2.almd:12:23
  in variable val
  hint: Check the variable name
   |
12 |               else if val < target then search(mid + 1, high)
   |                       ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:12:48
  in variable mid
  hint: Check the variable name
   |
12 |               else if val < target then search(mid + 1, high)
   |                                                ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:12:57
  in variable high
  hint: Check the variable name
   |
12 |               else if val < target then search(mid + 1, high)
   |                                                         ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:12:57
  in call to search()
  hint: Check the function name
   |
12 |               else if val < target then search(mid + 1, high)
   |                                                         ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:13:27
  in variable low
  hint: Check the variable name
   |
13 |               else search(low, mid - 1)
   |                           ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:13:32
  in variable mid
  hint: Check the variable name
   |
13 |               else search(low, mid - 1)
   |                                ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:13:38
  in call to search()
  hint: Check the function name
   |
13 |               else search(low, mid - 1)
   |                                      ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:14:13
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
14 |             none => none
   |             ^^^^

14 error(s) found
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
      fn search(low: Int, high: Int) -> Option[Int] =
        if low > high then none
        else 
          {
            let mid = (low + high) / 2
            let val = option.unwrap_or(list.get(xs, mid), 0)
            if val == target then some(mid)
            else if val < target then search(mid + 1, high)
            else search(low, mid - 1)
          }
      ; 
      search(0, list.len(xs) - 1)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 5:7 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:5:7
  |
5 |       fn search(low: Int, high: Int) -> Option[Int] =
  |       ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:6:12
  in variable low
  hint: Check the variable name
  |
6 |         if low > high then none
  |            ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:6:18
  in variable high
  hint: Check the variable name
  |
6 |         if low > high then none
  |                  ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:9:24
  in variable low
  hint: Check the variable name
  |
9 |             let mid = (low + high) / 2
  |                        ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:9:30
  in variable high
  hint: Check the variable name
  |
9 |             let mid = (low + high) / 2
  |                              ^^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:12:55
  in variable high
  hint: Check the variable name
   |
12 |             else if val < target then search(mid + 1, high)
   |                                                       ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:12:55
  in call to search()
  hint: Check the function name
   |
12 |             else if val < target then search(mid + 1, high)
   |                                                       ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:13:25
  in variable low
  hint: Check the variable name
   |
13 |             else search(low, mid - 1)
   |                         ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:13:36
  in call to search()
  hint: Check the function name
   |
13 |             else search(low, mid - 1)
   |                                    ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:16:32
  in call to search()
  hint: Check the function name
   |
16 |       search(0, list.len(xs) - 1)
   |                                ^

10 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
