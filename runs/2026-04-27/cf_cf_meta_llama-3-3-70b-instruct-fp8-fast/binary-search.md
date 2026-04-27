# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.is_empty(xs) then 
    none
  else 
    let 
      low = 0
      high = list.len(xs) - 1
    in 
      let rec search(low: Int, high: Int) = 
        if low > high then 
          none
        else 
          let 
            mid = (low + high) / 2
            mid_val = option.unwrap_or(list.get(xs, mid), -1)
          in 
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
  --> /tmp/dojo-binary-search-0.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let
  |     ^^^

1 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.is_empty(xs) then 
    none
  else 
    {
      let low = 0
      let high = list.len(xs) - 1
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
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-1.almd:8:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
8 |       let rec search(low: Int, high: Int) =
  |           ^^^
error: Expected expression at line 22:7 (got In 'in')
  --> /tmp/dojo-binary-search-1.almd:22:7
   |
22 |       in
   |       ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:18:31
  in call to search()
  hint: Check the function name
   |
18 |               search(mid + 1, high)
   |                               ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:20:33
  in call to search()
  hint: Check the function name
   |
20 |               search(low, mid - 1)
   |                                 ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:23:21
  in call to search()
  hint: Check the function name
   |
23 |         search(low, high)
   |                     ^^^^

5 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn search(low: Int, high: Int, xs: List[Int], target: Int) -> Option[Int] = 
  if low > high then 
    none
  else 
    {
      let mid = (low + high) / 2
      let mid_val = option.unwrap_or(list.get(xs, mid), -1)
      if mid_val == target then 
        some(mid)
      else if mid_val < target then 
        search(mid + 1, high, xs, target)
      else 
        search(low, mid - 1, xs, target)
    }

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.is_empty(xs) then 
    none
  else 
    search(0, list.len(xs) - 1, xs, target)
```
