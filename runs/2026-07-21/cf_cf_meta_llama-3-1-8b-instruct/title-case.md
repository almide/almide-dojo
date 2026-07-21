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
  let capitalized = list.map(words, string.capitalize)
  let lower = list.map(words, string.to_lower)
  string.join(capitalized + lower, " ")
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
  let capitalized = list.map(words, string.capitalize)
  let lower = list.map(words, string.to_lower)
  string.join(capitalized, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
warning: unused variable 'lower'
  --> /tmp/dojo-title-case-2.almd:4
  hint: Prefix with '_' to suppress: _lower
  |
4 |   let lower = list.map(words, string.to_lower)
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized = list.map(words, string.capitalize)
  string.join(capitalized, " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
