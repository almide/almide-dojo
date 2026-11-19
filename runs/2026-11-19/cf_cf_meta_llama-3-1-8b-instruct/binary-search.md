# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: compile-error
- **diagnostic code**: `E0308`

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
    let opt = list.get(xs, mid)
    opt ?? default
    if list.get(xs, mid) == target then some(mid)
    else if list.get(xs, mid) < target then binary_search(list.drop(xs, mid + 1), target)
    else binary_search(list.drop(xs, 0), target)
  }
}
```

**Diagnostic:**

```
error[E003]: undefined variable 'default'
  --> /tmp/dojo-binary-search-0.almd:9:12
  in variable default
  here: opt ?? default
  hint: Check the variable name
  |
9 |     opt ?? default
  |            ^^^^^^^
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
error[E037]: operator '<' compares Option[Int] with Int
  at line 11
  in operator <
  here: else if list.get(xs, mid) < target then binary_search(list.drop(xs, mid + 1), target)
  hint: A comparison relates two values of the same type, and nothing converts one side implicitly — convert one side explicitly (`int.to_string(n)`, `int.parse(s)`, `float.from(n)`, `<type>.from(x)` for a sized width), or compare the parts you mean
   |
11 |     else if list.get(xs, mid) < target then binary_search(list.drop(xs, mid + 1), target)
   |             ^

4 error(s) found
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
    let low = 0
    let high = len - 1
    let mid = (low + high) / 2
    let opt = list.get(xs, mid)
    opt ?? 0
    if opt == some(target) then some(mid)
    else if opt == some(_) && opt.unwrap() < target then binary_search(list.drop(xs, mid + 1), target)
    else binary_search(list.drop(xs, 0), target)
  }
}
```

**Diagnostic:**

```
error: '&&' is not valid in Almide
  --> /tmp/dojo-binary-search-1.almd:11:28
  in operator
  here: else if opt == some(_) && opt.unwrap() < target then binary_search(list.drop(xs, mid + 1), target)
  hint: Use 'and' for logical AND. Example: if a and b then ...
  try:
      a and b
   |
11 |     else if opt == some(_) && opt.unwrap() < target then binary_search(list.drop(xs, mid + 1), target)
   |                            ^^
error[E002]: undefined method 'unwrap' on option
  --> /tmp/dojo-binary-search-1.almd:11:31
  in method call .unwrap()
  here: else if opt == some(_) && opt.unwrap() < target then binary_search(list.drop(xs, mid + 1), target)
  hint: Almide doesn't use method-call syntax. Write `option.<fn>(x)` (or `x |> option.<fn>`) — there is no method `unwrap` on `option`. Run `almide explain E002` for examples.
   |
11 |     else if opt == some(_) && opt.unwrap() < target then binary_search(list.drop(xs, mid + 1), target)
   |                               ^^^^^^^^^^^^

2 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
  parse error: '&&' is not valid in Almide
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
    let opt = list.get(xs, mid)
    opt ?? 0
    if opt == some(target) then some(mid)
    else if opt == some(_) then {
      let value = opt.unwrap_or(0)
      if value < target then binary_search(list.drop(xs, mid + 1), target)
      else binary_search(list.drop(xs, 0), target)
    }
  }
}
```

**Diagnostic:**

```
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit — Option[Int] is the declared return type, and the branch at line 13 produces it
  --> /tmp/dojo-binary-search-2.almd:11:10
  in if branches
  here: else if opt == some(_) then {
  hint: Both branches of `if/then/else` must have the same type
  try:
      // an if-arm is a statement (e.g. `x = y` or a bare `let`) — returns Unit.
      // if/else is an *expression*: both arms must produce Option[Int]. Rebind via let instead:
      //   let new_x = if cond then <then-value> else <else-value>
      // Or for loop-like state, use recursion:
      //   fn step(x: Option[Int]) -> Option[Int] = if cond then step(<update>) else x
   |
11 |     else if opt == some(_) then {
   |          ^^

1 error(s) found
FAILED: /tmp/dojo-binary-search-2.almd
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
    let opt = list.get(xs, mid)
    opt ?? 0
    if opt == some(target) then some(mid)
    else if opt == some(_) then {
      let value = opt.unwrap_or(0)
      if value < target then binary_search(list.drop(xs, mid + 1), target)
      else binary_search(list.drop(xs, 0), target)
    }
    else none
  }
}
```

**Diagnostic:**

```
warning[E052]: `option.unwrap_or` is deprecated since dialect 3
  --> /tmp/dojo-binary-search-3.almd:12:23
  in option.unwrap_or
  here: let value = opt.unwrap_or(0)
  hint: Use the `??` operator — `value ?? default` — the default is evaluated only on the fallback path; write `x ?? default` for `x.unwrap_or(default)`.
   |
12 |       let value = opt.unwrap_or(0)
   |                       ^^^^^^^^^
warning[E015]: fn 'binary_search' has the same signature as stdlib `list.binary_search`
  --> /tmp/dojo-binary-search-3.almd:1:1
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Only the name and signature were compared; equivalent behaviour is not established. Review `list.binary_search` before deciding whether it implements your intended operation.
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  | ^^
FAILED: /tmp/dojo-binary-search-3.almd
Compile error for /tmp/dojo-binary-search-3.almd:
codegen produced invalid Rust — this is an Almide bug.
Please file a minimal repro at https://github.com/almide/almide/issues

--- rustc output (edited to hide generated paths) ---
error[E0308]: mismatched types
    --> <generated.rs>:6247:17
     |
6247 |                 match opt.clone() { Some(v) => v, None => 0i64, }
     |                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^- help: consider using a semicolon here
     |                 |
     |                 expected `()`, found `i64`


error: could not compile `almide-generated` (bin "almide-generated" test) due to 1 previous error; 11 warnings emitted

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
