# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] {
    let n = list.len(xs);
    let low = 0;
    let high = n - 1;
    while low <= high {
        let mid = (low + high) / 2;
        match list.get(xs, mid) {
            some(mid_value) => {
                if mid_value == target {
                    return some(mid);
                } else if mid_value > target {
                    high = mid - 1;
                } else {
                    low = mid + 1;
                }
            },
            none => {
                return none;
            }
        }
    }
    none
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

1 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    let n = list.len(xs);
    let low = 0;
    let high = n - 1;
    while low <= high {
        let mid = (low + high) / 2;
        match list.get(xs, mid) {
            some(mid_value) => {
                if mid_value == target {
                    return some(mid);
                } else if mid_value > target {
                    high = mid - 1;
                } else {
                    low = mid + 1;
                }
            },
            none => {
                return none;
            }
        }
    }
    none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected Then at line 9:40 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:9:40
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |                 if mid_value == target {
  |                                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:19 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:13:19
   |
13 |                 } else {
   |                   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:12:28
  in variable mid
  hint: Check the variable name
   |
12 |                     high = mid - 1;
   |                            ^^^
error[E009]: cannot reassign immutable binding 'high'
  --> /tmp/dojo-binary-search-1.almd:12:34
  in high = ...
  hint: Use 'var high = ...' instead of 'let high = ...' to declare a mutable variable
  try:
      // let high = ...  →  var high = ...
      var high = <initial value>
   |
 4 |     let high = n - 1;
   |     -------------------- 'high' declared here
...
12 |                     high = mid - 1;
   |                                  ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:12:34
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
12 |                     high = mid - 1;
   |                                  ^

5 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    let n = list.len(xs);
    var low = 0;
    var high = n - 1;
    while low <= high {
        let mid = (low + high) / 2;
        match list.get(xs, mid) {
            some(mid_value) => {
                if mid_value == target {
                    return some(mid);
                } else if mid_value > target {
                    high = mid - 1;
                } else {
                    low = mid + 1;
                }
            },
            none => {
                return none;
            }
        }
    }
    none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected Then at line 9:40 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:9:40
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |                 if mid_value == target {
  |                                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:19 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:13:19
   |
13 |                 } else {
   |                   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:12:28
  in variable mid
  hint: Check the variable name
   |
12 |                     high = mid - 1;
   |                            ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:12:34
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
12 |                     high = mid - 1;
   |                                  ^

4 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    let n = list.len(xs);
    var low = 0;
    var high = n - 1;
    while low <= high {
        let mid = (low + high) / 2;
        match list.get(xs, mid) {
            some(mid_value) => {
                if mid_value == target {
                    return some(mid);
                } else if mid_value > target {
                    high = mid - 1;
                } else {
                    low = mid + 1;
                }
            },
            none => {
                return none;
            }
        }
    }
    return none;
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected Then at line 9:40 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:9:40
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |                 if mid_value == target {
  |                                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 13:19 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:13:19
   |
13 |                 } else {
   |                   ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:12:28
  in variable mid
  hint: Check the variable name
   |
12 |                     high = mid - 1;
   |                            ^^^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:12:34
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
   |
12 |                     high = mid - 1;
   |                                  ^

4 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
