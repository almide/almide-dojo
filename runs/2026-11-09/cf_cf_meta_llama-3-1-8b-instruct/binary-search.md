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
    if list.get(xs, mid) == target then some(mid)
    else if list.get(xs, mid) < target then binary_search(list.drop(xs, mid + 1), target)
    else binary_search(list.drop(xs, 0), target)
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
error[E037]: operator '==' compares Option[Int] with Int
  --> /tmp/dojo-binary-search-0.almd:10:29
  in operator ==
  here: if list.get(xs, mid) == target then some(mid)
  hint: Unwrap the Option operand first (`?? fallback`, or `match` on some/none) — or compare two Options
   |
10 |     if list.get(xs, mid) == target then some(mid)
   |                             ^^^^^^
error[E030]: operator '<' is not defined for Option[Int] — ordering applies to Int, Float, String, and Bool
  --> /tmp/dojo-binary-search-0.almd:11:33
  in operator <
  here: else if list.get(xs, mid) < target then binary_search(list.drop(xs, mid + 1), target)
  hint: Compare scalar fields explicitly, or use list.sort / list.min / list.max for ordered collections
   |
11 |     else if list.get(xs, mid) < target then binary_search(list.drop(xs, mid + 1), target)
   |                                 ^^^^^^
error[E001]: type mismatch in ?? fallback: expected Int but got Option[Int]
  --> /tmp/dojo-binary-search-0.almd:12:42
  in ?? fallback
  here: else binary_search(list.drop(xs, 0), target)
  hint: Fix the expression type or change the expected type
   |
12 |     else binary_search(list.drop(xs, 0), target)
   |                                          ^^^^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int — Option[Int] is the declared return type, and the branch at line 3 produces it
  --> /tmp/dojo-binary-search-0.almd:9:13
  in if branches
  here: opt_mid ??
  hint: Both branches of `if/then/else` must have the same type
  |
9 |     opt_mid ??
  |             ^^
error[E037]: operator '<' compares Option[Int] with Int
  at line 11
  in operator <
  here: else if list.get(xs, mid) < target then binary_search(list.drop(xs, mid + 1), target)
  hint: A comparison relates two values of the same type, and nothing converts one side implicitly — convert one side explicitly (`int.to_string(n)`, `int.parse(s)`, `float.from(n)`, `<type>.from(x)` for a sized width), or compare the parts you mean
   |
11 |     else if list.get(xs, mid) < target then binary_search(list.drop(xs, mid + 1), target)
   |             ^

6 error(s) found
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
    match opt_mid {
      some(x) => if x == target then some(mid)
                 else if x < target then binary_search(list.drop(xs, mid + 1), target)
                 else binary_search(list.drop(xs, 0), target)
      none => none
    }
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
error[E001]: type mismatch in ?? fallback: expected Int but got Option[Int]
  --> /tmp/dojo-binary-search-1.almd:14:15
  in ?? fallback
  here: none => none
  hint: Fix the expression type or change the expected type
   |
14 |       none => none
   |               ^^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int — Option[Int] is the declared return type, and the branch at line 3 produces it
  --> /tmp/dojo-binary-search-1.almd:9:13
  in if branches
  here: opt_mid ??
  hint: Both branches of `if/then/else` must have the same type
  |
9 |     opt_mid ??
  |             ^^

3 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
  parse error: the ?? fallback is not on this line
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
    match opt_mid {
      some(x) => if x == target then some(mid)
                 else if x < target then binary_search(list.drop(xs, mid + 1), target)
                 else binary_search(list.drop(xs, 0), target)
      none => binary_search(list.drop(xs, 0), target)
    }
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
error[E001]: type mismatch in ?? fallback: expected Int but got Option[Int]
  --> /tmp/dojo-binary-search-2.almd:14:47
  in ?? fallback
  here: none => binary_search(list.drop(xs, 0), target)
  hint: Fix the expression type or change the expected type
   |
14 |       none => binary_search(list.drop(xs, 0), target)
   |                                               ^^^^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int — Option[Int] is the declared return type, and the branch at line 3 produces it
  --> /tmp/dojo-binary-search-2.almd:9:13
  in if branches
  here: opt_mid ??
  hint: Both branches of `if/then/else` must have the same type
  |
9 |     opt_mid ??
  |             ^^

3 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
  parse error: the ?? fallback is not on this line
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
    (match opt_mid {
      some(x) => if x == target then some(mid)
                 else if x < target then binary_search(list.drop(xs, mid + 1), target)
                 else binary_search(list.drop(xs, 0), target)
      none => binary_search(list.drop(xs, 0), target)
    })
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
error[E001]: type mismatch in ?? fallback: expected Int but got Option[Int]
  --> /tmp/dojo-binary-search-3.almd:14:47
  in ?? fallback
  here: none => binary_search(list.drop(xs, 0), target)
  hint: Fix the expression type or change the expected type
   |
14 |       none => binary_search(list.drop(xs, 0), target)
   |                                               ^^^^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Int — Option[Int] is the declared return type, and the branch at line 3 produces it
  --> /tmp/dojo-binary-search-3.almd:9:13
  in if branches
  here: opt_mid ??
  hint: Both branches of `if/then/else` must have the same type
  |
9 |     opt_mid ??
  |             ^^

3 error(s) found
FAILED: /tmp/dojo-binary-search-3.almd
  parse error: the ?? fallback is not on this line
note: this failure is the wasm leg's verdict; the native re-run that checks it could not build:
  Compile error for /tmp/dojo-binary-search-3.almd:
  compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
