# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let 
    clean = (s) => 
      string.chars(s) 
      |> list.filter((c) => not(string.is_whitespace(c)))
      |> list.map((c) => string.to_lower(c))
    sorted_a = clean(a) |> list.sort
    sorted_b = clean(b) |> list.sort
  in 
    sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 9:3 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:9:3
  |
9 |   in
  |   ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:7:22
  in call to clean()
  hint: Check the function name
  |
7 |     sorted_a = clean(a) |> list.sort
  |                      ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:8:22
  in call to clean()
  hint: Check the function name
  |
8 |     sorted_b = clean(b) |> list.sort
  |                      ^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-0.almd:10:5
  in variable sorted_a
  hint: Check the variable name
   |
10 |     sorted_a == sorted_b
   |     ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-0.almd:10:17
  in variable sorted_b
  hint: Check the variable name
   |
10 |     sorted_a == sorted_b
   |                 ^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let 
    clean_a = string.chars(a) 
              |> list.filter((c) => not(string.is_whitespace(c)))
              |> list.map((c) => string.to_lower(c))
              |> list.sort
    clean_b = string.chars(b) 
              |> list.filter((c) => not(string.is_whitespace(c)))
              |> list.map((c) => string.to_lower(c))
              |> list.sort
  in 
    clean_a == clean_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 11:3 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:11:3
   |
11 |   in
   |   ^
error[E003]: undefined variable 'clean_a'
  --> /tmp/dojo-anagram-check-1.almd:12:5
  in variable clean_a
  hint: Check the variable name
   |
12 |     clean_a == clean_b
   |     ^^^^^^^
error[E003]: undefined variable 'clean_b'
  --> /tmp/dojo-anagram-check-1.almd:12:16
  in variable clean_b
  hint: Check the variable name
   |
12 |     clean_a == clean_b
   |                ^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  string.chars(a) 
  |> list.filter((c) => not(string.is_whitespace(c)))
  |> list.map((c) => string.to_lower(c))
  |> list.sort 
  == 
  string.chars(b) 
  |> list.filter((c) => not(string.is_whitespace(c)))
  |> list.map((c) => string.to_lower(c))
  |> list.sort
```
