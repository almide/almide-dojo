# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ")
  let capitalized = list.map(words, fn (word) => string.capitalize(word))
  string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: Expected expression at line 3:37 (got Fn 'fn')
  --> /tmp/dojo-title-case-0.almd:3:37
  |
3 |   let capitalized = list.map(words, fn (word) => string.capitalize(word))
  |                                     ^
error[E003]: undefined variable 'capitalized'
  --> /tmp/dojo-title-case-0.almd:4:15
  in variable capitalized
  hint: Check the variable name
  |
4 |   string.join(capitalized, " ")
  |               ^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ")
  let capitalized = list.map(words, (word) => string.capitalize(word))
  string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ")
  let capitalized = list.map(words, (word) => string.capitalize(word))
  string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ")
  let capitalized = list.map(words, (word) => string.capitalize(word))
  string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
