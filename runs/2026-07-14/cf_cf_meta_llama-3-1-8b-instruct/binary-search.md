# binary-search

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  match xs {
    some(x :: xs) =>
      let mid = list.len(xs) / 2
      let mid_val = list.get(xs, mid)
      if mid_val == some(target) then some(mid)
      else if target < mid_val then binary_search(list.drop(xs, 1), target)
      else if target > mid_val then binary_search(list.drop_end(xs, 1), target)
      else binary_search(list.drop(xs, 1), target)
    none => none
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: Expected RParen at line 3:12 (got Colon ':')
  --> /tmp/dojo-binary-search-0.almd:3:12
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
3 |     some(x :: xs) =>
  |            ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  match xs {
    some(x :: xs) =>
      let mid = list.len(xs) / 2
      let mid_val = list.get(xs, mid)
      if mid_val == some(target) then some(mid)
      else if target < mid_val.unwrap_or(0) then binary_search(list.drop(xs, 1), target)
      else if target > mid_val.unwrap_or(0) then binary_search(list.drop_end(xs, 1), target)
      else binary_search(list.drop(xs, 1), target)
    none => none
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected RParen at line 3:12 (got Colon ':')
  --> /tmp/dojo-binary-search-1.almd:3:12
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
3 |     some(x :: xs) =>
  |            ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  match xs {
    some(x :: xs) =>
      let mid = list.len(xs) / 2
      let mid_val = list.get(xs, mid)
      if mid_val == some(target) then some(mid)
      else if target < mid_val.unwrap_or(0) then 
        match binary_search(list.drop(xs, 1), target) {
          some(i) => some(i + mid)
          none => none
        }
      else if target > mid_val.unwrap_or(0) then 
        match binary_search(list.drop_end(xs, 1), target) {
          some(i) => some(i + mid + 1)
          none => none
        }
      else binary_search(list.drop(xs, 1), target)
    none => none
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: Expected RParen at line 3:12 (got Colon ':')
  --> /tmp/dojo-binary-search-2.almd:3:12
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
3 |     some(x :: xs) =>
  |            ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  match xs {
    some(x :: xs) =>
      let mid = list.len(xs) / 2
      let mid_val = list.get(xs, mid)
      if mid_val == some(target) then some(mid)
      else if target < mid_val.unwrap_or(0) then 
        match binary_search(list.drop(xs, 1), target) {
          some(i) => some(i + mid)
          none => none
        }
      else if target > mid_val.unwrap_or(0) then 
        match binary_search(list.drop_end(xs, 1), target) {
          some(i) => some(i + mid + 1)
          none => none
        }
      else binary_search(list.drop(xs, 1), target)
    none => none
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: Expected RParen at line 3:12 (got Colon ':')
  --> /tmp/dojo-binary-search-3.almd:3:12
  hint: Missing ')'. Check for an unclosed '(' earlier in this expression
  |
3 |     some(x :: xs) =>
  |            ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
