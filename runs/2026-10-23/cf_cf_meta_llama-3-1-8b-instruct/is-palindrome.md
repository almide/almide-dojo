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
        some(_) => true, 
        none => false 
      } 
    else false)
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(String) -> Bool but got String
  --> /tmp/dojo-is-palindrome-0.almd:4:13
  in call to list.find_index()
  here: match s.chars().reverse().find_index(c) {
  hint: Fix the argument type
...
4 |       match s.chars().reverse().find_index(c) {
  |             ^

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
        some(_) => true, 
        none => list.fold(s.chars(), false, (acc, d) => 
          if d == c then acc else false) 
      } 
    else false)
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

1 error(s) found
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
        some(_) => true, 
        none => list.fold(s.chars(), false, (acc, d) => 
          if d == c then acc else false) 
    } else false)
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

1 error(s) found
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
        some(_) => true, 
        none => list.fold(s.chars(), false, (acc, d) => 
          if d == c then acc else false) 
    } else false)
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
