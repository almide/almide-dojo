# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, string.capitalize)
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
FAILED: /tmp/dojo-title-case-0.almd
  test: title_case all upper
  at:   /tmp/dojo-title-case-0.almd:10
  expected: "Hello World"
  found:    "HELLO WORLD"
  test: title_case mixed
  at:   /tmp/dojo-title-case-0.almd:11
  expected: "Hello World"
  found:    "HELLO WORLD"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (PASS)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.capitalize(string.to_lower(word)))
  string.join(capitalized_words, " ")
```
