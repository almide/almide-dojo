# count-vowels

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  let chars = string.chars(s) 
  in list.count(chars, (c) => 
    match c {
      "a" => true,
      "e" => true,
      "i" => true,
      "o" => true,
      "u" => true,
      _ => false
    }
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Expected expression at line 3:3 (got In 'in')
  --> /tmp/dojo-count-vowels-0.almd:3:3
  |
3 |   in list.count(chars, (c) =>
  |   ^
error: Expected expression at line 12:3 (got RParen ')')
  --> /tmp/dojo-count-vowels-0.almd:12:3
   |
12 |   )
   |   ^
error[E003]: undefined variable 'c'
  --> /tmp/dojo-count-vowels-0.almd:4:11
  in variable c
  hint: Check the variable name
  |
4 |     match c {
  |           ^
error[E001]: type mismatch in fn 'count_vowels': expected Int but got Unit
  --> /tmp/dojo-count-vowels-0.almd:10:12
  in fn 'count_vowels'
  hint: Fix the expression type or change the expected type
   |
10 |       _ => false
   |            ^^^^^

4 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  list.count(string.chars(s), (c) => 
    match c {
      "a" => true,
      "e" => true,
      "i" => true,
      "o" => true,
      "u" => true,
      _ => false
    }
  )
```
