# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  let rec search(low: Int, high: Int) = 
    if low > high then none
    else 
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
      if mid_val == target then some(mid)
      else if mid_val < target then search(mid + 1, high)
      else search(low, mid - 1)
  in search(0, len - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-0.almd:3:7
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
3 |   let rec search(low: Int, high: Int) =
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:6:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |       let mid = (low + high) / 2
  |       ^^^
error: Expected expression at line 11:3 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:11:3
   |
11 |   in search(0, len - 1)
   |   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:7:34
  in variable mid
  hint: Check the variable name
  |
7 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                  ^^^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 3
  --> /tmp/dojo-binary-search-0.almd:7:66
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 3
      option.unwrap_or(<o: Option[A]>, <default: A>)
  |
7 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                                                  ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:8:38
  in variable mid
  hint: Check the variable name
  |
8 |       if mid_val == target then some(mid)
  |                                      ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:9:44
  in variable mid
  hint: Check the variable name
  |
9 |       else if mid_val < target then search(mid + 1, high)
  |                                            ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:9:53
  in variable high
  hint: Check the variable name
  |
9 |       else if mid_val < target then search(mid + 1, high)
  |                                                     ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:9:53
  in call to search()
  hint: Check the function name
  |
9 |       else if mid_val < target then search(mid + 1, high)
  |                                                     ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:10:19
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
10 |       else search(low, mid - 1)
   |                   ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:10:24
  in variable mid
  hint: Check the variable name
   |
10 |       else search(low, mid - 1)
   |                        ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:10:30
  in call to search()
  hint: Check the function name
   |
10 |       else search(low, mid - 1)
   |                              ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Int but got Option[?0]
  --> /tmp/dojo-binary-search-0.almd:7:66
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
  |
7 |       let mid_val = list.get(xs, mid) |> option.unwrap_or(none, -1)
  |                                                                  ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:10:30
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
10 |       else search(low, mid - 1)
   |                              ^

14 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  if len == 0 then none
  else 
    let low = 0
    let high = len - 1
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else 
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid) |> option.unwrap_or(some(-1), -1)
        if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1)
    in search(low, high)
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
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-1.almd:7:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
7 |     let rec search(low: Int, high: Int) =
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:10:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |         let mid = (low + high) / 2
   |         ^^^
error: Expected expression at line 15:5 (got In 'in')
  --> /tmp/dojo-binary-search-1.almd:15:5
   |
15 |     in search(low, high)
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:11:36
  in variable mid
  hint: Check the variable name
   |
11 |         let mid_val = list.get(xs, mid) |> option.unwrap_or(some(-1), -1)
   |                                    ^^^
error[E004]: option.unwrap_or() expects 2 argument(s) but got 3
  --> /tmp/dojo-binary-search-1.almd:11:72
  in call to option.unwrap_or()
  hint: Check the number of arguments
  try:
      // option.unwrap_or() takes 2 arg(s) — you passed 3
      option.unwrap_or(<o: Option[A]>, <default: A>)
   |
11 |         let mid_val = list.get(xs, mid) |> option.unwrap_or(some(-1), -1)
   |                                                                        ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:12:40
  in variable mid
  hint: Check the variable name
   |
12 |         if mid_val == target then some(mid)
   |                                        ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:13:46
  in variable mid
  hint: Check the variable name
   |
13 |         else if mid_val < target then search(mid + 1, high)
   |                                              ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:13:55
  in call to search()
  hint: Check the function name
   |
13 |         else if mid_val < target then search(mid + 1, high)
   |                                                       ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:14:21
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
14 |         else search(low, mid - 1)
   |                     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:14:26
  in variable mid
  hint: Check the variable name
   |
14 |         else search(low, mid - 1)
   |                          ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:14:32
  in call to search()
  hint: Check the function name
   |
14 |         else search(low, mid - 1)
   |                                ^
error[E001]: type mismatch in call to option.unwrap_or(): expected Int but got Option[Int]
  --> /tmp/dojo-binary-search-1.almd:11:72
  in call to option.unwrap_or()
  hint: Fix the expression type or change the expected type
   |
11 |         let mid_val = list.get(xs, mid) |> option.unwrap_or(some(-1), -1)
   |                                                                        ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:14:32
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
14 |         else search(low, mid - 1)
   |                                ^

14 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  if len == 0 then none
  else 
    {
      let low = 0
      let high = len - 1
      fn search(low: Int, high: Int) -> Option[Int] = 
        if low > high then none
        else 
          {
            let mid = (low + high) / 2
            let mid_val = list.get(xs, mid) |> option.unwrap_or(-1)
            if mid_val == target then some(mid)
            else if mid_val < target then search(mid + 1, high)
            else search(low, mid - 1)
          }
      search(low, high)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 8:7 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:8:7
  |
8 |       fn search(low: Int, high: Int) -> Option[Int] =
  |       ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:15:59
  in call to search()
  hint: Check the function name
   |
15 |             else if mid_val < target then search(mid + 1, high)
   |                                                           ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:16:36
  in call to search()
  hint: Check the function name
   |
16 |             else search(low, mid - 1)
   |                                    ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:18:19
  in call to search()
  hint: Check the function name
   |
18 |       search(low, high)
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
  let len = list.len(xs)
  if len == 0 then none
  else 
    let low = 0
    let high = len - 1
    let rec search(low: Int, high: Int) -> Option[Int] = 
      if low > high then none
      else 
        {
          let mid = (low + high) / 2
          let mid_val = list.get(xs, mid) |> option.unwrap_or(-1)
          if mid_val == target then some(mid)
          else if mid_val < target then search(mid + 1, high)
          else search(low, mid - 1)
        }
    search(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let low = 0
  |     ^^^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-3.almd:7:9
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
7 |     let rec search(low: Int, high: Int) -> Option[Int] =
  |         ^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:8:10
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
  |
8 |       if low > high then none
  |          ^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:11:22
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
11 |           let mid = (low + high) / 2
   |                      ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:14:57
  in call to search()
  hint: Check the function name
   |
14 |           else if mid_val < target then search(mid + 1, high)
   |                                                         ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:15:23
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
15 |           else search(low, mid - 1)
   |                       ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:15:34
  in call to search()
  hint: Check the function name
   |
15 |           else search(low, mid - 1)
   |                                  ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:17:12
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
17 |     search(low, high)
   |            ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:17:17
  in call to search()
  hint: Check the function name
   |
17 |     search(low, high)
   |                 ^^^^

9 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
