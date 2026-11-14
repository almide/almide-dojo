# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  let low = 0
  let high = len - 1
in
  if len == 0 then none
  else
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid) ?? -1
        let next_low = if mid_val < target then mid + 1 else low
        let next_high = if mid_val > target then mid - 1 else high
      in
        if mid_val == target then some(mid)
        else search(next_low, next_high)
    in search(low, high)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:8:5
  in let-in
  here: let rec search(low: Int, high: Int) =
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |     let rec search(low: Int, high: Int) =
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:11:9
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
11 |         let mid = (low + high) / 2
   |         ^^^
error: Expected expression at line 18:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:18:5
  here: in search(low, high)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
18 |     in search(low, high)
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:12:36
  in variable mid
  here: let mid_val = list.get(xs, mid) ?? -1
  hint: Check the variable name
   |
12 |         let mid_val = list.get(xs, mid) ?? -1
   |                                    ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:13:49
  in variable mid
  here: let next_low = if mid_val < target then mid + 1 else low
  hint: Check the variable name
   |
13 |         let next_low = if mid_val < target then mid + 1 else low
   |                                                 ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:14:50
  in variable mid
  here: let next_high = if mid_val > target then mid - 1 else high
  hint: Check the variable name
   |
14 |         let next_high = if mid_val > target then mid - 1 else high
   |                                                  ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:16:40
  in variable mid
  here: if mid_val == target then some(mid)
  hint: Check the variable name
   |
16 |         if mid_val == target then some(mid)
   |                                        ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:17:14
  in call to search()
  here: else search(next_low, next_high)
  hint: Check the function name
   |
17 |         else search(next_low, next_high)
   |              ^^^^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:17:31
  in fn 'binary_search'
  here: else search(next_low, next_high)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
17 |         else search(next_low, next_high)
   |                               ^^^^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[Unknown])
  --> /tmp/dojo-binary-search-0.almd:16:9
  in this expression with an unconstrained type
  here: if mid_val == target then some(mid)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
16 |         if mid_val == target then some(mid)
   |         ^^

10 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 18:5 (got In 'in')
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-0.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else
    let low = 0
    let high = list.len(xs) - 1
  in
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid) ?? -1
      in
        if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1)
    in search(low, high)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:4:5
  in let-in
  here: let low = 0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let low = 0
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-binary-search-1.almd:4:5
  here: let low = 0
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
4 |     let low = 0
  |     ^

2 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide at line 4:5
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else
    {
      let low = 0
      let high = list.len(xs) - 1
    }
  in
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid) ?? -1
      in
        if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1)
    in search(low, high)
```

**Diagnostic:**

```
error: this indented line is not part of `fn binary_search`: a body without braces is a single expression
  --> /tmp/dojo-binary-search-2.almd:8:3
  in fn body
  here: in
  hint: `fn binary_search` ends after its first expression (line 7), so line 8 is read as a new top-level declaration. To run several statements, wrap the body in braces:
  try:
      fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
        if list.len(xs) == 0 then none
        else
          {
            let low = 0
            let high = list.len(xs) - 1
          }
        in
          let rec search(low: Int, high: Int) =
            if low > high then none
            else
              let mid = (low + high) / 2
              let mid_val = list.get(xs, mid) ?? -1
            in
              if mid_val == target then some(mid)
              else if mid_val < target then search(mid + 1, high)
              else search(low, mid - 1)
          in search(low, high)
      }
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] =
  | ------------- declared here
...
8 |   in
  |   ^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit — Option[Int] is the declared return type, and the branch at line 2 produces it
  --> /tmp/dojo-binary-search-2.almd:4:5
  in if branches
  here: {
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
  |
4 |     {
  |     ^

2 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
  parse error: this indented line is not part of `fn binary_search`: a body without braces is a single expression
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  if list.len(xs) == 0 then none
  else
    let low = 0
    let high = list.len(xs) - 1
  in
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid) ?? -1
      in
        if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1)
    in search(low, high)
}
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:4:5
  in let-in
  here: let low = 0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let low = 0
  |     ^^^
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-3.almd:7:9
  in let rec
  here: let rec search(low: Int, high: Int) =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
7 |     let rec search(low: Int, high: Int) =
  |         ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:10:9
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |         let mid = (low + high) / 2
   |         ^^^
error: Expected expression at line 16:5 (got In 'in')
  --> /tmp/dojo-binary-search-3.almd:16:5
  here: in search(low, high)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |     in search(low, high)
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:11:36
  in variable mid
  here: let mid_val = list.get(xs, mid) ?? -1
  hint: Check the variable name
   |
11 |         let mid_val = list.get(xs, mid) ?? -1
   |                                    ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:13:40
  in variable mid
  here: if mid_val == target then some(mid)
  hint: Check the variable name
   |
13 |         if mid_val == target then some(mid)
   |                                        ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:14:46
  in variable mid
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the variable name
   |
14 |         else if mid_val < target then search(mid + 1, high)
   |                                              ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:14:39
  in call to search()
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the function name
   |
14 |         else if mid_val < target then search(mid + 1, high)
   |                                       ^^^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:15:21
  in variable low
  here: else search(low, mid - 1)
  hint: Check the variable name
   |
15 |         else search(low, mid - 1)
   |                     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:15:26
  in variable mid
  here: else search(low, mid - 1)
  hint: Check the variable name
   |
15 |         else search(low, mid - 1)
   |                          ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:15:14
  in call to search()
  here: else search(low, mid - 1)
  hint: Check the function name
   |
15 |         else search(low, mid - 1)
   |              ^^^^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:15:32
  in fn 'binary_search'
  here: else search(low, mid - 1)
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
15 |         else search(low, mid - 1)
   |                                ^
error[E025]: cannot infer a concrete type for this expression (type Option[Unknown])
  --> /tmp/dojo-binary-search-3.almd:13:9
  in this expression with an unconstrained type
  here: if mid_val == target then some(mid)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
13 |         if mid_val == target then some(mid)
   |         ^^

13 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
  parse error: 'let' is not an expression in Almide
  parse error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
