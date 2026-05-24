# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] {
    let len = list.len(xs);
    let (mut low, mut high) = (0, len - 1);

    while low <= high {
        let mid = (low + high) / 2;
        let mid_val = list.get(xs, mid).unwrap_or(-1);

        if mid_val == target {
            return some(mid);
        } else if mid_val < target {
            low = mid + 1;
        } else {
            high = mid - 1;
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
    let len = list.len(xs);
    let (mut low, mut high) = (0, len - 1);

    while low < high {
        let mid = (low + high) / 2;
        let mid_val = list.get(xs, mid).unwrap_or(-1);

        if mid_val == target {
            return some(mid);
        } else if mid_val < target {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }

    none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected Then at line 9:30 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:9:30
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |         if mid_val == target {
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:11 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:11:11
   |
11 |         } else if mid_val < target {
   |           ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:3:41
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
3 |     let (mut low, mut high) = (0, len - 1);
  |                                         ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    let len = list.len(xs);
    let (mut low, mut high) = (0, len - 1);

    while low <= high {
        let mid = (low + high) / 2;
        let mid_val = list.get(xs, mid).unwrap_or(-1);

        if mid_val == target {
            return some(mid);
        } else if mid_val < target {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }

    none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected Then at line 9:30 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:9:30
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |         if mid_val == target {
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:11 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:11:11
   |
11 |         } else if mid_val < target {
   |           ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:3:41
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
3 |     let (mut low, mut high) = (0, len - 1);
  |                                         ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
    let len = list.len(xs);
    let (mut low, mut high) = (0, len - 1);

    while low <= high {
        let mid = (low + high) / 2;
        let mid_val = list.get(xs, mid).unwrap_or(-1);

        if mid_val == target {
            return some(mid);
        } else if mid_val < target {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }

    none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected Then at line 9:30 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:9:30
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |         if mid_val == target {
  |                              ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:11 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:11:11
   |
11 |         } else if mid_val < target {
   |           ^
error[E001]: type mismatch in fn 'binary_search': expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:3:41
  in fn 'binary_search'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Option[Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Option[Int]
  |
3 |     let (mut low, mut high) = (0, len - 1);
  |                                         ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
