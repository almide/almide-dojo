# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a_chars = string.to_lower(a) |> string.chars |> list.filter(x => x != ' ')
  let b_chars = string.to_lower(b) |> string.chars |> list.filter(x => x != ' ')
  list.sort(a_chars) == list.sort(b_chars)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-anagram-check-0.almd:2:69
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let a_chars = string.to_lower(a) |> string.chars |> list.filter(x => x != ' ')
  |                                                                     ^^
error: Lambda parameter must be wrapped in parentheses at line 2:69
  --> /tmp/dojo-anagram-check-0.almd:2:69
  |
2 |   let a_chars = string.to_lower(a) |> string.chars |> list.filter(x => x != ' ')
  |                                                                     ^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-anagram-check-0.almd:3:69
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   let b_chars = string.to_lower(b) |> string.chars |> list.filter(x => x != ' ')
  |                                                                     ^^
error: Lambda parameter must be wrapped in parentheses at line 3:69
  --> /tmp/dojo-anagram-check-0.almd:3:69
  |
3 |   let b_chars = string.to_lower(b) |> string.chars |> list.filter(x => x != ' ')
  |                                                                     ^
error[E003]: undefined variable 'a_chars'
  --> /tmp/dojo-anagram-check-0.almd:4:13
  in variable a_chars
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |             ^^^^^^^
error[E003]: undefined variable 'b_chars'
  --> /tmp/dojo-anagram-check-0.almd:4:35
  in variable b_chars
  hint: Check the variable name
  |
4 |   list.sort(a_chars) == list.sort(b_chars)
  |                                   ^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a_chars = string.to_lower(a) |> string.chars |> list.filter((x) => x != ' ')
  let b_chars = string.to_lower(b) |> string.chars |> list.filter((x) => x != ' ')
  list.sort(a_chars) == list.sort(b_chars)
```
