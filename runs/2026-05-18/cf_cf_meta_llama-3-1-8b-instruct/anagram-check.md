# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a = string.to_lower(a) |> string.chars |> list.filter(x => x != " ")
  let b = string.to_lower(b) |> string.chars |> list.filter(x => x != " ")
  list.sort(a) == list.sort(b)
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-anagram-check-0.almd:2:63
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   let a = string.to_lower(a) |> string.chars |> list.filter(x => x != " ")
  |                                                               ^^
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-anagram-check-0.almd:3:63
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
3 |   let b = string.to_lower(b) |> string.chars |> list.filter(x => x != " ")
  |                                                               ^^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:4:13
  in call to list.sort()
  hint: Fix the argument type
  |
4 |   list.sort(a) == list.sort(b)
  |             ^
error[E005]: argument 'xs' expects List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:4:29
  in call to list.sort()
  hint: Fix the argument type
  |
4 |   list.sort(a) == list.sort(b)
  |                             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:4:13
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
4 |   list.sort(a) == list.sort(b)
  |             ^
error[E001]: type mismatch in call to list.sort(): expected List[A] but got String
  --> /tmp/dojo-anagram-check-0.almd:4:29
  in call to list.sort()
  hint: Fix the expression type or change the expected type
  |
4 |   list.sort(a) == list.sort(b)
  |                             ^

6 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = 
  let a = string.to_lower(a) |> string.chars |> list.filter((x) => x != " ")
  let b = string.to_lower(b) |> string.chars |> list.filter((x) => x != " ")
  list.sort(a) == list.sort(b)
```
