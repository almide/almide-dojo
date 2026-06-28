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
  let capitalized = list.map(words, string.capitalize)
  string.join(capitalized, " ")
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
  let capitalized = list.map(words, (word) => string.capitalize(word))
  string.join(capitalized, " ")
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
  let capitalized = list.map(words, (word) => string.capitalize(word))
  string.join(list.to_list(capitalized), " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error[E002]: undefined function 'list.to_list'
  --> /tmp/dojo-title-case-2.almd:4:28
  in call to list.to_list()
  hint: No function 'to_list' in module 'list'. See docs/CHEATSHEET.md for available functions
  |
4 |   string.join(list.to_list(capitalized), " ")
  |                            ^^^^^^^^^^^

1 error(s) found
Compile error for /tmp/dojo-title-case-2.almd:
compile failed
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized = list.map(words, (word) => string.capitalize(word))
  string.join(capitalized, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
