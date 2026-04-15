# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int {
  string.chars(s) |> list.filter((c) => c == "a" || c == "e" || c == "i" || c == "o" || c == "u") |> list.len
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Missing '=' before function body at line 1:35
  --> /tmp/dojo-count-vowels-0.almd:1:35
  hint: Almide requires '=' before the body. Write: fn count_vowels(...) -> Type = { ... }
  |
1 | fn count_vowels(s: String) -> Int {
  |                                   ^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn count_vowels(s: String) -> Int = {
  string.chars(s) |> list.filter((c) => c == "a" || c == "e" || c == "i" || c == "o" || c == "u") |> list.len
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-1.almd
error: '||' is not valid in Almide at line 2:50
  --> /tmp/dojo-count-vowels-1.almd:2:50
  hint: Use 'or' for logical OR. Example: if a or b then ...
  |
2 |   string.chars(s) |> list.filter((c) => c == "a" || c == "e" || c == "i" || c == "o" || c == "u") |> list.len
  |                                                  ^
error[E001]: type mismatch in fn 'count_vowels': expected Int but got Unit
  --> /tmp/dojo-count-vowels-1.almd:1:37
  in fn 'count_vowels'
  hint: Fix the expression type or change the expected type
  |
1 | fn count_vowels(s: String) -> Int = {
  |                                     ^

2 error(s) found
Compile error for /tmp/dojo-count-vowels-1.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn count_vowels(s: String) -> Int = {
  string.chars(s) |> list.filter((c) => c == "a" or c == "e" or c == "i" or c == "o" or c == "u") |> list.len
}
```
