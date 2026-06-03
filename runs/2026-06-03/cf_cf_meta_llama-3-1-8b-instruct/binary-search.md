# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn rec(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
    if lo > hi {
      none
    } else {
      let mid = (lo + hi) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        rec(xs, target, mid + 1, hi)
      } else {
        rec(xs, target, lo, mid - 1)
      }
    }
  }
  rec(xs, target, 0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-0.almd:2:3
  |
2 |   fn rec(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
  |   ^
error: Expected Then at line 3:16 (got LBrace '{')
  --> /tmp/dojo-binary-search-0.almd:3:16
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if lo > hi {
  |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:5:7
  |
5 |     } else {
  |       ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-0.almd:1:63
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

4 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn rec(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
    if lo > hi {
      none
    } else {
      let mid = (lo + hi) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        rec(xs, target, mid + 1, hi)
      } else {
        rec(xs, target, lo, mid - 1)
      }
    }
  }
  rec(xs, target, 0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:2:3
  |
2 |   fn rec(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
  |   ^
error: Expected Then at line 3:16 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:3:16
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if lo > hi {
  |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:5:7
  |
5 |     } else {
  |       ^
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

4 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn rec(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
    if lo > hi {
      none
    } else {
      let mid = (lo + hi) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        rec(xs, target, mid + 1, hi)
      } else {
        rec(xs, target, lo, mid - 1)
      }
    }
  }
  match rec(xs, target, 0, list.len(xs) - 1) {
    some(i) => some(i)
    none => none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:2:3
  |
2 |   fn rec(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
  |   ^
error: Expected Then at line 3:16 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:3:16
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if lo > hi {
  |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:5:7
  |
5 |     } else {
  |       ^
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

4 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn rec(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
    if lo > hi {
      none
    } else {
      let mid = (lo + hi) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        rec(xs, target, mid + 1, hi)
      } else {
        rec(xs, target, lo, mid - 1)
      }
    }
  }
  match rec(xs, target, 0, list.len(xs) - 1) {
    some(i) => some(i)
    none => none
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:2:3
  |
2 |   fn rec(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = {
  |   ^
error: Expected Then at line 3:16 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:3:16
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if lo > hi {
  |                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:7 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:5:7
  |
5 |     } else {
  |       ^
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

4 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
