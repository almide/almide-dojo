# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, hi: Int): Option[Int] = {
    if low > hi {
      none
    } else {
      let mid = (low + hi) / 2
      match list.get(xs, mid) {
        some(mid_val) => {
          if mid_val == target {
            some(mid)
          } else if mid_val > target {
            search(low, mid - 1)
          } else {
            search(mid + 1, hi)
          }
        }
        none => search(low, hi)
      }
    }
  }

  match list.len(xs) {
    0 => none
    _ => search(0, list.len(xs) - 1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-0.almd:2:3
  |
2 |   fn search(low: Int, hi: Int): Option[Int] = {
  |   ^
error: Expected Then at line 3:17 (got LBrace '{')
  --> /tmp/dojo-binary-search-0.almd:3:17
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > hi {
  |                 ^
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
  fn search(low: Int, hi: Int): Option[Int] = {
    if low > hi {
      none
    } else {
      let mid = (low + hi) / 2
      match list.get(xs, mid) {
        some(mid_val) => {
          if mid_val == target {
            some(mid)
          } else if mid_val > target {
            search(low, mid - 1)
          } else {
            search(mid + 1, hi)
          }
        }
        none => search(low, hi)
      }
    }
  }

  match list.len(xs) {
    0 => none
    _ => search(0, list.len(xs) - 1).unwrap_or(-1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:2:3
  |
2 |   fn search(low: Int, hi: Int): Option[Int] = {
  |   ^
error: Expected Then at line 3:17 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:3:17
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > hi {
  |                 ^
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
  fn search(low: Int, hi: Int): Option[Int] = {
    if low > hi {
      none
    } else {
      let mid = (low + hi) / 2
      match list.get(xs, mid) {
        some(mid_val) => {
          if mid_val == target {
            some(mid)
          } else if mid_val > target {
            search(low, mid - 1)
          } else {
            search(mid + 1, hi)
          }
        }
        none => none
      }
    }
  }

  match list.len(xs) {
    0 => none
    _ => search(0, list.len(xs) - 1).unwrap_or(-1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:2:3
  |
2 |   fn search(low: Int, hi: Int): Option[Int] = {
  |   ^
error: Expected Then at line 3:17 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:3:17
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |     if low > hi {
  |                 ^
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
  fn search(low: Int, hi: Int): Option[Int] = {
    if low > hi then none else {
      let mid = (low + hi) / 2
      match list.get(xs, mid) {
        some(mid_val) => {
          if mid_val == target then some(mid) else if mid_val > target then search(low, mid - 1) else search(mid + 1, hi)
        }
        none => none
      }
    }
  }

  match list.len(xs) {
    0 => none
    _ => search(0, list.len(xs) - 1).unwrap_or(-1)
  }
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 2:3 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:2:3
  |
2 |   fn search(low: Int, hi: Int): Option[Int] = {
  |   ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 14:3 (got Match 'match')
  --> /tmp/dojo-binary-search-3.almd:14:3
   |
14 |   match list.len(xs) {
   |   ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:3:8
  in variable low
  hint: Check the variable name
  |
3 |     if low > hi then none else {
  |        ^^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-3.almd:3:14
  in variable hi
  hint: Did you mean `xs`?
  try:
      // hi  →  xs
      xs
  |
3 |     if low > hi then none else {
  |              ^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:4:18
  in variable low
  hint: Check the variable name
  |
4 |       let mid = (low + hi) / 2
  |                  ^^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-3.almd:4:24
  in variable hi
  hint: Did you mean `xs`?
  try:
      // hi  →  xs
      xs
  |
4 |       let mid = (low + hi) / 2
  |                        ^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:7:84
  in variable low
  hint: Check the variable name
  |
7 |           if mid_val == target then some(mid) else if mid_val > target then search(low, mid - 1) else search(mid + 1, hi)
  |                                                                                    ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:7:95
  in call to search()
  hint: Check the function name
  |
7 |           if mid_val == target then some(mid) else if mid_val > target then search(low, mid - 1) else search(mid + 1, hi)
  |                                                                                               ^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-3.almd:7:119
  in variable hi
  hint: Did you mean `xs`?
  try:
      // hi  →  xs
      xs
  |
7 |           if mid_val == target then some(mid) else if mid_val > target then search(low, mid - 1) else search(mid + 1, hi)
  |                                                                                                                       ^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:7:119
  in call to search()
  hint: Check the function name
  |
7 |           if mid_val == target then some(mid) else if mid_val > target then search(low, mid - 1) else search(mid + 1, hi)
  |                                                                                                                       ^^

10 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
