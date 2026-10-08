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
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1)
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
error: Expected expression at line 16:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:16:5
  here: in search(low, high)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
16 |     in search(low, high)
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:12:53
  in variable mid
  here: let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  hint: Check the variable name
   |
12 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:13:40
  in variable mid
  here: if mid_val == target then some(mid)
  hint: Check the variable name
   |
13 |         if mid_val == target then some(mid)
   |                                        ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:14:46
  in variable mid
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the variable name
   |
14 |         else if mid_val < target then search(mid + 1, high)
   |                                              ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:14:39
  in call to search()
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the function name
   |
14 |         else if mid_val < target then search(mid + 1, high)
   |                                       ^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:15:26
  in variable mid
  here: else search(low, mid - 1)
  hint: Check the variable name
   |
15 |         else search(low, mid - 1)
   |                          ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:15:14
  in call to search()
  here: else search(low, mid - 1)
  hint: Check the function name
   |
15 |         else search(low, mid - 1)
   |              ^^^^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:15:32
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
  --> /tmp/dojo-binary-search-0.almd:13:9
  in this expression with an unconstrained type
  here: if mid_val == target then some(mid)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
13 |         if mid_val == target then some(mid)
   |         ^^

11 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
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
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else
        let mid = (low + high) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1)
    in 
      search(low, high)
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
      let rec search(low: Int, high: Int) = 
        if low > high then none
        else
          let mid = (low + high) / 2
          let mid_val = option.unwrap_or(list.get(xs, mid), -1)
          if mid_val == target then some(mid)
          else if mid_val < target then search(mid + 1, high)
          else search(low, mid - 1)
      in 
        search(low, high)
    }
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:7:11
  in let rec
  here: let rec search(low: Int, high: Int) =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
7 |       let rec search(low: Int, high: Int) =
  |           ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:10:11
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |           let mid = (low + high) / 2
   |           ^^^
error: Expected expression at line 15:7 (got In 'in')
  --> /tmp/dojo-binary-search-2.almd:15:7
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
15 |       in
   |       ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:11:55
  in variable mid
  here: let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  hint: Check the variable name
   |
11 |           let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                       ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:12:42
  in variable mid
  here: if mid_val == target then some(mid)
  hint: Check the variable name
   |
12 |           if mid_val == target then some(mid)
   |                                          ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:13:48
  in variable mid
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the variable name
   |
13 |           else if mid_val < target then search(mid + 1, high)
   |                                                ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:13:41
  in call to search()
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the function name
   |
13 |           else if mid_val < target then search(mid + 1, high)
   |                                         ^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:14:28
  in variable mid
  here: else search(low, mid - 1)
  hint: Check the variable name
   |
14 |           else search(low, mid - 1)
   |                            ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:14:16
  in call to search()
  here: else search(low, mid - 1)
  hint: Check the function name
   |
14 |           else search(low, mid - 1)
   |                ^^^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:16:9
  in call to search()
  here: search(low, high)
  hint: Check the function name
   |
16 |         search(low, high)
   |         ^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[Unknown])
  --> /tmp/dojo-binary-search-2.almd:12:11
  in this expression with an unconstrained type
  here: if mid_val == target then some(mid)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
12 |           if mid_val == target then some(mid)
   |           ^^

11 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else
    {
      let low = 0
      let high = list.len(xs) - 1
      fn search(low: Int, high: Int) -> Option[Int] = 
        if low > high then none
        else
          {
            let mid = (low + high) / 2
            let mid_val = option.unwrap_or(list.get(xs, mid), -1)
            if mid_val == target then some(mid)
            else if mid_val < target then search(mid + 1, high)
            else search(low, mid - 1)
          }
      in 
        search(low, high)
    }
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-3.almd:7:7
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] =
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
7 |       fn search(low: Int, high: Int) -> Option[Int] =
  |       ^^
error: Expected expression at line 17:7 (got In 'in')
  --> /tmp/dojo-binary-search-3.almd:17:7
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
17 |       in
   |       ^

2 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
