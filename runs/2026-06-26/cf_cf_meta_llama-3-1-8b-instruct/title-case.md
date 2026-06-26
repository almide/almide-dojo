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
  let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(word.first()))
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-title-case-1.almd:3:95
  in call to string.capitalize()
  hint: Fix the argument type
  |
3 |   let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(word.first()))
  |                                                                                               ^^^^
error[E001]: type mismatch in call to string.capitalize(): expected String but got Option[String]
  --> /tmp/dojo-title-case-1.almd:3:95
  in call to string.capitalize()
  hint: Fix the expression type or change the expected type
  |
3 |   let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(word.first()))
  |                                                                                               ^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.to_lower(word) + match string.first(word) {
    some(first) => string.capitalize(first),
    none => ""
  })
  string.join(capitalized_words, " ")
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
  let capitalized_words = list.map(words, (word) => string.to_lower(word) + match string.first(word) {
    some(first) => string.capitalize(first),
    none => ""
  })
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
