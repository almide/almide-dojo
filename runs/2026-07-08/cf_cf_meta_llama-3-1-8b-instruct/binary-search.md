# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] {
  fn search(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] {
    if lo > hi {
      return none
    }
    let mid = (lo + hi) / 2;
    match list.get(xs, mid) {
      some(mid_value) => {
        if mid_value == target {
          return some(mid)
        } else if mid_value < target {
          return search(xs, target, mid + 1, hi)
        } else {
          return search(xs, target, lo, mid - 1)
        }
      }
      none => search(xs, target, lo, mid - 1)
    }
  }
  match list.binary_search(xs, target) {
    some(index) => some(index),
    none => search(xs, target, 0, list.len(xs) - 1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Missing '=' before function body at line 1:61
  --> /tmp/dojo-binary-search-0.almd:1:61
  hint: Almide requires '=' before the body. Write: fn binary_search(...) -> Type = { ... }
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] {
  |                                                             ^
error: Missing '=' before function body at line 2:74
  --> /tmp/dojo-binary-search-0.almd:2:74
  hint: Almide requires '=' before the body. Write: fn search(...) -> Type = { ... }
  |
2 |   fn search(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] {
  |                                                                          ^

2 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
    if lo > hi {
      return none
    }
    let mid = (lo + hi) / 2;
    match list.get(xs, mid) {
      some(mid_value) => {
        if mid_value == target {
          return some(mid)
        } else if mid_value < target {
          return search(xs, target, mid + 1, hi)
        } else {
          return search(xs, target, lo, mid - 1)
        }
      }
      none => search(xs, target, lo, mid - 1)
    }
  }
  match list.binary_search(xs, target) {
    some(index) => some(index),
    none => search(xs, target, 0, list.len(xs) - 1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:2:3
  |
2 |   fn search(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
  |   ^
error: Expected Then at line 3:16 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:3:16
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if lo > hi {
  |                ^
error: Semicolons are not used in Almide at line 6:28
  --> /tmp/dojo-binary-search-1.almd:6:28
  hint: Remove the ';'. Almide uses newlines to separate statements.
  |
6 |     let mid = (lo + hi) / 2;
  |                            ^
error[E003]: undefined variable 'lo'
  --> /tmp/dojo-binary-search-1.almd:6:16
  in variable lo
  hint: Check the variable name
  |
6 |     let mid = (lo + hi) / 2;
  |                ^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-1.almd:6:21
  in variable hi
  hint: Did you mean `mid`?
  try:
      // hi  →  mid
      mid
  |
6 |     let mid = (lo + hi) / 2;
  |                     ^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:1:63
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  |                                                               ^

6 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] {
    if lo > hi {
      return none
    }
    let mid = (lo + hi) / 2
    match list.get(xs, mid) {
      some(mid_value) => {
        if mid_value == target {
          some(mid)
        } else if mid_value < target {
          search(xs, target, mid + 1, hi)
        } else {
          search(xs, target, lo, mid - 1)
        }
      }
      none => search(xs, target, lo, mid - 1)
    }
  }
  match list.binary_search(xs, target) {
    some(index) => some(index),
    none => search(xs, target, 0, list.len(xs) - 1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:2:3
  |
2 |   fn search(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] {
  |   ^
error: Expected Then at line 3:16 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:3:16
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if lo > hi {
  |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:5 (got Match 'match')
  --> /tmp/dojo-binary-search-2.almd:7:5
  |
7 |     match list.get(xs, mid) {
  |     ^
error[E003]: undefined variable 'lo'
  --> /tmp/dojo-binary-search-2.almd:6:16
  in variable lo
  hint: Check the variable name
  |
6 |     let mid = (lo + hi) / 2
  |                ^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-2.almd:6:21
  in variable hi
  hint: Did you mean `mid`?
  try:
      // hi  →  mid
      mid
  |
6 |     let mid = (lo + hi) / 2
  |                     ^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:1:63
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  |                                                               ^

6 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] {
    if lo > hi {
      return none
    }
    let mid = (lo + hi) / 2
    match list.get(xs, mid) {
      some(mid_value) => {
        if mid_value == target {
          some(mid)
        } else if mid_value < target {
          search(xs, target, mid + 1, hi)
        } else {
          search(xs, target, lo, mid - 1)
        }
      }
      none => search(xs, target, lo, mid - 1)
    }
  }
  match list.binary_search(xs, target) {
    some(index) => some(index),
    none => search(xs, target, 0, list.len(xs) - 1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:2:3
  |
2 |   fn search(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] {
  |   ^
error: Expected Then at line 3:16 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:3:16
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if lo > hi {
  |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:5 (got Match 'match')
  --> /tmp/dojo-binary-search-3.almd:7:5
  |
7 |     match list.get(xs, mid) {
  |     ^
error[E003]: undefined variable 'lo'
  --> /tmp/dojo-binary-search-3.almd:6:16
  in variable lo
  hint: Check the variable name
  |
6 |     let mid = (lo + hi) / 2
  |                ^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-3.almd:6:21
  in variable hi
  hint: Did you mean `mid`?
  try:
      // hi  →  mid
      mid
  |
6 |     let mid = (lo + hi) / 2
  |                     ^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:1:63
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
1 | fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  |                                                               ^

6 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
