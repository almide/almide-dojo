# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let low = 0
  let high = list.len(xs) - 1

  while low <= high {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid)

    if mid_val == some(target) {
      return mid
    } else if mid_val == none {
      return none
    } else if target < mid_val {
      high = mid - 1
    } else {
      low = mid + 1
    }
  }

  none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected Then at line 9:32 (got LBrace '{')
  --> /tmp/dojo-binary-search-0.almd:9:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if mid_val == some(target) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:7 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:11:7
   |
11 |     } else if mid_val == none {
   |       ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-0.almd:10:7
  in variable mid
  hint: Check the variable name
   |
10 |       mid
   |       ^^^

3 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let low = 0
  let high = list.len(xs) - 1

  while low <= high {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid)

    if mid_val == some(target) {
      return mid
    } else if mid_val == none {
      return none
    } else if target < mid_val {
      high = mid - 1
    } else {
      low = mid + 1
    }
  }

  none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected Then at line 9:32 (got LBrace '{')
  --> /tmp/dojo-binary-search-1.almd:9:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if mid_val == some(target) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:7 (got Else 'else')
  --> /tmp/dojo-binary-search-1.almd:11:7
   |
11 |     } else if mid_val == none {
   |       ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-1.almd:10:7
  in variable mid
  hint: Check the variable name
   |
10 |       mid
   |       ^^^

3 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let low = 0
  let high = list.len(xs) - 1

  while low <= high {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid)

    if mid_val == some(target) {
      return mid
    } else if mid_val == none {
      return none
    } else if target < mid_val {
      high = mid - 1
    } else {
      low = mid + 1
    }
  }

  none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected Then at line 9:32 (got LBrace '{')
  --> /tmp/dojo-binary-search-2.almd:9:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if mid_val == some(target) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:7 (got Else 'else')
  --> /tmp/dojo-binary-search-2.almd:11:7
   |
11 |     } else if mid_val == none {
   |       ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-2.almd:10:7
  in variable mid
  hint: Check the variable name
   |
10 |       mid
   |       ^^^

3 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = {
  let low = 0
  let high = list.len(xs) - 1

  while low <= high {
    let mid = (low + high) / 2
    let mid_val = list.get(xs, mid)

    if mid_val == some(target) {
      return mid
    } else if mid_val == none {
      return none
    } else if target < mid_val {
      high = mid - 1
    } else {
      low = mid + 1
    }
  }

  none
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected Then at line 9:32 (got LBrace '{')
  --> /tmp/dojo-binary-search-3.almd:9:32
  hint: if requires 'then', not '{'. Write: if x > 0 then "positive" else "negative"
  |
9 |     if mid_val == some(target) {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 11:7 (got Else 'else')
  --> /tmp/dojo-binary-search-3.almd:11:7
   |
11 |     } else if mid_val == none {
   |       ^
error[E003]: undefined variable 'mid'
  --> /tmp/dojo-binary-search-3.almd:10:7
  in variable mid
  hint: Check the variable name
   |
10 |       mid
   |       ^^^

3 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
