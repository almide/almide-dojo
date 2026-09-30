# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **state**: `measured`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  let len = list.len(xs)
  in if len == 0 then none
  else let rec search(low: Int, high: Int) = 
    if low > high then none
    else let mid = (low + high) / 2
         in let mid_val = option.unwrap_or(list.get(xs, mid), -1)
            in if mid_val == target then some(mid)
               else if mid_val < target then search(mid + 1, high)
               else search(low, mid - 1)
  in search(0, len - 1)
```

**Diagnostic:**

```
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:4:8
  in let-in
  here: else let rec search(low: Int, high: Int) =
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |   else let rec search(low: Int, high: Int) =
  |        ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:6:10
  in let-in
  here: else let mid = (low + high) / 2
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
6 |     else let mid = (low + high) / 2
  |          ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:2:22
  in fn 'binary_search'
  here: let len = list.len(xs)
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

3 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else {
    let rec search(low: Int, high: Int) = 
      if low > high then none
      else {
        let mid = (low + high) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
        if mid_val == target then some(mid)
        else if mid_val < target then search(mid + 1, high)
        else search(low, mid - 1)
      }
    search(0, list.len(xs) - 1)
  }
```

**Diagnostic:**

```
error: `let rec` is OCaml/SML syntax; Almide functions are recursive by default
  --> /tmp/dojo-binary-search-1.almd:4:9
  in let rec
  here: let rec search(low: Int, high: Int) =
  hint: Define recursive functions at top level: `fn name(args) -> ReturnType = body`. Almide has no `let rec` — call the fn directly, including from its own body.
  try:
      fn fact(n: Int) -> Int =
          if n == 0 then 1 else n * fact(n - 1)
  |
4 |     let rec search(low: Int, high: Int) =
  |         ^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:5:10
  in variable low
  here: if low > high then none
  hint: Check the variable name
  |
5 |       if low > high then none
  |          ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:5:16
  in variable high
  here: if low > high then none
  hint: Check the variable name
  |
5 |       if low > high then none
  |                ^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:7:20
  in variable low
  here: let mid = (low + high) / 2
  hint: Check the variable name
  |
7 |         let mid = (low + high) / 2
  |                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:7:26
  in variable high
  here: let mid = (low + high) / 2
  hint: Check the variable name
  |
7 |         let mid = (low + high) / 2
  |                          ^^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:10:55
  in variable high
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the variable name
   |
10 |         else if mid_val < target then search(mid + 1, high)
   |                                                       ^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:10:39
  in call to search()
  here: else if mid_val < target then search(mid + 1, high)
  hint: Check the function name
   |
10 |         else if mid_val < target then search(mid + 1, high)
   |                                       ^^^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:11:21
  in variable low
  here: else search(low, mid - 1)
  hint: Check the variable name
   |
11 |         else search(low, mid - 1)
   |                     ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:11:14
  in call to search()
  here: else search(low, mid - 1)
  hint: Check the function name
   |
11 |         else search(low, mid - 1)
   |              ^^^^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-1.almd:13:5
  in call to search()
  here: search(0, list.len(xs) - 1)
  hint: Check the function name
   |
13 |     search(0, list.len(xs) - 1)
   |     ^^^^^^
error[E025]: cannot infer a concrete type for this expression (type Option[Unknown])
  --> /tmp/dojo-binary-search-1.almd:5:7
  in this expression with an unconstrained type
  here: if low > high then none
  hint: Bind the expression to an explicitly-typed `let`, e.g. `let r: Option[Int] = ...`, so the unconstrained slot is pinned. An unconstrained type slot cannot be inferred and is never silently defaulted (Almide follows Rust/Swift; cf. Rust E0282).
  |
5 |       if low > high then none
  |       ^^

11 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else {
    fn search(low: Int, high: Int) -> Option[Int] = 
      if low > high then none
      else {
        let mid = (low + high) / 2
        let mid_val = option.unwrap_or(list.get(xs, mid), -1)
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
  --> /tmp/dojo-binary-search-2.almd:4:5
  in nested fn
  here: fn search(low: Int, high: Int) -> Option[Int] =
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
4 |     fn search(low: Int, high: Int) -> Option[Int] =
  |     ^^

1 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn search(low: Int, high: Int, xs: List[Int], target: Int) -> Option[Int] = 
  if low > high then none
  else {
    let mid = (low + high) / 2
    let mid_val = option.unwrap_or(list.get(xs, mid), -1)
    if mid_val == target then some(mid)
    else if mid_val < target then search(mid + 1, high, xs, target)
    else search(low, mid - 1, xs, target)
  }

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none
  else search(0, list.len(xs) - 1, xs, target)
```
