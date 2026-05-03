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
        in let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        in if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1)
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
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:2:22
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
2 |   let len = list.len(xs)
  |                      ^^

3 error(s) found
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
      search(0, list.len(xs) - 1)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 5:7 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:5:7
  |
5 |       fn search(low: Int, high: Int) -> Option[Int] =
  |       ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:6:12
  in variable low
  hint: Check the variable name
  |
6 |         if low > high then none
  |            ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:6:18
  in variable high
  hint: Check the variable name
  |
6 |         if low > high then none
  |                  ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:9:24
  in variable low
  hint: Check the variable name
  |
9 |             let mid = (low + high) / 2
  |                        ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:9:30
  in variable high
  hint: Check the variable name
  |
9 |             let mid = (low + high) / 2
  |                              ^^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:12:59
  in variable high
  hint: Check the variable name
   |
12 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:12:59
  in call to search()
  hint: Check the function name
   |
12 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:13:25
  in variable low
  hint: Check the variable name
   |
13 |             else search(low, mid - 1)
   |                         ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:13:36
  in call to search()
  hint: Check the function name
   |
13 |             else search(low, mid - 1)
   |                                    ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:15:32
  in call to search()
  hint: Check the function name
   |
15 |       search(0, list.len(xs) - 1)
   |                                ^

10 error(s) found
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
    search(0, list.len(xs) - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let rec search(low: Int, high: Int) -> Option[Int] =
  |     ^^^

1 error(s) found
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
            let mid_val = option.unwrap_or(list.get(xs, mid), -1)
            if mid_val == target then some(mid)
            else if mid_val < target then search(mid + 1, high)
            else search(low, mid - 1)
          }
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
  --> /tmp/dojo-binary-search-3.almd:12:59
  in variable high
  hint: Check the variable name
   |
12 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:12:59
  in call to search()
  hint: Check the function name
   |
12 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
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
  --> /tmp/dojo-binary-search-3.almd:15:32
  in call to search()
  hint: Check the function name
   |
15 |       search(0, list.len(xs) - 1)
   |                                ^

10 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
