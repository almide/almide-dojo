# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.capitalize(word))
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(word))
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(word))
  string.join(list.map(capitalized_words, (word) => string.to_lower(word) + string.capitalize(word)), " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.capitalize(word))
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
