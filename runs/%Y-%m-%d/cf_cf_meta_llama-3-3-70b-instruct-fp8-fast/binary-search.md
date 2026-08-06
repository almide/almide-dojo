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
  {
    let len = list.len(xs)
    if len == 0 then 
      none
    else 
      let low = 0
      let high = len - 1
      let rec search(low: Int, high: Int) = 
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
      in 
        search(low, high)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:7:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |       let low = 0
  |       ^^^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-1.almd:9:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
9 |       let rec search(low: Int, high: Int) =
  |           ^^^
error: Expected expression at line 23:7 (got In 'in')
  --> /tmp/dojo-binary-search-1.almd:23:7
   |
23 |       in
   |       ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:10:12
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
10 |         if low > high then
   |            ^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:14:24
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
14 |             let mid = (low + high) / 2
   |                        ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:19:31
  in call to search()
  hint: Check the function name
   |
19 |               search(mid + 1, high)
   |                               ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:21:22
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
21 |               search(low, mid - 1)
   |                      ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:21:33
  in call to search()
  hint: Check the function name
   |
21 |               search(low, mid - 1)
   |                                 ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:24:16
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
24 |         search(low, high)
   |                ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:24:21
  in call to search()
  hint: Check the function name
   |
24 |         search(low, high)
   |                     ^^^^

10 error(s) found
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
      let len = list.len(xs)
      let low = 0
      let high = len - 1
      fn search(low: Int, high: Int) -> Option[Int] = 
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
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 9:7 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:9:7
  |
9 |       fn search(low: Int, high: Int) -> Option[Int] =
  |       ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:19:31
  in call to search()
  hint: Check the function name
   |
19 |               search(mid + 1, high)
   |                               ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:21:33
  in call to search()
  hint: Check the function name
   |
21 |               search(low, mid - 1)
   |                                 ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:23:19
  in call to search()
  hint: Check the function name
   |
23 |       search(low, high)
   |                   ^^^^

4 error(s) found
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
      let len = list.len(xs)
      let low = 0
      let high = len - 1
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
  --> /tmp/dojo-binary-search-3.almd:9:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
9 |       let rec search(low: Int, high: Int) -> Option[Int] =
  |           ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:19:31
  in call to search()
  hint: Check the function name
   |
19 |               search(mid + 1, high)
   |                               ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:21:33
  in call to search()
  hint: Check the function name
   |
21 |               search(low, mid - 1)
   |                                 ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:23:19
  in call to search()
  hint: Check the function name
   |
23 |       search(low, high)
   |                   ^^^^

4 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
