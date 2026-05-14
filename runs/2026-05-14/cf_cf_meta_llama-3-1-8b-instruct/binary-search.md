# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] {
    fn search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
        if low > high {
            return none;
        }
        let mid = (low + high) / 2;
        let mid_e = list.get(xs, mid);
        match mid_e {
            some(mid) => {
                if mid == target {
                    return some(mid);
                } else if mid < target {
                    return search_recursive(xs, target, mid + 1, high);
                } else {
                    return search_recursive(xs, target, low, mid - 1);
                }
            }
            none => {
                return search_recursive(xs, target, low, mid - 1);
            }
        }
    }
    let len = list.len(xs);
    if len == 0 {
        return none;
    }
    search_recursive(xs, target, 0, len - 1)
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
error: Missing '=' before function body at line 2:89
  --> /tmp/dojo-binary-search-0.almd:2:89
  hint: Almide requires '=' before the body. Write: fn search_recursive(...) -> Type = { ... }
  |
2 |     fn search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
  |                                                                                         ^

2 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    fn search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = {
        if low > high {
            return none;
        }
        let mid = (low + high) / 2;
        let mid_e = list.get(xs, mid);
        match mid_e {
            some(mid) => {
                if mid == target {
                    return some(mid);
                } else if mid < target {
                    return search_recursive(xs, target, mid + 1, high);
                } else {
                    return search_recursive(xs, target, low, mid - 1);
                }
            }
            none => {
                return search_recursive(xs, target, low, mid - 1);
            }
        }
    }
    let len = list.len(xs);
    if len == 0 {
        return none;
    }
    search_recursive(xs, target, 0, len - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected expression at line 2:5 (got Fn 'fn')
  --> /tmp/dojo-binary-search-1.almd:2:5
  |
2 |     fn search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = {
  |     ^
error: Expected Then at line 3:23 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:3:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |         if low > high {
  |                       ^
error: Semicolons are not used in Almide at line 6:35
  --> /tmp/dojo-binary-search-1.almd:6:35
  hint: Remove the ';'. Almide uses newlines to separate statements.
  |
6 |         let mid = (low + high) / 2;
  |                                   ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-1.almd:6:20
  in variable low
  hint: Check the variable name
  |
6 |         let mid = (low + high) / 2;
  |                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-1.almd:6:26
  in variable high
  hint: Check the variable name
  |
6 |         let mid = (low + high) / 2;
  |                          ^^^^
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
    fn search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
        if low > high {
            return none;
        }
        let mid = (low + high) / 2;
        let mid_e = list.get(xs, mid);
        match mid_e {
            some(mid) => {
                if mid == target {
                    return some(mid);
                } else if mid < target {
                    return search_recursive(xs, target, mid + 1, high);
                } else {
                    return search_recursive(xs, target, low, mid - 1);
                }
            }
            none => {
                return search_recursive(xs, target, low, mid - 1);
            }
        }
    }
    let len = list.len(xs);
    if len == 0 {
        return none;
    }
    search_recursive(xs, target, 0, len - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected expression at line 2:5 (got Fn 'fn')
  --> /tmp/dojo-binary-search-2.almd:2:5
  |
2 |     fn search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
  |     ^
error: Expected Then at line 3:23 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:3:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |         if low > high {
  |                       ^
error: Semicolons are not used in Almide at line 6:35
  --> /tmp/dojo-binary-search-2.almd:6:35
  hint: Remove the ';'. Almide uses newlines to separate statements.
  |
6 |         let mid = (low + high) / 2;
  |                                   ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-2.almd:6:20
  in variable low
  hint: Check the variable name
  |
6 |         let mid = (low + high) / 2;
  |                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-2.almd:6:26
  in variable high
  hint: Check the variable name
  |
6 |         let mid = (low + high) / 2;
  |                          ^^^^
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
    fn search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
        if low > high {
            return none;
        }
        let mid = (low + high) / 2;
        let mid_e = list.get(xs, mid);
        match mid_e {
            some(mid) => {
                if mid == target {
                    return some(mid);
                } else if mid < target {
                    return search_recursive(xs, target, mid + 1, high);
                } else {
                    return search_recursive(xs, target, low, mid - 1);
                }
            }
            none => {
                return search_recursive(xs, target, low, mid - 1);
            }
        }
    }
    let len = list.len(xs);
    if len == 0 {
        return none;
    }
    search_recursive(xs, target, 0, len - 1)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected expression at line 2:5 (got Fn 'fn')
  --> /tmp/dojo-binary-search-3.almd:2:5
  |
2 |     fn search_recursive(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] {
  |     ^
error: Expected Then at line 3:23 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:3:23
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
3 |         if low > high {
  |                       ^
error: Semicolons are not used in Almide at line 6:35
  --> /tmp/dojo-binary-search-3.almd:6:35
  hint: Remove the ';'. Almide uses newlines to separate statements.
  |
6 |         let mid = (low + high) / 2;
  |                                   ^
error[E003]: undefined variable 'low'
  --> /tmp/dojo-binary-search-3.almd:6:20
  in variable low
  hint: Check the variable name
  |
6 |         let mid = (low + high) / 2;
  |                    ^^^
error[E003]: undefined variable 'high'
  --> /tmp/dojo-binary-search-3.almd:6:26
  in variable high
  hint: Check the variable name
  |
6 |         let mid = (low + high) / 2;
  |                          ^^^^
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
