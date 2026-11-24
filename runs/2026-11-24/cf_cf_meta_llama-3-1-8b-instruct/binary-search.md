# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E038`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    let low = 0
    let high = len - 1
    let mid = (low + high) / 2
    let opt_mid = list.get(xs, mid)
    opt_mid ??
    if target == list.get(xs, mid) ?? default then some(mid)
    else if target < list.get(xs, mid) ?? default then binary_search(list.drop(xs, low + 1), target)
    else binary_search(list.drop(xs, low), target)
  }
}
```

**Diagnostic:**

```
error[E038]: the ?? fallback is not on this line
  --> /tmp/dojo-binary-search-0.almd:9:13
  in ?? fallback
  here: opt_mid ??
  hint: Write the fallback on the same line as `??`; for a multiline fallback wrap the whole expression in parentheses with `??` trailing:
        (expr ??
          fallback)
  |
9 |     opt_mid ??
  |             ^^
error[E003]: undefined variable 'default'
  --> /tmp/dojo-binary-search-0.almd:10:39
  in variable default
  here: if target == list.get(xs, mid) ?? default then some(mid)
  hint: Check the variable name
   |
10 |     if target == list.get(xs, mid) ?? default then some(mid)
   |                                       ^^^^^^^
error[E003]: undefined variable 'default'
  --> /tmp/dojo-binary-search-0.almd:11:43
  in variable default
  here: else if target < list.get(xs, mid) ?? default then binary_search(list.drop(xs, low + 1), target)
  hint: Check the variable name
   |
11 |     else if target < list.get(xs, mid) ?? default then binary_search(list.drop(xs, low + 1), target)
   |                                           ^^^^^^^
error[E001]: type mismatch in ?? fallback: expected Int but got Option[Int]
  --> /tmp/dojo-binary-search-0.almd:12:44
  in ?? fallback
  here: else binary_search(list.drop(xs, low), target)
  hint: Fix the expression type or change the expected type
   |
12 |     else binary_search(list.drop(xs, low), target)
   |                                            ^^^^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int — Option[Int] is the declared return type, and the branch at line 3 produces it
  --> /tmp/dojo-binary-search-0.almd:9:13
  in if branches
  here: opt_mid ??
  hint: Both branches of `if/then/else` must have the same type
  |
9 |     opt_mid ??
  |             ^^

5 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
  parse error: the ?? fallback is not on this line
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
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
    let low = 0
    let high = len - 1
    let mid = (low + high) / 2
    let opt_mid = list.get(xs, mid)
    opt_mid ??
    let value = opt_mid ?? default
    if target == value then some(mid)
    else if target < value then binary_search(list.drop(xs, low + 1), target)
    else binary_search(list.drop(xs, low), target)
  }
}
```

**Diagnostic:**

```
error[E038]: the ?? fallback is not on this line
  --> /tmp/dojo-binary-search-1.almd:9:13
  in ?? fallback
  here: opt_mid ??
  hint: Write the fallback on the same line as `??`; for a multiline fallback wrap the whole expression in parentheses with `??` trailing:
        (expr ??
          fallback)
  |
9 |     opt_mid ??
  |             ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:10:5
  in let-in
  here: let value = opt_mid ?? default
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |     let value = opt_mid ?? default
   |     ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-binary-search-1.almd:11:18
  in variable value
  here: if target == value then some(mid)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
11 |     if target == value then some(mid)
   |                  ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-binary-search-1.almd:12:22
  in variable value
  here: else if target < value then binary_search(list.drop(xs, low + 1), target)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
12 |     else if target < value then binary_search(list.drop(xs, low + 1), target)
   |                      ^^^^^

4 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
  parse error: the ?? fallback is not on this line
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-1.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    let low = 0
    let high = len - 1
    let mid = (low + high) / 2
    let opt_mid = list.get(xs, mid)
    opt_mid ??
    let value = opt_mid ?? default
    if target == value then some(mid)
    else if target < value then binary_search(list.drop(xs, low + 1), target)
    else binary_search(list.drop(xs, 0) + list.drop(xs, low + 1), target)
  }
}
```

**Diagnostic:**

```
error[E038]: the ?? fallback is not on this line
  --> /tmp/dojo-binary-search-2.almd:9:13
  in ?? fallback
  here: opt_mid ??
  hint: Write the fallback on the same line as `??`; for a multiline fallback wrap the whole expression in parentheses with `??` trailing:
        (expr ??
          fallback)
  |
9 |     opt_mid ??
  |             ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:10:5
  in let-in
  here: let value = opt_mid ?? default
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |     let value = opt_mid ?? default
   |     ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-binary-search-2.almd:11:18
  in variable value
  here: if target == value then some(mid)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
11 |     if target == value then some(mid)
   |                  ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-binary-search-2.almd:12:22
  in variable value
  here: else if target < value then binary_search(list.drop(xs, low + 1), target)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
12 |     else if target < value then binary_search(list.drop(xs, low + 1), target)
   |                      ^^^^^

4 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
  parse error: the ?? fallback is not on this line
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-2.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let len = list.len(xs)
  if len == 0 then none
  else {
    let low = 0
    let high = len - 1
    let mid = (low + high) / 2
    let opt_mid = list.get(xs, mid)
    opt_mid ??
    let value = opt_mid ?? default
    if target == value then some(mid)
    else if target < value then binary_search(list.drop(xs, low + 1), target)
    else binary_search(list.drop(xs, 0) + list.drop(xs, low + 1), target)
  }
}
```

**Diagnostic:**

```
error[E038]: the ?? fallback is not on this line
  --> /tmp/dojo-binary-search-3.almd:9:13
  in ?? fallback
  here: opt_mid ??
  hint: Write the fallback on the same line as `??`; for a multiline fallback wrap the whole expression in parentheses with `??` trailing:
        (expr ??
          fallback)
  |
9 |     opt_mid ??
  |             ^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:10:5
  in let-in
  here: let value = opt_mid ?? default
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
10 |     let value = opt_mid ?? default
   |     ^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-binary-search-3.almd:11:18
  in variable value
  here: if target == value then some(mid)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
11 |     if target == value then some(mid)
   |                  ^^^^^
error[E003]: undefined variable 'value'
  --> /tmp/dojo-binary-search-3.almd:12:22
  in variable value
  here: else if target < value then binary_search(list.drop(xs, low + 1), target)
  hint: Did you mean `value.int`?
  try:
      value.int
   |
12 |     else if target < value then binary_search(list.drop(xs, low + 1), target)
   |                      ^^^^^

4 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
  parse error: the ?? fallback is not on this line
  parse error: 'let' is not an expression in Almide
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
