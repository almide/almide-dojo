# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

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
        in 
          let mid_val = list.get(xs, mid) ?? -1
          in if mid_val == target then some(mid)
          else if mid_val < target then search(mid + 1, high)
          else search(low, mid - 1)
    in search(0, len - 1)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:5:5
  in let-in
  here: let rec search(low: Int, high: Int) =
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let rec search(low: Int, high: Int) =
  |     ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:8:9
  in let-in
  here: let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
8 |         let mid = (low + high) / 2
  |         ^^^
error: Expected expression at line 14:5 (got In 'in')
  --> /tmp/dojo-binary-search-0.almd:14:5
  here: in search(0, len - 1)
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
14 |     in search(0, len - 1)
   |     ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:10:38
  in variable mid
  here: let mid_val = list.get(xs, mid) ?? -1
  hint: Check the variable name
   |
10 |           let mid_val = list.get(xs, mid) ?? -1
   |                                      ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:11:42
  in variable mid
  here: if mid_val == target then some(mid)
  hint: Check the variable name
   |
11 |           if mid_val == target then some(mid)
   |                                          ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:12:48
  in variable mid
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the variable name
   |
12 |           else if mid_val < target then search(mid + 1, high)
   |                                                ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:12:57
  in variable high
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the variable name
   |
12 |           else if mid_val < target then search(mid + 1, high)
   |                                                         ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:12:41
  in call to search()
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the function name
   |
12 |           else if mid_val < target then search(mid + 1, high)
   |                                         ^^^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:13:23
  in variable low
  here: else search(low, mid - 1)
  hint: Did you mean `len`?
  try:
      len
   |
13 |           else search(low, mid - 1)
   |                       ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:13:28
  in variable mid
  here: else search(low, mid - 1)
  hint: Check the variable name
   |
13 |           else search(low, mid - 1)
   |                            ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-0.almd:13:16
  in call to search()
  here: else search(low, mid - 1)
  hint: Check the function name
   |
13 |           else search(low, mid - 1)
   |                ^^^^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:13:34
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
13 |           else search(low, mid - 1)
   |                                  ^
error[E025]: cannot infer a concrete type for this expression (type Option[Unknown])
  --> /tmp/dojo-binary-search-0.almd:11:11
  in this expression with an unconstrained type
  here: if mid_val == target then some(mid)
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
   |
11 |           if mid_val == target then some(mid)
   |           ^^

13 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
  parse error: 'let' is not an expression in Almide
  parse error: 'let' is not an expression in Almide
  parse error: Expected expression at line 14:5 (got In 'in')
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
    {
      fn search(low: Int, high: Int) -> Option[Int] = 
        if low > high then none
        else 
          {
            let mid = (low + high) / 2
            let mid_val = list.get(xs, mid) ?? -1
            if mid_val == target then some(mid)
            else if mid_val < target then search(mid + 1, high)
            else search(low, mid - 1)
          }
      search(0, list.len(xs) - 1)
    }
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:5:7
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] =
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
5 |       fn search(low: Int, high: Int) -> Option[Int] =
  |       ^^

1 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
  parse error: `fn` cannot be declared inside a function body
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn search(low: Int, high: Int, xs: List[Int], target: Int) -> Option[Int] = 
  if low > high then none
  else 
    {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid) ?? -1
      if mid_val == target then some(mid)
      else if mid_val < target then search(mid + 1, high, xs, target)
      else search(low, mid - 1, xs, target)
    }

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else search(0, list.len(xs) - 1, xs, target)
```
