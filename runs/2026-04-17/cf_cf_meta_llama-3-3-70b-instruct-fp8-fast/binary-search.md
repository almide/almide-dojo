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
    if len == 0 then 
        none
    else 
        let 
            (low, high) = (0, len - 1)
            search = (low, high) => 
                if low > high then 
                    none
                else 
                    let mid = (low + high) / 2
                    in 
                        case list.get(xs, mid) of 
                            some(val) => 
                                if val == target then 
                                    some(mid)
                                else if val < target then 
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
  --> /tmp/dojo-binary-search-0.almd:6:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |         let
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:12:21
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
12 |                     let mid = (low + high) / 2
   |                     ^^^
error: Expected expression at line 15:39 (got FatArrow '=>')
  --> /tmp/dojo-binary-search-0.almd:15:39
   |
15 |                             some(val) =>
   |                                       ^
error: Expected expression at line 22:9 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:22:9
   |
22 |         in
   |         ^
error[E003]: undefined variable 'case'
  --> /tmp/dojo-binary-search-0.almd:14:25
  in variable case
  hint: Check the variable name
   |
14 |                         case list.get(xs, mid) of
   |                         ^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:14:43
  in variable mid
  hint: Check the variable name
   |
14 |                         case list.get(xs, mid) of
   |                                           ^^^
error[E003]: undefined variable 'of'
  --> /tmp/dojo-binary-search-0.almd:14:48
  in variable of
  hint: Did you mean `xs`?
  try:
      // of  →  xs
      xs
   |
14 |                         case list.get(xs, mid) of
   |                                                ^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-0.almd:15:34
  in variable val
  hint: Check the variable name
   |
15 |                             some(val) =>
   |                                  ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-0.almd:16:36
  in variable val
  hint: Check the variable name
   |
16 |                                 if val == target then
   |                                    ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:17:42
  in variable mid
  hint: Check the variable name
   |
17 |                                     some(mid)
   |                                          ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-0.almd:18:41
  in variable val
  hint: Check the variable name
   |
18 |                                 else if val < target then
   |                                         ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:19:44
  in variable mid
  hint: Check the variable name
   |
19 |                                     search(mid + 1, high)
   |                                            ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:19:53
  in variable high
  hint: Check the variable name
   |
19 |                                     search(mid + 1, high)
   |                                                     ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:19:53
  in call to search()
  hint: Check the function name
   |
19 |                                     search(mid + 1, high)
   |                                                     ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:21:44
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
21 |                                     search(low, mid - 1)
   |                                            ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:21:49
  in variable mid
  hint: Check the variable name
   |
21 |                                     search(low, mid - 1)
   |                                                 ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:21:55
  in call to search()
  hint: Check the function name
   |
21 |                                     search(low, mid - 1)
   |                                                       ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:23:20
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
23 |             search(low, high)
   |                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:23:25
  in variable high
  hint: Check the variable name
   |
23 |             search(low, high)
   |                         ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:23:25
  in call to search()
  hint: Check the function name
   |
23 |             search(low, high)
   |                         ^^^^

20 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    let len = list.len(xs)
    in 
        if len == 0 then 
            none
        else 
            let (low, high) = (0, len - 1)
            in 
                let rec search = (low, high) => 
                    if low > high then 
                        none
                    else 
                        let mid = (low + high) / 2
                        in 
                            match list.get(xs, mid) with 
                                some(val) => 
                                    if val == target then 
                                        some(mid)
                                    else if val < target then 
                                        search(mid + 1, high)
                                    else 
                                        search(low, mid - 1)
                                | none => none
                in 
                    search(low, high)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:7:13
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
7 |             let (low, high) = (0, len - 1)
  |             ^^^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-1.almd:9:21
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
9 |                 let rec search = (low, high) =>
  |                     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:13:25
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |                         let mid = (low + high) / 2
   |                         ^^^
error: Expected LBrace at line 15:53 (got Ident 'with')
  --> /tmp/dojo-binary-search-1.almd:15:53
   |
15 |                             match list.get(xs, mid) with
   |                                                     ^
error: Expected expression at line 23:33 (got Pipe '|')
  --> /tmp/dojo-binary-search-1.almd:23:33
   |
23 |                                 | none => none
   |                                 ^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-1.almd:17:40
  in variable val
  hint: Check the variable name
   |
17 |                                     if val == target then
   |                                        ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:18:46
  in variable mid
  hint: Check the variable name
   |
18 |                                         some(mid)
   |                                              ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-1.almd:19:45
  in variable val
  hint: Check the variable name
   |
19 |                                     else if val < target then
   |                                             ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:20:48
  in variable mid
  hint: Check the variable name
   |
20 |                                         search(mid + 1, high)
   |                                                ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:20:57
  in variable high
  hint: Check the variable name
   |
20 |                                         search(mid + 1, high)
   |                                                         ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:20:57
  in call to search()
  hint: Check the function name
   |
20 |                                         search(mid + 1, high)
   |                                                         ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:22:48
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
22 |                                         search(low, mid - 1)
   |                                                ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:22:53
  in variable mid
  hint: Check the variable name
   |
22 |                                         search(low, mid - 1)
   |                                                     ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:22:59
  in call to search()
  hint: Check the function name
   |
22 |                                         search(low, mid - 1)
   |                                                           ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:25:28
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
25 |                     search(low, high)
   |                            ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:25:33
  in variable high
  hint: Check the variable name
   |
25 |                     search(low, high)
   |                                 ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:25:33
  in call to search()
  hint: Check the function name
   |
25 |                     search(low, high)
   |                                 ^^^^

17 error(s) found
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
        fn search(low: Int, high: Int) -> Option[Int] = 
            if low > high then 
                none
            else 
                let mid = (low + high) / 2
                in 
                    match list.get(xs, mid) with 
                        some(val) => 
                            if val == target then 
                                some(mid)
                            else if val < target then 
                                search(mid + 1, high)
                            else 
                                search(low, mid - 1)
                        | none => none
        in 
            search(0, list.len(xs) - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 5:9 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:5:9
  |
5 |         fn search(low: Int, high: Int) -> Option[Int] =
  |         ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:9:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |                 let mid = (low + high) / 2
  |                 ^^^

2 error(s) found
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
                        in 
                            match list.get(xs, mid) with 
                                some(val) => 
                                    if val == target then 
                                        some(mid)
                                    else if val < target then 
                                        search(mid + 1, high)
                                    else 
                                        search(low, mid - 1)
                                | none => none
                    }
            in 
                search(0, list.len(xs) - 1)
        }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 6:13 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:6:13
  |
6 |             fn search(low: Int, high: Int) -> Option[Int] =
  |             ^
error: Expected LBrace at line 13:53 (got Ident 'with')
  --> /tmp/dojo-binary-search-3.almd:13:53
   |
13 |                             match list.get(xs, mid) with
   |                                                     ^
error: Expected expression at line 21:33 (got Pipe '|')
  --> /tmp/dojo-binary-search-3.almd:21:33
   |
21 |                                 | none => none
   |                                 ^
error: Expected expression at line 23:13 (got In 'in')
  --> /tmp/dojo-binary-search-3.almd:23:13
   |
23 |             in
   |             ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:7:20
  in variable low
  hint: Check the variable name
  |
7 |                 if low > high then
  |                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:7:26
  in variable high
  hint: Check the variable name
  |
7 |                 if low > high then
  |                          ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:11:36
  in variable low
  hint: Check the variable name
   |
11 |                         let mid = (low + high) / 2
   |                                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:11:42
  in variable high
  hint: Check the variable name
   |
11 |                         let mid = (low + high) / 2
   |                                          ^^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-3.almd:15:40
  in variable val
  hint: Check the variable name
   |
15 |                                     if val == target then
   |                                        ^^^
error[E003]: undefined variable 'val'
  --> /tmp/dojo-binary-search-3.almd:17:45
  in variable val
  hint: Check the variable name
   |
17 |                                     else if val < target then
   |                                             ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:18:57
  in variable high
  hint: Check the variable name
   |
18 |                                         search(mid + 1, high)
   |                                                         ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:18:57
  in call to search()
  hint: Check the function name
   |
18 |                                         search(mid + 1, high)
   |                                                         ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:20:48
  in variable low
  hint: Check the variable name
   |
20 |                                         search(low, mid - 1)
   |                                                ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:20:59
  in call to search()
  hint: Check the function name
   |
20 |                                         search(low, mid - 1)
   |                                                           ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:24:42
  in call to search()
  hint: Check the function name
   |
24 |                 search(0, list.len(xs) - 1)
   |                                          ^
error[E001]: type mismatch in if branches: expected Option[?1] but got Unit
  --> /tmp/dojo-binary-search-3.almd:20:59
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[?1]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[?1]) -> Option[?1] = if cond then step(<update>) else x
   |
20 |                                         search(low, mid - 1)
   |                                                           ^

16 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
