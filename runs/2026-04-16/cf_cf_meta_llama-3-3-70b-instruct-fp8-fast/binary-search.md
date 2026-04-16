# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs) in
  if len == 0 then 
    none
  else 
    let rec search(low: Int, high: Int) = 
      if low > high then 
        none
      else 
        let mid = (low + high) / 2 in
        let mid_val = option.unwrap_or(list.get(xs, mid), -1) in
        if mid_val == target then 
          some(mid)
        else if mid_val < target then 
          search(mid + 1, high)
        else 
          search(low, mid - 1)
    in 
    search(0, len - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:6:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     let rec search(low: Int, high: Int) =
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:10:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |         let mid = (low + high) / 2 in
   |         ^^^
error: Expected expression at line 18:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:18:5
   |
18 |     in
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:11:53
  in variable mid
  hint: Check the variable name
   |
11 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:13:16
  in variable mid
  hint: Check the variable name
   |
13 |           some(mid)
   |                ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:15:18
  in variable mid
  hint: Check the variable name
   |
15 |           search(mid + 1, high)
   |                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:15:27
  in variable high
  hint: Check the variable name
   |
15 |           search(mid + 1, high)
   |                           ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:15:27
  in call to search()
  hint: Check the function name
   |
15 |           search(mid + 1, high)
   |                           ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:17:18
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
17 |           search(low, mid - 1)
   |                  ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:17:23
  in variable mid
  hint: Check the variable name
   |
17 |           search(low, mid - 1)
   |                       ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:17:29
  in call to search()
  hint: Check the function name
   |
17 |           search(low, mid - 1)
   |                             ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:19:21
  in call to search()
  hint: Check the function name
   |
19 |     search(0, len - 1)
   |                     ^

12 error(s) found
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
    {
      fn search(low: Int, high: Int) -> Option[Int] = 
        if low > high then 
          none
        else 
          let mid = (low + high) / 2 in
          let mid_val = option.unwrap_or(list.get(xs, mid), -1) in
          if mid_val == target then 
            some(mid)
          else if mid_val < target then 
            search(mid + 1, high)
          else 
            search(low, mid - 1)
      search(0, list.len(xs) - 1)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 6:7 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:6:7
  |
6 |       fn search(low: Int, high: Int) -> Option[Int] =
  |       ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:10:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |           let mid = (low + high) / 2 in
   |           ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:11:55
  in variable mid
  hint: Check the variable name
   |
11 |           let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                       ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:13:18
  in variable mid
  hint: Check the variable name
   |
13 |             some(mid)
   |                  ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:15:20
  in variable mid
  hint: Check the variable name
   |
15 |             search(mid + 1, high)
   |                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:15:29
  in variable high
  hint: Check the variable name
   |
15 |             search(mid + 1, high)
   |                             ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:15:29
  in call to search()
  hint: Check the function name
   |
15 |             search(mid + 1, high)
   |                             ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:17:20
  in variable low
  hint: Check the variable name
   |
17 |             search(low, mid - 1)
   |                    ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:17:25
  in variable mid
  hint: Check the variable name
   |
17 |             search(low, mid - 1)
   |                         ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:17:31
  in call to search()
  hint: Check the function name
   |
17 |             search(low, mid - 1)
   |                               ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:18:32
  in call to search()
  hint: Check the function name
   |
18 |       search(0, list.len(xs) - 1)
   |                                ^

11 error(s) found
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
      let rec search(low: Int, high: Int) -> Option[Int] = 
        if low > high then 
          none
        else 
          {
            let mid = (low + high) / 2;
            let mid_val = option.unwrap_or(list.get(xs, mid), -1);
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
Compiling /tmp/dojo-binary-search-2.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:6:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
6 |       let rec search(low: Int, high: Int) -> Option[Int] =
  |           ^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:7:12
  in variable low
  hint: Check the variable name
  |
7 |         if low > high then
  |            ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:7:18
  in variable high
  hint: Check the variable name
  |
7 |         if low > high then
  |                  ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:11:24
  in variable low
  hint: Check the variable name
   |
11 |             let mid = (low + high) / 2;
   |                        ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:11:30
  in variable high
  hint: Check the variable name
   |
11 |             let mid = (low + high) / 2;
   |                              ^^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:16:31
  in variable high
  hint: Check the variable name
   |
16 |               search(mid + 1, high)
   |                               ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:16:31
  in call to search()
  hint: Check the function name
   |
16 |               search(mid + 1, high)
   |                               ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:18:22
  in variable low
  hint: Check the variable name
   |
18 |               search(low, mid - 1)
   |                      ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:18:33
  in call to search()
  hint: Check the function name
   |
18 |               search(low, mid - 1)
   |                                 ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:20:32
  in call to search()
  hint: Check the function name
   |
20 |       search(0, list.len(xs) - 1)
   |                                ^

10 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (PASS)

```almide
fn binary_search_aux(low: Int, high: Int, xs: List[Int], target: Int) -> Option[Int] = 
  if low > high then 
    none
  else 
    {
      let mid = (low + high) / 2;
      let mid_val = option.unwrap_or(list.get(xs, mid), -1);
      if mid_val == target then 
        some(mid)
      else if mid_val < target then 
        binary_search_aux(mid + 1, high, xs, target)
      else 
        binary_search_aux(low, mid - 1, xs, target)
    }

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then 
    none
  else 
    binary_search_aux(0, list.len(xs) - 1, xs, target)
```
