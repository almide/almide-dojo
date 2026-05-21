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
        clean = (string.to_lower >> 
                 string.chars >> 
                 list.filter((x) => not(string.is_whitespace(x))))
    in
        list.sort(clean(a)) == list.sort(clean(b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-0.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 6:5 (got In 'in')
  --> /tmp/dojo-anagram-check-0.almd:6:5
  |
6 |     in
  |     ^
error[E004]: list.filter() expects 2 argument(s) but got 1
  --> /tmp/dojo-anagram-check-0.almd:5:62
  in call to list.filter()
  hint: Check the number of arguments
  try:
      // list.filter() takes 2 arg(s) — you passed 1
      list.filter(<xs: List[A]>, <f: fn(A) -> Bool>)
  |
5 |                  list.filter((x) => not(string.is_whitespace(x))))
  |                                                              ^
error[E005]: argument 'xs' expects List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-0.almd:5:62
  in call to list.filter()
  hint: Fix the argument type
  |
5 |                  list.filter((x) => not(string.is_whitespace(x))))
  |                                                              ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:7:25
  in call to clean()
  hint: Check the function name
  |
7 |         list.sort(clean(a)) == list.sort(clean(b))
  |                         ^
error[E002]: undefined function 'clean'
  --> /tmp/dojo-anagram-check-0.almd:7:48
  in call to clean()
  hint: Check the function name
  |
7 |         list.sort(clean(a)) == list.sort(clean(b))
  |                                                ^
error[E001]: type mismatch in call to list.filter(): expected List[A] but got fn(String) -> Bool
  --> /tmp/dojo-anagram-check-0.almd:5:62
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
5 |                  list.filter((x) => not(string.is_whitespace(x))))
  |                                                              ^

7 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let 
        clean_str = (s: String) => 
            string.chars(s) 
            |> list.filter((x) => not(string.is_whitespace(x))) 
            |> list.map(string.to_lower)
    in 
        list.sort(clean_str(a)) == list.sort(clean_str(b))
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-1.almd
error: Expected identifier at line 2:9 (got Newline '')
  --> /tmp/dojo-anagram-check-1.almd:2:9
  |
2 |     let
  |         ^
error: Expected expression at line 7:5 (got In 'in')
  --> /tmp/dojo-anagram-check-1.almd:7:5
  |
7 |     in
  |     ^
error[E002]: undefined function 'clean_str'
  --> /tmp/dojo-anagram-check-1.almd:8:29
  in call to clean_str()
  hint: Check the function name
  |
8 |         list.sort(clean_str(a)) == list.sort(clean_str(b))
  |                             ^
error[E002]: undefined function 'clean_str'
  --> /tmp/dojo-anagram-check-1.almd:8:56
  in call to clean_str()
  hint: Check the function name
  |
8 |         list.sort(clean_str(a)) == list.sort(clean_str(b))
  |                                                        ^

4 error(s) found
Compile error for /tmp/dojo-anagram-check-1.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
    let clean_str = (s: String) => 
        string.chars(s) 
        |> list.filter((x) => not(string.is_whitespace(x))) 
        |> list.map((x) => string.to_lower(x))
    in 
    list.sort(clean_str(a)) == list.sort(clean_str(b))
```
