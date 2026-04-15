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
      let lo = 0
      let hi = list.len(xs) - 1
      let result = binary_search_helper(xs, target, lo, hi)
      match result {
        some(index) => some(index)
        none => none
      }
  }

fn binary_search_helper(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = 
  match hi - lo {
    0 => 
      match list.get(xs, lo) {
        some(x) => 
          if x == target then some(lo) else none
          else none
        none => none
      }
    _ => 
      let mid = (lo + hi) / 2
      match list.get(xs, mid) {
        some(x) => 
          if x == target then some(mid)
          else if x < target then binary_search_helper(xs, target, mid + 1, hi)
          else binary_search_helper(xs, target, lo, mid - 1)
        none => none
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let lo = 0
  |       ^^^
error: Expected pattern at line 20:11 (got Else 'else')
  --> /tmp/dojo-binary-search-0.almd:20:11
  hint: Valid patterns: _, variable, Type(args), (a, b), [], [a, b], some(x), ok(x), err(x), none, true, false, 42, "text"
   |
20 |           else none
   |           ^

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
      let lo = 0
      let hi = list.len(xs) - 1
      let result = binary_search_helper(xs, target, lo, hi)
      match result {
        some(index) => some(index)
        none => none
      }
  }

fn binary_search_helper(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = 
  match hi - lo {
    0 => 
      match list.get(xs, lo) {
        some(x) => 
          if x == target then some(lo)
          else none
        none => none
      }
    _ => 
      let mid = (lo + hi) / 2
      match list.get(xs, mid) {
        some(x) => 
          if x == target then some(mid)
          else if x < target then binary_search_helper(xs, target, mid + 1, hi)
          else binary_search_helper(xs, target, lo, mid - 1)
        none => none
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let lo = 0
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-1.almd:24:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
24 |       let mid = (lo + hi) / 2
   |       ^^^

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
      let lo = 0
      let hi = list.len(xs) - 1
      binary_search_helper(xs, target, lo, hi)
  }

fn binary_search_helper(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = 
  match hi - lo {
    0 => 
      match list.get(xs, lo) {
        some(x) => 
          if x == target then some(lo)
          else none
        none => none
      }
    _ => 
      let mid = (lo + hi) / 2
      match list.get(xs, mid) {
        some(x) => 
          if x == target then some(mid)
          else if x < target then binary_search_helper(xs, target, mid + 1, hi)
          else binary_search_helper(xs, target, lo, mid - 1)
        none => none
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let lo = 0
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-2.almd:20:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |       let mid = (lo + hi) / 2
   |       ^^^

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
      let lo = 0
      let hi = list.len(xs) - 1
      binary_search_helper(xs, target, lo, hi)
  }

fn binary_search_helper(xs: List[Int], target: Int, lo: Int, hi: Int) -> Option[Int] = 
  match hi - lo {
    0 => 
      match list.get(xs, lo) {
        some(x) => 
          if x == target then some(lo)
          else none
        none => none
      }
    _ => 
      let mid = (lo + hi) / 2
      match list.get(xs, mid) {
        some(x) => 
          if x == target then some(mid)
          else if x < target then binary_search_helper(xs, target, mid + 1, hi)
          else binary_search_helper(xs, target, lo, mid - 1)
        none => none
      }
  }

fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  match xs {
    [] => none
    _ =>
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:5:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |       let lo = 0
  |       ^^^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-3.almd:20:7
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
   |
20 |       let mid = (lo + hi) / 2
   |       ^^^
error: Expected expression at line 35:1 (got Test 'test')
  --> /tmp/dojo-binary-search-3.almd:35:1
   |
35 | test "binary_search empty" { assert_eq(binary_search([], 1), none) }
   | ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
