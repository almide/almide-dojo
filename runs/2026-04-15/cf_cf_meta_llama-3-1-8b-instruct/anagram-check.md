# anagram-check

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_anagram(a: String, b: String) -> Bool {
  let a_no_spaces = a |> string.to_lower |> string.chars |> list.filter((c) => c != ' ')
  let b_no_spaces = b |> string.to_lower |> string.chars |> list.filter((c) => c != ' ')
  list.sort(a_no_spaces) == list.sort(b_no_spaces)
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-anagram-check-0.almd
error: Missing '=' before function body at line 1:45
  --> /tmp/dojo-anagram-check-0.almd:1:45
  hint: Almide requires '=' before the body. Write: fn is_anagram(...) -> Type = { ... }
  |
1 | fn is_anagram(a: String, b: String) -> Bool {
  |                                             ^

1 error(s) found
Compile error for /tmp/dojo-anagram-check-0.almd:
compile failed
FAILED: /tmp/dojo-anagram-check-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn is_anagram(a: String, b: String) -> Bool = {
  let a_no_spaces = a |> string.to_lower |> string.chars |> list.filter((c) => c != ' ')
  let b_no_spaces = b |> string.to_lower |> string.chars |> list.filter((c) => c != ' ')
  list.sort(a_no_spaces) == list.sort(b_no_spaces)
}
```
