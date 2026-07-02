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
      let mid_val = list.get(xs, mid)
      mid_val
        .map { _ =>
          if list.get(xs, mid).unwrap_or(-1) == target then mid
          else if list.get(xs, mid - 1).unwrap_or(-1) == target then mid - 1
          else search(low, mid - 1)
        }
        .or_else { _ =>
          if list.get(xs, mid + 1).unwrap_or(-1) == target then mid + 1
          else search(mid + 1, hi)
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
      let mid_val = list.get(xs, mid)
      mid_val
        .map { _ =>
          if list.get(xs, mid).unwrap_or(-1) == target then mid
          else if list.get(xs, mid - 1).unwrap_or(-1) == target then mid - 1
          else search(low, mid - 1)
        }
        .or_else { _ =>
          if list.get(xs, mid + 1).unwrap_or(-1) == target then mid + 1
          else search(mid + 1, hi)
        }
    }
  }

  search(0, list.len(xs) - 1)
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
    if low > hi then none
    else {
      let mid = (low + hi) / 2
      let mid_val = list.get(xs, mid)
      mid_val
        .map { _ =>
          if list.get(xs, mid).unwrap_or(-1) == target then mid
          else if list.get(xs, mid - 1).unwrap_or(-1) == target then mid - 1
          else search(low, mid - 1)
        }
        .or_else { _ =>
          if list.get(xs, mid + 1).unwrap_or(-1) == target then mid + 1
          else search(mid + 1, hi)
        }
    }
  }

  match search(0, list.len(xs) - 1) {
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
2 |   fn search(low: Int, hi: Int): Option[Int] = {
  |   ^
error: Expected expression at line 8:9 (got Dot '.')
  --> /tmp/dojo-binary-search-2.almd:8:9
  |
8 |         .map { _ =>
  |         ^
error: Expected expression at line 13:9 (got Dot '.')
  --> /tmp/dojo-binary-search-2.almd:13:9
   |
13 |         .or_else { _ =>
   |         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:5 (got RBrace '}')
  --> /tmp/dojo-binary-search-2.almd:17:5
   |
17 |     }
   |     ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:3:8
  in variable low
  hint: Check the variable name
  |
3 |     if low > hi then none
  |        ^^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-2.almd:3:14
  in variable hi
  hint: Did you mean `xs`?
  try:
      // hi  →  xs
      xs
  |
3 |     if low > hi then none
  |              ^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:5:18
  in variable low
  hint: Check the variable name
  |
5 |       let mid = (low + hi) / 2
  |                  ^^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-2.almd:5:24
  in variable hi
  hint: Did you mean `xs`?
  try:
      // hi  →  xs
      xs
  |
5 |       let mid = (low + hi) / 2
  |                        ^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:11:23
  in variable low
  hint: Check the variable name
   |
11 |           else search(low, mid - 1)
   |                       ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:11:34
  in call to search()
  hint: Check the function name
   |
11 |           else search(low, mid - 1)
   |                                  ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:14:27
  in variable mid
  hint: Check the variable name
   |
14 |           if list.get(xs, mid + 1).unwrap_or(-1) == target then mid + 1
   |                           ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:14:65
  in variable mid
  hint: Check the variable name
   |
14 |           if list.get(xs, mid + 1).unwrap_or(-1) == target then mid + 1
   |                                                                 ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:15:23
  in variable mid
  hint: Check the variable name
   |
15 |           else search(mid + 1, hi)
   |                       ^^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-2.almd:15:32
  in variable hi
  hint: Did you mean `xs`?
  try:
      // hi  →  xs
      xs
   |
15 |           else search(mid + 1, hi)
   |                                ^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-2.almd:15:32
  in call to search()
  hint: Check the function name
   |
15 |           else search(mid + 1, hi)
   |                                ^^

15 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  fn search(low: Int, hi: Int): Option[Int] = {
    if low > hi then none
    else {
      let mid = (low + hi) / 2
      let mid_val = list.get(xs, mid)
      mid_val
        .map { _ =>
          if list.get(xs, mid).unwrap_or(-1) == target then mid
          else if list.get(xs, mid - 1).unwrap_or(-1) == target then mid - 1
          else search(low, mid - 1)
        }
        .or_else { _ =>
          if list.get(xs, mid + 1).unwrap_or(-1) == target then mid + 1
          else search(mid + 1, hi)
        }
    }
  }

  search(0, list.len(xs) - 1)
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
error: Expected expression at line 8:9 (got Dot '.')
  --> /tmp/dojo-binary-search-3.almd:8:9
  |
8 |         .map { _ =>
  |         ^
error: Expected expression at line 13:9 (got Dot '.')
  --> /tmp/dojo-binary-search-3.almd:13:9
   |
13 |         .or_else { _ =>
   |         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 17:5 (got RBrace '}')
  --> /tmp/dojo-binary-search-3.almd:17:5
   |
17 |     }
   |     ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:3:8
  in variable low
  hint: Check the variable name
  |
3 |     if low > hi then none
  |        ^^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-3.almd:3:14
  in variable hi
  hint: Did you mean `xs`?
  try:
      // hi  →  xs
      xs
  |
3 |     if low > hi then none
  |              ^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:5:18
  in variable low
  hint: Check the variable name
  |
5 |       let mid = (low + hi) / 2
  |                  ^^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-3.almd:5:24
  in variable hi
  hint: Did you mean `xs`?
  try:
      // hi  →  xs
      xs
  |
5 |       let mid = (low + hi) / 2
  |                        ^^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:11:23
  in variable low
  hint: Check the variable name
   |
11 |           else search(low, mid - 1)
   |                       ^^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:11:34
  in call to search()
  hint: Check the function name
   |
11 |           else search(low, mid - 1)
   |                                  ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:14:27
  in variable mid
  hint: Check the variable name
   |
14 |           if list.get(xs, mid + 1).unwrap_or(-1) == target then mid + 1
   |                           ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:14:65
  in variable mid
  hint: Check the variable name
   |
14 |           if list.get(xs, mid + 1).unwrap_or(-1) == target then mid + 1
   |                                                                 ^^^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:15:23
  in variable mid
  hint: Check the variable name
   |
15 |           else search(mid + 1, hi)
   |                       ^^^
error[E003]: undefined variable 'hi'
  --> /tmp/dojo-binary-search-3.almd:15:32
  in variable hi
  hint: Did you mean `xs`?
  try:
      // hi  →  xs
      xs
   |
15 |           else search(mid + 1, hi)
   |                                ^^
error[E002]: undefined function 'search'
  --> /tmp/dojo-binary-search-3.almd:15:32
  in call to search()
  hint: Check the function name
   |
15 |           else search(mid + 1, hi)
   |                                ^^

15 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
