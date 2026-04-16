# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-0.almd:2:3
  |
2 |   fn search(low: Int, high: Int) -> Option[Int] = {
  |   ^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-0.almd:3:19
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
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
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1).unwrap_or(-1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:2:3
  |
2 |   fn search(low: Int, high: Int) -> Option[Int] = {
  |   ^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:3:19
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
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
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  search(0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:2:3
  |
2 |   fn search(low: Int, high: Int) -> Option[Int] = {
  |   ^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:3:19
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
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
  fn search(low: Int, high: Int) -> Option[Int] = {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2
      let mid_val = list.get(xs, mid).unwrap_or(-1)
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(mid + 1, high)
      } else {
        search(low, mid - 1)
      }
    }
  }
  match search(0, list.len(xs) - 1) {
    some(index) => some(index),
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
2 |   fn search(low: Int, high: Int) -> Option[Int] = {
  |   ^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:3:19
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
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
