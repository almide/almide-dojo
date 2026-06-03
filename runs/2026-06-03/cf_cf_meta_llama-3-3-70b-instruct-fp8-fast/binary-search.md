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
    let len = list.len(xs) in
    if len == 0 then none
    else 
        let rec search(low: Int, high: Int) = 
            if low > high then none
            else 
                let mid = (low + high) / 2 in
                let mid_val = option.unwrap_or(list.get(xs, mid), -1) in
                if mid_val == target then some(mid)
                else if mid_val < target then search(mid + 1, high)
                else search(low, mid - 1)
        in search(0, len - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:5:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |         let rec search(low: Int, high: Int) =
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:8:17
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |                 let mid = (low + high) / 2 in
  |                 ^^^
error: Expected expression at line 13:9 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:13:9
   |
13 |         in search(0, len - 1)
   |         ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:9:61
  in variable mid
  hint: Check the variable name
  |
9 |                 let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  |                                                             ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:10:48
  in variable mid
  hint: Check the variable name
   |
10 |                 if mid_val == target then some(mid)
   |                                                ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:11:54
  in variable mid
  hint: Check the variable name
   |
11 |                 else if mid_val < target then search(mid + 1, high)
   |                                                      ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:11:63
  in variable high
  hint: Check the variable name
   |
11 |                 else if mid_val < target then search(mid + 1, high)
   |                                                               ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:11:63
  in call to search()
  hint: Check the function name
   |
11 |                 else if mid_val < target then search(mid + 1, high)
   |                                                               ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:12:29
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
12 |                 else search(low, mid - 1)
   |                             ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:12:34
  in variable mid
  hint: Check the variable name
   |
12 |                 else search(low, mid - 1)
   |                                  ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:12:40
  in call to search()
  hint: Check the function name
   |
12 |                 else search(low, mid - 1)
   |                                        ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:12:40
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
12 |                 else search(low, mid - 1)
   |                                        ^

12 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    let len = list.len(xs) in
    if len == 0 then none
    else 
        {
            fn search(low: Int, high: Int) -> Option[Int] = 
                if low > high then none
                else 
                    {
                        let mid = (low + high) / 2 in
                        let mid_val = option.unwrap_or(list.get(xs, mid), -1) in
                        if mid_val == target then some(mid)
                        else if mid_val < target then search(mid + 1, high)
                        else search(low, mid - 1)
                    }
            in search(0, len - 1)
        }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 6:13 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:6:13
  |
6 |             fn search(low: Int, high: Int) -> Option[Int] =
  |             ^
error: Expected expression at line 16:13 (got In 'in')
  --> /tmp/dojo-binary-search-1.almd:16:13
   |
16 |             in search(0, len - 1)
   |             ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:7:20
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
  |
7 |                 if low > high then none
  |                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:7:26
  in variable high
  hint: Check the variable name
  |
7 |                 if low > high then none
  |                          ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:10:36
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
10 |                         let mid = (low + high) / 2
   |                                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:10:42
  in variable high
  hint: Check the variable name
   |
10 |                         let mid = (low + high) / 2
   |                                          ^^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:13:71
  in variable high
  hint: Check the variable name
   |
13 |                         else if mid_val < target then search(mid + 1, high)
   |                                                                       ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:13:71
  in call to search()
  hint: Check the function name
   |
13 |                         else if mid_val < target then search(mid + 1, high)
   |                                                                       ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:14:37
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
14 |                         else search(low, mid - 1)
   |                                     ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:14:48
  in call to search()
  hint: Check the function name
   |
14 |                         else search(low, mid - 1)
   |                                                ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:14:48
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
14 |                         else search(low, mid - 1)
   |                                                ^

11 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    let len = list.len(xs) in
    if len == 0 then none
    else 
    {
        let rec search(low: Int, high: Int) -> Option[Int] = 
            if low > high then none
            else 
            {
                let mid = (low + high) / 2 in
                let mid_val = option.unwrap_or(list.get(xs, mid), -1) in
                if mid_val == target then some(mid)
                else if mid_val < target then search(mid + 1, high)
                else search(low, mid - 1)
            }
        in search(0, len - 1) 
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:6:13
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
6 |         let rec search(low: Int, high: Int) -> Option[Int] =
  |             ^^^
error: Expected expression at line 16:9 (got In 'in')
  --> /tmp/dojo-binary-search-2.almd:16:9
   |
16 |         in search(0, len - 1)
   |         ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:7:16
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
  |
7 |             if low > high then none
  |                ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:7:22
  in variable high
  hint: Check the variable name
  |
7 |             if low > high then none
  |                      ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:10:28
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
10 |                 let mid = (low + high) / 2
   |                            ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:10:34
  in variable high
  hint: Check the variable name
   |
10 |                 let mid = (low + high) / 2
   |                                  ^^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:13:63
  in variable high
  hint: Check the variable name
   |
13 |                 else if mid_val < target then search(mid + 1, high)
   |                                                               ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:13:63
  in call to search()
  hint: Check the function name
   |
13 |                 else if mid_val < target then search(mid + 1, high)
   |                                                               ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:14:29
  in variable low
  hint: Did you mean `len`?
  try:
      // low  →  len
      len
   |
14 |                 else search(low, mid - 1)
   |                             ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:14:40
  in call to search()
  hint: Check the function name
   |
14 |                 else search(low, mid - 1)
   |                                        ^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:14:40
  in if branches
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
14 |                 else search(low, mid - 1)
   |                                        ^

11 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
    let len = list.len(xs) in
    if len == 0 then none
    else 
        search(0, len - 1)

fn search(low: Int, high: Int) -> Option[Int] = 
    if low > high then none
    else 
    {
        let mid = (low + high) / 2 in
        let mid_val = option.unwrap_or(list.get(xs, mid), -1) in
        if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1) 
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error[E003]: undefined variable 'xs'
  --> /tmp/dojo-binary-search-3.almd:12:49
  in variable xs
  hint: Check the variable name
   |
12 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                 ^^
error[E003]: undefined variable 'target'
  --> /tmp/dojo-binary-search-3.almd:13:23
  in variable target
  hint: Check the variable name
   |
13 |         if mid_val == target then some(mid)
   |                       ^^^^^^
error[E003]: undefined variable 'target'
  --> /tmp/dojo-binary-search-3.almd:14:27
  in variable target
  hint: Check the variable name
   |
14 |         else if mid_val < target then search(mid + 1, high)
   |                           ^^^^^^

3 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
