# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  match xs {
    some(x) => binary_search_recursive(x, target, 0, xs.len(x) - 1)
    none => none
  }
}

fn binary_search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = {
  match (low, high) {
    (a, b) if a > b => none
    (a, b) if xs.get(xs, a) == some(target) => some(a)
    (a, b) if xs.get(xs, a) == none => binary_search_recursive(xs, target, a + 1, high)
    (a, b) if xs.get(xs, b) == none => binary_search_recursive(xs, target, a, b - 1)
    (a, b) => {
      let mid = (a + b) / 2
      match xs.get(xs, mid) {
        some(x) if x == target => some(mid)
        some(x) => binary_search_recursive(xs, target, a, mid - 1)
        none => binary_search_recursive(xs, target, mid + 1, b)
      }
    }
  }
}
```

**Diagnostic:**

```
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-binary-search-0.almd:2:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match xs {
  |         ^^
error[E004]: list.len() expects 1 argument(s) but got 2
  --> /tmp/dojo-binary-search-0.almd:3:54
  in call to list.len()
  here: some(x) => binary_search_recursive(x, target, 0, xs.len(x) - 1)
  hint: Check the number of arguments
  try:
      // list.len() takes 1 arg(s) — you passed 2
      list.len(<xs: List[A]>)
  |
3 |     some(x) => binary_search_recursive(x, target, 0, xs.len(x) - 1)
  |                                                      ^^
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-binary-search-0.almd:3:66
  in match pattern
  here: some(x) => binary_search_recursive(x, target, 0, xs.len(x) - 1)
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     some(x) => binary_search_recursive(x, target, 0, xs.len(x) - 1)
  |                                                                  ^
error[E004]: list.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-binary-search-0.almd:11:15
  in call to list.get()
  here: (a, b) if xs.get(xs, a) == some(target) => some(a)
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 3
      list.get(<xs: List[A]>, <i: Int>)
   |
11 |     (a, b) if xs.get(xs, a) == some(target) => some(a)
   |               ^^
error[E005]: argument 'i' expects Int but got List[Int]
  --> /tmp/dojo-binary-search-0.almd:11:26
  in call to list.get()
  here: (a, b) if xs.get(xs, a) == some(target) => some(a)
  hint: Fix the argument type
   |
23 | }
   | -------------------------- fn list.get() defined here
...
11 |     (a, b) if xs.get(xs, a) == some(target) => some(a)
   |                          ^
error[E004]: list.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-binary-search-0.almd:12:15
  in call to list.get()
  here: (a, b) if xs.get(xs, a) == none => binary_search_recursive(xs, target, a + 1, high)
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 3
      list.get(<xs: List[A]>, <i: Int>)
   |
12 |     (a, b) if xs.get(xs, a) == none => binary_search_recursive(xs, target, a + 1, high)
   |               ^^
error[E005]: argument 'i' expects Int but got List[Int]
  --> /tmp/dojo-binary-search-0.almd:12:26
  in call to list.get()
  here: (a, b) if xs.get(xs, a) == none => binary_search_recursive(xs, target, a + 1, high)
  hint: Fix the argument type
   |
23 | }
   | -------------------------- fn list.get() defined here
...
12 |     (a, b) if xs.get(xs, a) == none => binary_search_recursive(xs, target, a + 1, high)
   |                          ^
error[E004]: list.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-binary-search-0.almd:13:15
  in call to list.get()
  here: (a, b) if xs.get(xs, b) == none => binary_search_recursive(xs, target, a, b - 1)
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 3
      list.get(<xs: List[A]>, <i: Int>)
   |
13 |     (a, b) if xs.get(xs, b) == none => binary_search_recursive(xs, target, a, b - 1)
   |               ^^
error[E005]: argument 'i' expects Int but got List[Int]
  --> /tmp/dojo-binary-search-0.almd:13:26
  in call to list.get()
  here: (a, b) if xs.get(xs, b) == none => binary_search_recursive(xs, target, a, b - 1)
  hint: Fix the argument type
   |
23 | }
   | -------------------------- fn list.get() defined here
...
13 |     (a, b) if xs.get(xs, b) == none => binary_search_recursive(xs, target, a, b - 1)
   |                          ^
error[E004]: list.get() expects 2 argument(s) but got 3
  --> /tmp/dojo-binary-search-0.almd:16:13
  in call to list.get()
  here: match xs.get(xs, mid) {
  hint: Check the number of arguments
  try:
      // list.get() takes 2 arg(s) — you passed 3
      list.get(<xs: List[A]>, <i: Int>)
   |
16 |       match xs.get(xs, mid) {
   |             ^^
error[E005]: argument 'i' expects Int but got List[Int]
  --> /tmp/dojo-binary-search-0.almd:16:24
  in call to list.get()
  here: match xs.get(xs, mid) {
  hint: Fix the argument type
   |
23 | }
   | -------------------------- fn list.get() defined here
...
16 |       match xs.get(xs, mid) {
   |                        ^^^

11 error(s) found
FAILED: /tmp/dojo-binary-search-0.almd
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  match xs {
    none => none
    some(x) => binary_search_recursive(x, target, 0, list.len(x) - 1)
  }
}

fn binary_search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = {
  match (low, high) {
    (a, b) if a > b => none
    (a, b) if list.get(xs, a) == some(target) => some(a)
    (a, b) if list.get(xs, a) == none => binary_search_recursive(xs, target, a + 1, high)
    (a, b) if list.get(xs, b) == none => binary_search_recursive(xs, target, a, b - 1)
    (a, b) => {
      let mid = (a + b) / 2
      match list.get(xs, mid) {
        some(x) if x == target => some(mid)
        some(x) => binary_search_recursive(xs, target, a, mid - 1)
        none => binary_search_recursive(xs, target, mid + 1, b)
      }
    }
  }
}
```

**Diagnostic:**

```
error: pattern `none` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-binary-search-1.almd:2:9
  in match pattern
  here: match xs {
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
2 |   match xs {
  |         ^^
error: pattern `some(..)` cannot match List[Int] — the subject is not an Option
  --> /tmp/dojo-binary-search-1.almd:3:13
  in match pattern
  here: none => none
  hint: the value is already a plain List[Int]. If it comes from an effect-fn call, its `!` already unwrapped it — use the value directly, or replace the `!` with `?? <default>` on that call for a fallback
  |
3 |     none => none
  |             ^^^^

2 error(s) found
FAILED: /tmp/dojo-binary-search-1.almd
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  match xs {
    _ => binary_search_recursive(xs, target, 0, list.len(xs) - 1)
  }
}

fn binary_search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = {
  match (low, high) {
    (a, b) if a > b => none
    (a, b) if list.get(xs, a) == some(target) => some(a)
    (a, b) if list.get(xs, a) == none => binary_search_recursive(xs, target, a + 1, high)
    (a, b) if list.get(xs, b) == none => binary_search_recursive(xs, target, a, b - 1)
    (a, b) => {
      let mid = (a + b) / 2
      match list.get(xs, mid) {
        some(x) if x == target => some(mid)
        some(x) => binary_search_recursive(xs, target, a, mid - 1)
        none => binary_search_recursive(xs, target, mid + 1, b)
      }
    }
  }
}
```

**Diagnostic:**

```
warning[E015]: fn 'binary_search' has the same signature as stdlib `list.binary_search`
  --> /tmp/dojo-binary-search-2.almd:1:1
  in fn binary_search
  here: fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  hint: Only the name and signature were compared; equivalent behaviour is not established. Review `list.binary_search` before deciding whether it implements your intended operation.
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  | ^^
FAILED: /tmp/dojo-binary-search-2.almd
  test: binary_search last
  at:   /tmp/dojo-binary-search-2.almd:29
  expected: Some(4)
  found:    None

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  match list.binary_search(xs, target) {
    some(index) => some(index)
    none => none
  }
}
```
