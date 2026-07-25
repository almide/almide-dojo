# anagram-check

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean = (s) => 
            string.chars(s) 
            |> list.filter((x) => not(string.is_whitespace(x)))
            |> list.map((x) => string.to_lower(x))
        sorted_a = clean(a) |> list.sort
        sorted_b = clean(b) |> list.sort
    in 
        sorted_a == sorted_b
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 9:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:9:5
  |
9 |     in
  |     ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:7:26
  in call to clean()
  hint: Check the function name
  |
7 |         sorted_a = clean(a) |> list.sort
  |                          ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:8:26
  in call to clean()
  hint: Check the function name
  |
8 |         sorted_b = clean(b) |> list.sort
  |                          ^
error[E003]: undefined variable 'sorted_a'
  --> /tmp/dojo-anagram-check-0.almd:10:9
  in variable sorted_a
  hint: Check the variable name
   |
10 |         sorted_a == sorted_b
   |         ^^^^^^^^
error[E003]: undefined variable 'sorted_b'
  --> /tmp/dojo-anagram-check-0.almd:10:21
  in variable sorted_b
  hint: Check the variable name
   |
10 |         sorted_a == sorted_b
   |                     ^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let clean = (s) => 
        string.chars(s) 
        |> list.filter((x) => not(string.is_whitespace(x)))
        |> list.map((x) => string.to_lower(x))
    in 
        list.sort(clean(a)) == list.sort(clean(b))
```
