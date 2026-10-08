# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.fold(s.chars(), true, (acc, c) => 
    if acc then 
      match s.chars().reverse().find_index(c) { 
        some(i) => acc && i == c.index_of(c) 
        none => false 
      } 
    else false 
  )
```

**Diagnostic:**

```
error: '&&' is not valid in Almide at line 5:24
  --> /tmp/dojo-is-palindrome-0.almd:5:24
  here: some(i) => acc && i == c.index_of(c)
  hint: Use 'and' for logical AND. Example: if a and b then ...
  |
5 |         some(i) => acc && i == c.index_of(c)
  |                        ^

1 error(s) found
FAILED: /tmp/dojo-is-palindrome-0.almd
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.fold(s.chars(), true, (acc, c) => 
    if acc then 
      match s.chars().reverse().find_index(c) { 
        some(i) => acc and i == c.index_of(c) 
        none => false 
      } 
    else false 
  )
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(String) -> Bool but got String
  --> /tmp/dojo-is-palindrome-1.almd:4:13
  in call to list.find_index()
  here: match s.chars().reverse().find_index(c) {
  hint: Fix the argument type
...
4 |       match s.chars().reverse().find_index(c) {
  |             ^
error[E037]: operator '==' compares Int with Option[Int]
  --> /tmp/dojo-is-palindrome-1.almd:5:33
  in operator ==
  here: some(i) => acc and i == c.index_of(c)
  hint: Unwrap the Option operand first (`?? fallback`, or `match` on some/none) — or compare two Options
  |
5 |         some(i) => acc and i == c.index_of(c)
  |                                 ^

2 error(s) found
FAILED: /tmp/dojo-is-palindrome-1.almd
Compile error for /tmp/dojo-is-palindrome-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.fold(s.chars(), true, (acc, c) => 
    if acc then 
      match s.chars().reverse().find_index(c) { 
        some(i) => acc and i == s.chars().index_of(c) 
        none => false 
      } 
    else false 
  )
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(String) -> Bool but got String
  --> /tmp/dojo-is-palindrome-2.almd:4:13
  in call to list.find_index()
  here: match s.chars().reverse().find_index(c) {
  hint: Fix the argument type
...
4 |       match s.chars().reverse().find_index(c) {
  |             ^
error[E037]: operator '==' compares Int with Option[Int]
  --> /tmp/dojo-is-palindrome-2.almd:5:33
  in operator ==
  here: some(i) => acc and i == s.chars().index_of(c)
  hint: Unwrap the Option operand first (`?? fallback`, or `match` on some/none) — or compare two Options
  |
5 |         some(i) => acc and i == s.chars().index_of(c)
  |                                 ^

2 error(s) found
FAILED: /tmp/dojo-is-palindrome-2.almd
Compile error for /tmp/dojo-is-palindrome-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = 
  list.fold(s.chars(), true, (acc, c) => 
    if acc then 
      match s.chars().reverse().find_index(c) { 
        some(i) => acc and (s.chars().index_of(c) ?? -1) == i 
        none => false 
      } 
    else false 
  )
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(String) -> Bool but got String
  --> /tmp/dojo-is-palindrome-3.almd:4:13
  in call to list.find_index()
  here: match s.chars().reverse().find_index(c) {
  hint: Fix the argument type
...
4 |       match s.chars().reverse().find_index(c) {
  |             ^

1 error(s) found
FAILED: /tmp/dojo-is-palindrome-3.almd
Compile error for /tmp/dojo-is-palindrome-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
