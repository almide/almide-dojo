# title-case

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let 
    words = string.split(s, " ")
    capitalized_words = list.map(words, (word) => string.capitalize(string.to_lower(word)))
  in 
    string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: Expected identifier at line 2:7 (got Newline '')
  --> /tmp/dojo-title-case-0.almd:2:7
  |
2 |   let
  |       ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-title-case-0.almd:5:3
  |
5 |   in
  |   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-title-case-0.almd:4:34
  in variable words
  hint: Check the variable name
  |
4 |     capitalized_words = list.map(words, (word) => string.capitalize(string.to_lower(word)))
  |                                  ^^^^^
error[E003]: undefined variable 'capitalized_words'
  --> /tmp/dojo-title-case-0.almd:6:17
  in variable capitalized_words
  hint: Check the variable name
  |
6 |     string.join(capitalized_words, " ")
  |                 ^^^^^^^^^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn title_case(s: String) -> String = 
  string.join(
    list.map(string.split(s, " "), (word) => string.capitalize(string.to_lower(word))), 
    " "
  )
```
