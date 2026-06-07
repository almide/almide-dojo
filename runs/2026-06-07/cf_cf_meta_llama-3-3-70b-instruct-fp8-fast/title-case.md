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
    parts = string.split(s, " ")
    capitalized_parts = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  in
    string.join(capitalized_parts, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-title-case-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 5:3 (got In 'in')
  --> /tmp/dojo-title-case-0.almd:5:3
  |
5 |   in
  |   ^
error[E003]: undefined variable 'parts'
  --> /tmp/dojo-title-case-0.almd:4:34
  in variable parts
  hint: Check the variable name
  |
4 |     capitalized_parts = list.map(parts, (word) => string.capitalize(string.to_lower(word)))
  |                                  ^^^^^
error[E003]: undefined variable 'capitalized_parts'
  --> /tmp/dojo-title-case-0.almd:6:17
  in variable capitalized_parts
  hint: Check the variable name
  |
6 |     string.join(capitalized_parts, " ")
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
