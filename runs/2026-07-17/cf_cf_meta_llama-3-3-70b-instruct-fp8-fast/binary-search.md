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
  in if len == 0 then none
  else let rec search(low: Int, high: Int) = 
    if low > high then none
    else let mid = (low + high) / 2
    in match list.get(xs, mid) {
      some(x) => if x == target then some(mid)
      else if x < target then search(mid + 1, high)
      else search(low, mid - 1)
      none => none
    }
  in search(0, len - 1)
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:4:8
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |   else let rec search(low: Int, high: Int) =
  |        ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:6:10
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     else let mid = (low + high) / 2
  |          ^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 12:5 (got RBrace '}')
  --> /tmp/dojo-binary-search-0.almd:12:5
   |
12 |     }
   |     ^
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

4 error(s) found
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
        in 
          match list.get(xs, mid) {
            some(x) => if x == target then some(mid)
            else if x < target then search(mid + 1, high)
            else search(low, mid - 1)
            none => none
          }
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
          in 
            match list.get(xs, mid) {
              some(x) => if x == target then some(mid)
              else if x < target then search(mid + 1, high)
              else search(low, mid - 1)
              none => none
            }
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
  --> /tmp/dojo-binary-search-2.almd:10:32
  in variable mid
  hint: Check the variable name
   |
10 |             match list.get(xs, mid) {
   |                                ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:11:51
  in variable mid
  hint: Check the variable name
   |
11 |               some(x) => if x == target then some(mid)
   |                                                   ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:12:46
  in variable mid
  hint: Check the variable name
   |
12 |               else if x < target then search(mid + 1, high)
   |                                              ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:12:55
  in variable high
  hint: Check the variable name
   |
12 |               else if x < target then search(mid + 1, high)
   |                                                       ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:12:55
  in call to search()
  hint: Check the function name
   |
12 |               else if x < target then search(mid + 1, high)
   |                                                       ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:13:27
  in variable low
  hint: Check the variable name
   |
13 |               else search(low, mid - 1)
   |                           ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:13:32
  in variable mid
  hint: Check the variable name
   |
13 |               else search(low, mid - 1)
   |                                ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:13:38
  in call to search()
  hint: Check the function name
   |
13 |               else search(low, mid - 1)
   |                                      ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:16:32
  in call to search()
  hint: Check the function name
   |
16 |       search(0, list.len(xs) - 1)
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
      let rec search(low: Int, high: Int) -> Option[Int] = 
        if low > high then none
        else 
          let m = (low + high) / 2
          in 
            match list.get(xs, m) {
              some(x) => if x == target then some(m)
              else if x < target then search(m + 1, high)
              else search(low, m - 1)
              none => none
            }
      search(0, list.len(xs) - 1)
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-3.almd:6:11
  in let rec
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
6 |       let rec search(low: Int, high: Int) -> Option[Int] =
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:9:11
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |           let m = (low + high) / 2
  |           ^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-binary-search-3.almd:11:32
  in variable m
  hint: Did you mean `xs`?
  try:
      // m  →  xs
      xs
   |
11 |             match list.get(xs, m) {
   |                                ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-binary-search-3.almd:12:51
  in variable m
  hint: Did you mean `x`?
  try:
      // m  →  x
      x
   |
12 |               some(x) => if x == target then some(m)
   |                                                   ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-binary-search-3.almd:13:46
  in variable m
  hint: Did you mean `x`?
  try:
      // m  →  x
      x
   |
13 |               else if x < target then search(m + 1, high)
   |                                              ^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:13:53
  in variable high
  hint: Check the variable name
   |
13 |               else if x < target then search(m + 1, high)
   |                                                     ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:13:53
  in call to search()
  hint: Check the function name
   |
13 |               else if x < target then search(m + 1, high)
   |                                                     ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:14:27
  in variable low
  hint: Check the variable name
   |
14 |               else search(low, m - 1)
   |                           ^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-binary-search-3.almd:14:32
  in variable m
  hint: Did you mean `x`?
  try:
      // m  →  x
      x
   |
14 |               else search(low, m - 1)
   |                                ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:14:36
  in call to search()
  hint: Check the function name
   |
14 |               else search(low, m - 1)
   |                                    ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:17:32
  in call to search()
  hint: Check the function name
   |
17 |       search(0, list.len(xs) - 1)
   |                                ^

11 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
