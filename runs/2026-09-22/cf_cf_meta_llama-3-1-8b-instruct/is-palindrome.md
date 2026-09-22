# is-palindrome

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn is_palindrome(s: String) -> Bool = {
  let chars = string.chars(s)
  let n = list.len(chars)
  let half = list.range(0, n / 2)
  list.all(half, (i, j) => list.get(chars, i) == list.get(chars, n - 1 - j))
}
```

**Diagnostic:**

```
error[E005]: argument 'f' expects fn(Int) -> Bool but got fn(Int, ?1) -> Bool
  --> /tmp/dojo-is-palindrome-0.almd:5:18
  in call to list.all()
  here: list.all(half, (i, j) => list.get(chars, i) == list.get(chars, n - 1 - j))
  hint: Fix the argument type
...
5 |   list.all(half, (i, j) => list.get(chars, i) == list.get(chars, n - 1 - j))
  |                  ^

1 error(s) found
FAILED: /tmp/dojo-is-palindrome-0.almd
Compile error for /tmp/dojo-is-palindrome-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn is_palindrome(s: String) -> Bool = {
  let chars = string.chars(s)
  let n = list.len(chars)
  list.all(list.range(0, n / 2), (i) => list.get(chars, i) == list.get(chars, n - 1 - i))
}
```
