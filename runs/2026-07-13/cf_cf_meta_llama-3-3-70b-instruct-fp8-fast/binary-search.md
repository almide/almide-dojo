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
  let low = 0 
  let high = list.len(xs) - 1 
  let rec search(low: Int, high: Int) = 
    if low > high then none 
    else 
      let mid = (low + high) / 2 
      let mid_val = option.unwrap_or(list.get(xs, mid), -1) 
      if mid_val == target then some(mid) 
      else if mid_val < target then search(mid + 1, high) 
      else search(low, mid - 1) 
  in search(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-0.almd:4:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |   let rec search(low: Int, high: Int) =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let mid = (low + high) / 2
  |       ^^^
error: Expected expression at line 12:3 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:12:3
   |
12 |   in search(low, high)
   |   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:8:51
  in variable mid
  hint: Check the variable name
  |
8 |       let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                                                   ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:9:38
  in variable mid
  hint: Check the variable name
  |
9 |       if mid_val == target then some(mid)
  |                                      ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:10:44
  in variable mid
  hint: Check the variable name
   |
10 |       else if mid_val < target then search(mid + 1, high)
   |                                            ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:10:53
  in call to search()
  hint: Check the function name
   |
10 |       else if mid_val < target then search(mid + 1, high)
   |                                                     ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:11:24
  in variable mid
  hint: Check the variable name
   |
11 |       else search(low, mid - 1)
   |                        ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:11:30
  in call to search()
  hint: Check the function name
   |
11 |       else search(low, mid - 1)
   |                              ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:11:30
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
11 |       else search(low, mid - 1)
   |                              ^

10 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let low = 0 
  let high = list.len(xs) - 1 
  if low > high then none 
  else 
    let rec search(low: Int, high: Int) = 
      if low > high then none 
      else 
        let mid = (low + high) / 2 
        let mid_val = option.unwrap_or(list.get(xs, mid), -1) 
        if mid_val == target then some(mid) 
        else if mid_val < target then search(mid + 1, high) 
        else search(low, mid - 1) 
    in search(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let rec search(low: Int, high: Int) =
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:9:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |         let mid = (low + high) / 2
  |         ^^^
error: Expected expression at line 14:5 (got In 'in')
  --> /tmp/dojo-binary-search-1.almd:14:5
   |
14 |     in search(low, high)
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:10:53
  in variable mid
  hint: Check the variable name
   |
10 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:11:40
  in variable mid
  hint: Check the variable name
   |
11 |         if mid_val == target then some(mid)
   |                                        ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:12:46
  in variable mid
  hint: Check the variable name
   |
12 |         else if mid_val < target then search(mid + 1, high)
   |                                              ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:12:55
  in call to search()
  hint: Check the function name
   |
12 |         else if mid_val < target then search(mid + 1, high)
   |                                                       ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:13:26
  in variable mid
  hint: Check the variable name
   |
13 |         else search(low, mid - 1)
   |                          ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:13:32
  in call to search()
  hint: Check the function name
   |
13 |         else search(low, mid - 1)
   |                                ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:13:32
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
13 |         else search(low, mid - 1)
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
  {
    let low = 0 
    let high = list.len(xs) - 1 
    if low > high then none 
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
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 8:9 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:8:9
  |
8 |         fn search(low: Int, high: Int) -> Option[Int] =
  |         ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:15:61
  in call to search()
  hint: Check the function name
   |
15 |               else if mid_val < target then search(mid + 1, high)
   |                                                             ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:16:38
  in call to search()
  hint: Check the function name
   |
16 |               else search(low, mid - 1)
   |                                      ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:18:21
  in call to search()
  hint: Check the function name
   |
18 |         search(low, high)
   |                     ^^^^

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
    if low > high then none 
    else 
      {
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
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-3.almd:8:13
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
8 |         let rec search(low: Int, high: Int) -> Option[Int] =
  |             ^^^
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
