# count-vowels

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn count_vowels(s: String) -> Int {
  list.len(
    list.filter(
      string.chars(s),
      (c) => {
        match c {
          "a" => true,
          "e" => true,
          "i" => true,
          "o" => true,
          "u" => true,
          _ => false
        }
      }
    )
  )
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

### Attempt 2 (PASS)

```almide
fn count_vowels(s: String) -> Int = {
  list.len(
    list.filter(
      string.chars(s),
      (c) => {
        match c {
          "a" => true,
          "e" => true,
          "i" => true,
          "o" => true,
          "u" => true,
          _ => false
        }
      }
    )
  )
}
```
