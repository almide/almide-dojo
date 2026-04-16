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
    [] => none
    _ => 
      let low = 0
      let high = list.len(xs) - 1
      match binary_search_helper(xs, target, low, high) {
        some(index) => some(index)
        none => none
      }
  }

fn binary_search_helper(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = 
  match (low, high) {
    (x, y) when x > y => none
    (x, y) when x == y => 
      match list.get(xs, x) {
        some(val) when val == target => some(x)
        _ => none
      }
    (x, y) => 
      let mid = (x + y) / 2
      match list.get(xs, mid) {
        some(val) when val == target => some(mid)
        some(val) when val < target => binary_search_helper(xs, target, mid + 1, high)
        some(val) when val > target => binary_search_helper(xs, target, low, mid - 1
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let low = 0
  |       ^^^
error: Expected FatArrow at line 15:12 (got Ident 'when')
  --> /tmp/dojo-binary-search-0.almd:15:12
   |
15 |     (x, y) when x > y => none
   |            ^

2 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  match xs {
    [] => none
    _ => 
      let low = 0
      let high = list.len(xs) - 1
      match binary_search_helper(xs, target, low, high) {
        some(index) => some(index)
        none => none
      }
  }

fn binary_search_helper(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = 
  match (low, high) {
    (x, y) when x > y => none
    (x, y) when x == y => 
      match list.get(xs, x) {
        some(val) when val == target => some(x)
        _ => none
      }
    (x, y) => 
      let mid = (x + y) / 2
      match list.get(xs, mid) {
        some(val) when val == target => some(mid)
        some(val) when val < target => binary_search_helper(xs, target, mid + 1, high)
        some(val) when val > target => binary_search_helper(xs, target, low, mid - 1
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let low = 0
  |       ^^^
error: Expected FatArrow at line 15:12 (got Ident 'when')
  --> /tmp/dojo-binary-search-1.almd:15:12
   |
15 |     (x, y) when x > y => none
   |            ^

2 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  match xs {
    [] => none
    _ => 
      let low = 0
      let high = list.len(xs) - 1
      match binary_search_helper(xs, target, low, high) {
        some(index) => some(index)
        none => none
      }
  }

fn binary_search_helper(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = 
  match (low, high) {
    (x, y) when x > y => none
    (x, y) when x == y => 
      match list.get(xs, x) {
        some(val) when val == target => some(x)
        _ => none
      }
    (x, y) => 
      let mid = (x + y) / 2
      match list.get(xs, mid) {
        some(val) when val == target => some(mid)
        some(val) when val < target => binary_search_helper(xs, target, mid + 1, high)
        some(val) when val > target => binary_search_helper(xs, target, low, mid - 1
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let low = 0
  |       ^^^
error: Expected FatArrow at line 15:12 (got Ident 'when')
  --> /tmp/dojo-binary-search-2.almd:15:12
   |
15 |     (x, y) when x > y => none
   |            ^

2 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  match xs {
    [] => none
    _ => 
      let low = 0
      let high = list.len(xs) - 1
      match binary_search_helper(xs, target, low, high) {
        some(index) => some(index)
        none => none
      }
  }

fn binary_search_helper(xs: List[Int], target: Int, low: Int, high: Int) -> Option[Int] = 
  match (low, high) {
    (x, y) when x > y => none
    (x, y) when x == y => 
      match list.get(xs, x) {
        some(val) when val == target => some(x)
        _ => none
      }
    (x, y) => 
      let mid = (x + y) / 2
      match list.get(xs, mid) {
        some(val) when val == target => some(mid)
        some(val) when val < target => binary_search_helper(xs, target, mid + 1, high)
        some(val) when val > target => binary_search_helper(xs, target, low, mid - 1
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let low = 0
  |       ^^^
error: Expected FatArrow at line 15:12 (got Ident 'when')
  --> /tmp/dojo-binary-search-3.almd:15:12
   |
15 |     (x, y) when x > y => none
   |            ^

2 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
