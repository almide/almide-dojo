# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let 
    clean = (s) => list.filter(string.chars(s), (c) => c != " ")
    sorted_chars = (s) => list.sort(clean(string.to_lower(s)))
  in 
  sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:5:3
  |
5 |   in
  |   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:4:59
  in call to clean()
  hint: Check the function name
  |
4 |     sorted_chars = (s) => list.sort(clean(string.to_lower(s)))
  |                                                           ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:6:16
  in call to sorted_chars()
  hint: Check the function name
  |
6 |   sorted_chars(a) == sorted_chars(b)
  |                ^
error[E002]: undefined function 'sorted_chars'
  --> /tmp/dojo-anagram-check-0.almd:6:35
  in call to sorted_chars()
  hint: Check the function name
  |
6 |   sorted_chars(a) == sorted_chars(b)
  |                                   ^

5 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let clean = (s) => list.filter(string.chars(s), (c) => c != " ")
  let sorted_chars = (s) => list.sort(clean(string.to_lower(s)))
  in sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected expression at line 4:3 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:4:3
  |
4 |   in sorted_chars(a) == sorted_chars(b)
  |   ^
error[E001]: type mismatch in fn 'is_anagram': expected Bool but got Unit
  --> /tmp/dojo-anagram-check-1.almd:3:39
  in fn 'is_anagram'
  hint: Fix the expression type or change the expected type
  |
3 |   let sorted_chars = (s) => list.sort(clean(string.to_lower(s)))
  |                                       ^^^^^

2 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let clean = (s) => list.filter(string.chars(s), (c) => c != " ")
  let sorted_chars = (s) => list.sort(clean(string.to_lower(s)))
  sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-2.almd
Compile error for /tmp/dojo-anagram-check-2.almd:
error: could not compile `almide-out` (bin "almide-out" test) due to 1 previous error

FAILED: /tmp/dojo-anagram-check-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let clean = (s) => list.filter(string.chars(s), (c) => c != " ")
  let sorted_chars = (s) => list.sort(clean(string.to_lower(s)), string.compare)
  sorted_chars(a) == sorted_chars(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-3.almd
error[E003]: undefined variable 'string'
  --> /tmp/dojo-anagram-check-3.almd:3:66
  in variable string
  hint: Check the variable name
  |
3 |   let sorted_chars = (s) => list.sort(clean(string.to_lower(s)), string.compare)
  |                                                                  ^^^^^^
error[E004]: list.sort() expects 1 argument(s) but got 2
  --> /tmp/dojo-anagram-check-3.almd:3:66
  in call to list.sort()
  hint: Check the number of arguments
  |
3 |   let sorted_chars = (s) => list.sort(clean(string.to_lower(s)), string.compare)
  |                                                                  ^^^^^^

2 error(s) found
Compile error for /tmp/dojo-anagram-check-3.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-3.almd

1/1 test file(s) failed

```
