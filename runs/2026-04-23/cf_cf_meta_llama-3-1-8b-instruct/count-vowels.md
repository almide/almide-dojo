# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int = 
  string.chars(s) |> list.filter(x => list.contains(["a", "e", "i", "o", "u"], x)) |> list.len
```

**Diagnostic:**

```
Compiling /tmp/dojo-count-vowels-0.almd
error: Lambda parameter must be wrapped in parentheses
  --> /tmp/dojo-count-vowels-0.almd:2:36
  in lambda syntax
  hint: Almide lambdas require parentheses around parameters. Write `(x) => expr` instead of `x => expr`
  |
2 |   string.chars(s) |> list.filter(x => list.contains(["a", "e", "i", "o", "u"], x)) |> list.len
  |                                    ^^

1 error(s) found
Compile error for /tmp/dojo-count-vowels-0.almd:
compile failed
FAILED: /tmp/dojo-count-vowels-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int = 
  string.chars(s) |> list.filter((x) => list.contains(["a", "e", "i", "o", "u"], x)) |> list.len
```
