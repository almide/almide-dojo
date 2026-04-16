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
  if high < 0 then 
    none
  else 
    let rec search(low: Int, high: Int) -> Option[Int] = 
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
  --> /tmp/dojo-binary-search-0.almd:8:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let rec search(low: Int, high: Int) -> Option[Int] =
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:12:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |         let mid = (low + high) / 2
   |         ^^^
error: Expected expression at line 20:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:20:5
   |
20 |     in
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:13:53
  in variable mid
  hint: Check the variable name
   |
13 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:15:16
  in variable mid
  hint: Check the variable name
   |
15 |           some(mid)
   |                ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:17:18
  in variable mid
  hint: Check the variable name
   |
17 |           search(mid + 1, high)
   |                  ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:17:27
  in call to search()
  hint: Check the function name
   |
17 |           search(mid + 1, high)
   |                           ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:19:23
  in variable mid
  hint: Check the variable name
   |
19 |           search(low, mid - 1)
   |                       ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:19:29
  in call to search()
  hint: Check the function name
   |
19 |           search(low, mid - 1)
   |                             ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:21:19
  in call to search()
  hint: Check the function name
   |
21 |       search(low, high)
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
    let rec search(low: Int, high: Int) -> Option[Int] = 
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
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let low = 0
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
      in 
      search(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:8:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
8 |       let rec search(low: Int, high: Int) -> Option[Int] =
  |           ^^^
error: Expected expression at line 22:7 (got In 'in')
  --> /tmp/dojo-binary-search-2.almd:22:7
   |
22 |       in
   |       ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:18:31
  in call to search()
  hint: Check the function name
   |
18 |               search(mid + 1, high)
   |                               ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:20:33
  in call to search()
  hint: Check the function name
   |
20 |               search(low, mid - 1)
   |                                 ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:23:19
  in call to search()
  hint: Check the function name
   |
23 |       search(low, high)
   |                   ^^^^

5 error(s) found
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
    search(0, list.len(xs) - 1)
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 6:5 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:6:5
  |
6 |     fn search(low: Int, high: Int) -> Option[Int] =
  |     ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:7:10
  in variable low
  hint: Check the variable name
  |
7 |       if low > high then
  |          ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:7:16
  in variable high
  hint: Check the variable name
  |
7 |       if low > high then
  |                ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:11:20
  in variable low
  hint: Check the variable name
   |
11 |         let mid = (low + high) / 2
   |                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:11:26
  in variable high
  hint: Check the variable name
   |
11 |         let mid = (low + high) / 2
   |                          ^^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:16:27
  in variable high
  hint: Check the variable name
   |
16 |           search(mid + 1, high)
   |                           ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:16:27
  in call to search()
  hint: Check the function name
   |
16 |           search(mid + 1, high)
   |                           ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:18:18
  in variable low
  hint: Check the variable name
   |
18 |           search(low, mid - 1)
   |                  ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:18:29
  in call to search()
  hint: Check the function name
   |
18 |           search(low, mid - 1)
   |                             ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:20:30
  in call to search()
  hint: Check the function name
   |
20 |     search(0, list.len(xs) - 1)
   |                              ^

10 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
