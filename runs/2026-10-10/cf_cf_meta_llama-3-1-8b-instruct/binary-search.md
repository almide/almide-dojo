# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    let (low, high) = (0, len - 1)
    let binary_search_recursive(low, high) = {
      if low > high then none
      else {
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid)
        match mid_val {
          some(mid_val) => {
            if mid_val == target then some(mid)
            else if mid_val < target then binary_search_recursive(mid + 1, high)
            else binary_search_recursive(low, mid - 1)
          }
          none => none
        }
      }
    }
    binary_search_recursive(low, high)
  }
}
```

**Diagnostic:**

```
error: Expected Eq at line 6:32 (got LParen '(')
  --> /tmp/dojo-binary-search-0.almd:6:32
  here: let binary_search_recursive(low, high) = {
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
6 |     let binary_search_recursive(low, high) = {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, var, protocol, test) at line 23:1 (got RBrace '}')
  --> /tmp/dojo-binary-search-0.almd:23:1
  here: }
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
   |
23 | }
   | ^
error[E002]: undefined function 'binary_search_recursive'
  --> /tmp/dojo-binary-search-0.almd:14:43
  in call to binary_search_recursive()
  here: else if mid_val < target then binary_search_recursive(mid + 1, high)
  hint: Did you mean `binary_search`?
  try:
      binary_search
   |
14 |             else if mid_val < target then binary_search_recursive(mid + 1, high)
   |                                           ^^^^^^^^^^^^^^^^^^^^^^^
error[E002]: undefined function 'binary_search_recursive'
  --> /tmp/dojo-binary-search-0.almd:15:18
  in call to binary_search_recursive()
  here: else binary_search_recursive(low, mid - 1)
  hint: Did you mean `binary_search`?
  try:
      binary_search
   |
15 |             else binary_search_recursive(low, mid - 1)
   |                  ^^^^^^^^^^^^^^^^^^^^^^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-0.almd:21:29
  in variable low
  here: binary_search_recursive(low, high)
  hint: Did you mean `len`?
  try:
      len
   |
21 |     binary_search_recursive(low, high)
   |                             ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-0.almd:21:34
  in variable high
  here: binary_search_recursive(low, high)
  hint: Check the variable name
   |
21 |     binary_search_recursive(low, high)
   |                                  ^^^^
error[E002]: undefined function 'binary_search_recursive'
  --> /tmp/dojo-binary-search-0.almd:21:5
  in call to binary_search_recursive()
  here: binary_search_recursive(low, high)
  hint: Did you mean `binary_search`?
  try:
      binary_search
   |
21 |     binary_search_recursive(low, high)
   |     ^^^^^^^^^^^^^^^^^^^^^^^

7 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    let (low, high) = (0, len - 1)
    fn binary_search_recursive(low: Int, high: Int) -> Option[Int] = {
      if low > high then none
      else {
        let mid = (low + high) / 2
        let mid_val = list.get(xs, mid)
        match mid_val {
          some(mid_val) => {
            if mid_val == target then some(mid)
            else if mid_val < target then binary_search_recursive(mid + 1, high)
            else binary_search_recursive(low, mid - 1)
          }
          none => none
        }
      }
    }
    binary_search_recursive(low, high)
  }
}
```

**Diagnostic:**

```
error: `fn` cannot be declared inside a function body
  --> /tmp/dojo-binary-search-1.almd:6:5
  in nested fn
  here: fn binary_search_recursive(low: Int, high: Int) -> Option[Int] = {
  hint: Move it to the top level (thread any captured locals as parameters), or bind a lambda: `let row = (label, ns) => ...`
  try:
      fn row(label: String, ns: Int, total: Int) -> Unit =
          println("${label}: ${ns / total}")
  |
6 |     fn binary_search_recursive(low: Int, high: Int) -> Option[Int] = {
  |     ^^

1 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (PASS)

```almide
fn binary_search_recursive(low: Int, high: Int, xs: List[Int], target: Int) -> Option[Int] = {
  if low > high then none
  else {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid)
    match mid_val {
      some(mid_val) => {
        if mid_val == target then some(mid)
        else if mid_val < target then binary_search_recursive(mid + 1, high, xs, target)
        else binary_search_recursive(low, mid - 1, xs, target)
      }
      none => none
    }
  }
}

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    let (low, high) = (0, len - 1)
    binary_search_recursive(low, high, xs, target)
  }
}
```
