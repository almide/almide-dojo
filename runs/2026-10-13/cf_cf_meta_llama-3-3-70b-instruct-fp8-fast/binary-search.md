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
  if len == 0 then 
    none
  else 
    let rec search(low: Int, high: Int) = 
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:9:5
  in let-in
  here: let rec search(low: Int, high: Int) =
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |     let rec search(low: Int, high: Int) =
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:13:9
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
13 |         let mid = (low + high) / 2
   |         ^^^
error: Expected expression at line 21:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:21:5
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
21 |     in
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:14:53
  in variable mid
  here: let mid_val = option.unwrap_or(list.get(xs, mid), -1)
  hint: Check the variable name
   |
14 |         let mid_val = option.unwrap_or(list.get(xs, mid), -1)
   |                                                     ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:16:16
  in variable mid
  here: some(mid)
  hint: Check the variable name
   |
16 |           some(mid)
   |                ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:18:18
  in variable mid
  here: search(mid + 1, high)
  hint: Check the variable name
   |
18 |           search(mid + 1, high)
   |                  ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:18:11
  in call to search()
  here: search(mid + 1, high)
  hint: Check the function name
   |
18 |           search(mid + 1, high)
   |           ^^^^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:20:23
  in variable mid
  here: search(low, mid - 1)
  hint: Check the variable name
   |
20 |           search(low, mid - 1)
   |                       ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:20:11
  in call to search()
  here: search(low, mid - 1)
  hint: Check the function name
   |
20 |           search(low, mid - 1)
   |           ^^^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:22:7
  in call to search()
  here: search(low, high)
  hint: Check the function name
   |
22 |       search(low, high)
   |       ^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[Unknown])
  --> /tmp/dojo-binary-search-0.almd:15:9
  in this expression with an unconstrained type
  here: if mid_val == target then
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
15 |         if mid_val == target then
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
  if list.len(xs) == 0 then 
    none
  else 
    let low = 0
    let high = list.len(xs) - 1
  in 
    { 
      let rec search(low: Int, high: Int) = 
        if low > high then 
          none
        else 
        { 
          let mid = (low + high) / 2
          let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        in 
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:5:5
  in let-in
  here: let low = 0
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let low = 0
  |     ^^^
error: 'let' is not an expression in Almide at line 5:5
  --> /tmp/dojo-binary-search-1.almd:5:5
  here: let low = 0
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
5 |     let low = 0
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
  if list.len(xs) == 0 then 
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
        in 
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
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-2.almd:8:11
  in let rec
  here: let rec search(low: Int, high: Int) =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
8 |       let rec search(low: Int, high: Int) =
  |           ^^^
error: Expected expression at line 23:7 (got In 'in')
  --> /tmp/dojo-binary-search-2.almd:23:7
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 |       in
   |       ^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:19:13
  in call to search()
  here: search(mid + 1, high)
  hint: Check the function name
   |
19 |             search(mid + 1, high)
   |             ^^^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:21:13
  in call to search()
  here: search(low, mid - 1)
  hint: Check the function name
   |
21 |             search(low, mid - 1)
   |             ^^^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:24:9
  in call to search()
  here: search(low, high)
  hint: Check the function name
   |
24 |         search(low, high)
   |         ^^^^^^

5 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then 
    none
  else 
    {
      let low = 0
      let high = list.len(xs) - 1
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
      in 
        search(low, high)
    }
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-3.almd:8:7
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] =
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
8 |       fn search(low: Int, high: Int) -> Option[Int] =
  |       ^^
error: Expected expression at line 22:7 (got In 'in')
  --> /tmp/dojo-binary-search-3.almd:22:7
  here: in
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
22 |       in
   |       ^

2 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
