# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] {
  fn search(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
    if low > high {
      return none
    }
    let mid = (low + high) / 2;
    let mid_val = list.get(xs, mid).unwrap_or(-1);
    if mid_val == target {
      return some(mid)
    } else if mid_val < target {
      return search(xs, target, mid + 1, high)
    } else {
      return search(xs, target, low, mid - 1)
    }
  }
  search(xs, target, 0, list.len(xs) - 1)
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
error: Missing '=' before function body at line 2:77
  --> /tmp/dojo-binary-search-0.almd:2:77
  hint: Almide requires '=' before the body. Write: fn search(...) -> Type = { ... }
  |
2 |   fn search(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
  |                                                                             ^

2 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = {
    if low > high {
      return none
    }
    let mid = (low + high) / 2;
    let mid_val = list.get(xs, mid).unwrap_or(-1);
    if mid_val == target {
      return some(mid)
    } else if mid_val < target {
      return search(xs, target, mid + 1, high)
    } else {
      return search(xs, target, low, mid - 1)
    }
  }
  search(xs, target, 0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:2:3
  |
2 |   fn search(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = {
  |   ^
error: Expected Then at line 3:19 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:3:19
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > high {
  |                   ^
error: 'return' is not needed in Almide at line 4:7
  --> /tmp/dojo-binary-search-1.almd:4:7
  hint: The last expression in a block is the return value. Use 'guard ... else' for early returns.
  |
4 |       return none
  |       ^
error: Semicolons are not used in Almide at line 6:31
  --> /tmp/dojo-binary-search-1.almd:6:31
  hint: Remove the ';'. Almide uses newlines to separate statements.
  |
6 |     let mid = (low + high) / 2;
  |                               ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:6:16
  in variable low
  hint: Check the variable name
  |
6 |     let mid = (low + high) / 2;
  |                ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:6:22
  in variable high
  hint: Check the variable name
  |
6 |     let mid = (low + high) / 2;
  |                      ^^^^
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

7 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2;
      let mid_val = list.get(xs, mid).unwrap_or(-1);
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(xs, target, mid + 1, high)
      } else {
        search(xs, target, low, mid - 1)
      }
    }
  }
  search(xs, target, 0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:2:3
  |
2 |   fn search(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
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
  fn search(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
    if low > high {
      none
    } else {
      let mid = (low + high) / 2;
      let mid_val = list.get(xs, mid).unwrap_or(-1);
      if mid_val == target {
        some(mid)
      } else if mid_val < target {
        search(xs, target, mid + 1, high)
      } else {
        search(xs, target, low, mid - 1)
      }
    }
  }
  search(xs, target, 0, list.len(xs) - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:2:3
  |
2 |   fn search(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
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
