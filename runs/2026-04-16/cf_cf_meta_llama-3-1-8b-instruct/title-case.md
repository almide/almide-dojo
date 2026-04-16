# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String {
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, fn word => string.capitalize(word))
  string.join(capitalized_words, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-title-case-0.almd:1:36
  hint: Almide requires '=' before the body. Write: fn title_case(...) -> Type = { ... }
  |
1 | fn title_case(s: String) -> String {
  |                                    ^
error: Expected LParen at line 3:51 (got FatArrow '=>')
  --> /tmp/dojo-title-case-0.almd:3:51
  |
3 |   let capitalized_words = list.map(words, fn word => string.capitalize(word))
  |                                                   ^

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
  let capitalized_words = list.map(words, fn word => string.capitalize(word))
  string.join(capitalized_words, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error: Expected expression at line 3:43 (got Fn 'fn')
  --> /tmp/dojo-title-case-1.almd:3:43
  |
3 |   let capitalized_words = list.map(words, fn word => string.capitalize(word))
  |                                           ^
error[E003]: undefined variable 'capitalized_words'
  --> /tmp/dojo-title-case-1.almd:4:15
  in variable capitalized_words
  hint: Check the variable name
  |
4 |   string.join(capitalized_words, " ")
  |               ^^^^^^^^^^^^^^^^^

2 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.capitalize(word))
  string.join(capitalized_words, " ")
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
  let capitalized_words = list.map(words, (word) => string.capitalize(word))
  string.join(capitalized_words, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
