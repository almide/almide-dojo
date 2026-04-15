# binary-search

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E001`

## Attempts

### Attempt 1 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none 
  else 
    let low = 0
    let high = list.len(xs) - 1
    while low <= high do
      let mid = (low + high) / 2
      match list.get(xs, mid) {
        some(v) => 
          if v == target then some(mid) 
          else if v < target then 
            low = mid + 1
          else 
            high = mid - 1
        none => none
      }
    end
    match list.get(xs, low) {
      some(v) => if v == target then some(low) else none
      none => none
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-binary-search-0.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let low = 0
  |     ^^^
error: 'let' is not an expression in Almide at line 4:5
  --> /tmp/dojo-binary-search-0.almd:4:5
  |
4 |     let low = 0
  |     ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:23:58
  in call to binary_search()
  hint: Check the function name
   |
23 | test "binary_search empty" { assert_eq(binary_search([], 1), none) }
   |                                                          ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:24:66
  in call to binary_search()
  hint: Check the function name
   |
24 | test "binary_search single found" { assert_eq(binary_search([5], 5), some(0)) }
   |                                                                  ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:25:70
  in call to binary_search()
  hint: Check the function name
   |
25 | test "binary_search single not found" { assert_eq(binary_search([5], 3), none) }
   |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:26:71
  in call to binary_search()
  hint: Check the function name
   |
26 | test "binary_search first" { assert_eq(binary_search([1, 3, 5, 7, 9], 1), some(0)) }
   |                                                                       ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:27:72
  in call to binary_search()
  hint: Check the function name
   |
27 | test "binary_search middle" { assert_eq(binary_search([1, 3, 5, 7, 9], 5), some(2)) }
   |                                                                        ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:28:70
  in call to binary_search()
  hint: Check the function name
   |
28 | test "binary_search last" { assert_eq(binary_search([1, 3, 5, 7, 9], 9), some(4)) }
   |                                                                      ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:29:79
  in call to binary_search()
  hint: Check the function name
   |
29 | test "binary_search not found low" { assert_eq(binary_search([1, 3, 5, 7, 9], 0), none) }
   |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:30:79
  in call to binary_search()
  hint: Check the function name
   |
30 | test "binary_search not found mid" { assert_eq(binary_search([1, 3, 5, 7, 9], 4), none) }
   |                                                                               ^
error[E002]: undefined function 'binary_search'
  --> /tmp/dojo-binary-search-0.almd:31:80
  in call to binary_search()
  hint: Check the function name
   |
31 | test "binary_search not found high" { assert_eq(binary_search([1, 3, 5, 7, 9], 10), none) }
   |                                                                                ^^

11 error(s) found
Compile error for /tmp/dojo-binary-search-0.almd:
compile failed
FAILED: /tmp/dojo-binary-search-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none 
  else 
    {
      var low = 0
      var high = list.len(xs) - 1
      while low <= high do
        let mid = (low + high) / 2
        match list.get(xs, mid) {
          some(v) => 
            if v == target then some(mid) 
            else if v < target then 
              low = mid + 1
            else 
              high = mid - 1
          none => none
        }
      end
      match list.get(xs, low) {
        some(v) => if v == target then some(low) else none
        none => none
      }
    }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-1.almd
error: Expected LBrace at line 7:25 (got Ident 'do')
  --> /tmp/dojo-binary-search-1.almd:7:25
  |
7 |       while low <= high do
  |                         ^
error[E003]: undefined variable 'end'
  --> /tmp/dojo-binary-search-1.almd:18:7
  in variable end
  hint: Check the variable name
   |
18 |       end
   |       ^^^
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-1.almd:15:28
  in if branches
  hint: Fix the expression type or change the expected type
   |
15 |               high = mid - 1
   |                            ^

3 error(s) found
Compile error for /tmp/dojo-binary-search-1.almd:
compile failed
FAILED: /tmp/dojo-binary-search-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none 
  else 
  {
    var low = 0
    var high = list.len(xs) - 1
    while low <= high {
      let mid = (low + high) / 2
      match list.get(xs, mid) {
        some(v) => 
          if v == target then some(mid) 
          else if v < target then 
            low = mid + 1
          else 
            high = mid - 1
        none => none
      }
    }
    if low > high then none
    else 
      match list.get(xs, low) {
        some(v) => if v == target then some(low) else none
        none => none
      }
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-2.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-2.almd:15:26
  in if branches
  hint: Fix the expression type or change the expected type
   |
15 |             high = mid - 1
   |                          ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-2.almd:
compile failed
FAILED: /tmp/dojo-binary-search-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn binary_search(xs: List[Int], target: Int) -> Option[Int] = 
  if list.len(xs) == 0 then none 
  else 
  {
    var low = 0
    var high = list.len(xs) - 1
    while low <= high {
      let mid = (low + high) / 2
      match list.get(xs, mid) {
        some(v) => 
          if v == target then some(mid) 
          else if v < target then 
            low = mid + 1
          else 
            high = mid - 1
        none => none
      }
    }
    none
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-binary-search-3.almd
error[E001]: type mismatch in if branches: expected Option[Int] but got Unit
  --> /tmp/dojo-binary-search-3.almd:15:26
  in if branches
  hint: Fix the expression type or change the expected type
   |
15 |             high = mid - 1
   |                          ^

1 error(s) found
Compile error for /tmp/dojo-binary-search-3.almd:
compile failed
FAILED: /tmp/dojo-binary-search-3.almd

1/1 test file(s) failed

```
