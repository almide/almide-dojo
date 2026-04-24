# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0
  let high = list.len(xs) - 1
  in
  if high < 0 then none
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
    in search(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:7:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |     let rec search(low: Int, high: Int) =
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:10:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |         let mid = (low + high) / 2
   |         ^^^
error: Expected expression at line 16:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:16:5
   |
16 |     in search(low, high)
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:11:53
  in variable mid
  hint: Check the variable name
   |
11 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:13:40
  in variable mid
  hint: Check the variable name
   |
13 |         if mid_val == target then some(mid)
   |                                        ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:14:46
  in variable mid
  hint: Check the variable name
   |
14 |         else if mid_val < target then search(mid + 1, high)
   |                                              ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:14:55
  in call to search()
  hint: Check the function name
   |
14 |         else if mid_val < target then search(mid + 1, high)
   |                                                       ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:15:26
  in variable mid
  hint: Check the variable name
   |
15 |         else search(low, mid - 1)
   |                          ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:15:32
  in call to search()
  hint: Check the function name
   |
15 |         else search(low, mid - 1)
   |                                ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:15:32
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
15 |         else search(low, mid - 1)
   |                                ^

10 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  {
    let low = 0
    let high = list.len(xs) - 1
    if high < 0 then none
    else 
      {
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
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 8:9 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:8:9
  |
8 |         fn search(low: Int, high: Int) -> Option[Int] =
  |         ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:15:61
  in call to search()
  hint: Check the function name
   |
15 |               else if mid_val < target then search(mid + 1, high)
   |                                                             ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:16:38
  in call to search()
  hint: Check the function name
   |
16 |               else search(low, mid - 1)
   |                                      ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:18:21
  in call to search()
  hint: Check the function name
   |
18 |         search(low, high)
   |                     ^^^^

4 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0
  let high = list.len(xs) - 1
  if high < 0 then none
  else 
    let rec search(low: Int, high: Int) -> Option[Int] = 
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
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let rec search(low: Int, high: Int) -> Option[Int] =
  |     ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:13:57
  in call to search()
  hint: Check the function name
   |
13 |           else if mid_val < target then search(mid + 1, high)
   |                                                         ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:14:34
  in call to search()
  hint: Check the function name
   |
14 |           else search(low, mid - 1)
   |                                  ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:16:17
  in call to search()
  hint: Check the function name
   |
16 |     search(low, high)
   |                 ^^^^

4 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  {
    let low = 0
    let high = list.len(xs) - 1
    if high < 0 then none
    else 
      {
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
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 8:9 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:8:9
  |
8 |         fn search(low: Int, high: Int) -> Option[Int] =
  |         ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:15:61
  in call to search()
  hint: Check the function name
   |
15 |               else if mid_val < target then search(mid + 1, high)
   |                                                             ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:16:38
  in call to search()
  hint: Check the function name
   |
16 |               else search(low, mid - 1)
   |                                      ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:18:21
  in call to search()
  hint: Check the function name
   |
18 |         search(low, high)
   |                     ^^^^

4 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
