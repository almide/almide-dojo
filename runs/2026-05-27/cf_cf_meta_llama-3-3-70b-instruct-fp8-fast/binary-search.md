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
  in if len == 0 then none
  else 
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else 
        let mid = (low + high) / 2
        in if option.is_none(list.get(xs, mid)) then none
        else 
          let mid_val = option.unwrap_or(list.get(xs, mid), -1)
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
error: Expected expression at line 15:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:15:5
   |
15 |     in search(0, len - 1)
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:11:55
  in variable mid
  hint: Check the variable name
   |
11 |           let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                       ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:12:42
  in variable mid
  hint: Check the variable name
   |
12 |           if mid_val == target then some(mid)
   |                                          ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:13:48
  in variable mid
  hint: Check the variable name
   |
13 |           else if mid_val < target then search(mid + 1, high)
   |                                                ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:13:57
  in variable high
  hint: Check the variable name
   |
13 |           else if mid_val < target then search(mid + 1, high)
   |                                                         ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:13:57
  in call to search()
  hint: Check the function name
   |
13 |           else if mid_val < target then search(mid + 1, high)
   |                                                         ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:14:23
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
14 |           else search(low, mid - 1)
   |                       ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:14:28
  in variable mid
  hint: Check the variable name
   |
14 |           else search(low, mid - 1)
   |                            ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:14:34
  in call to search()
  hint: Check the function name
   |
14 |           else search(low, mid - 1)
   |                                  ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:14:34
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
14 |           else search(low, mid - 1)
   |                                  ^

12 error(s) found
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
        in if option.is_none(list.get(xs, mid)) then none
        else 
          let mid_val = option.unwrap_or(list.get(xs, mid), -1)
          in if mid_val == target then some(mid)
          else if mid_val < target then search(mid + 1, high)
          else search(low, mid - 1)
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
          in if option.is_none(list.get(xs, mid)) then none
          else 
            let mid_val = option.unwrap_or(list.get(xs, mid), -1)
            in if mid_val == target then some(mid)
            else if mid_val < target then search(mid + 1, high)
            else search(low, mid - 1)
      search(0, list.len(xs) - 1)
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
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:11:57
  in variable mid
  hint: Check the variable name
   |
11 |             let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                         ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:12:44
  in variable mid
  hint: Check the variable name
   |
12 |             if mid_val == target then some(mid)
   |                                            ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:13:50
  in variable mid
  hint: Check the variable name
   |
13 |             else if mid_val < target then search(mid + 1, high)
   |                                                  ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:13:59
  in variable high
  hint: Check the variable name
   |
13 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:13:59
  in call to search()
  hint: Check the function name
   |
13 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:14:25
  in variable low
  hint: Check the variable name
   |
14 |             else search(low, mid - 1)
   |                         ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:14:30
  in variable mid
  hint: Check the variable name
   |
14 |             else search(low, mid - 1)
   |                              ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:14:36
  in call to search()
  hint: Check the function name
   |
14 |             else search(low, mid - 1)
   |                                    ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:15:32
  in call to search()
  hint: Check the function name
   |
15 |       search(0, list.len(xs) - 1)
   |                                ^

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
      let mid = (0 + list.len(xs) - 1) / 2
      let low = 0
      let high = list.len(xs) - 1
      let rec search(low: Int, high: Int) -> Option[Int] = 
        if low > high then none
        else 
          let mid = (low + high) / 2
          in if option.is_none(list.get(xs, mid)) then none
          else 
            let mid_val = option.unwrap_or(list.get(xs, mid), -1)
            in if mid_val == target then some(mid)
            else if mid_val < target then search(mid + 1, high)
            else search(low, mid - 1)
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:11:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |           let mid = (low + high) / 2
   |           ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:16:59
  in call to search()
  hint: Check the function name
   |
16 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:17:36
  in call to search()
  hint: Check the function name
   |
17 |             else search(low, mid - 1)
   |                                    ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:18:19
  in call to search()
  hint: Check the function name
   |
18 |       search(low, high)
   |                   ^^^^

5 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
