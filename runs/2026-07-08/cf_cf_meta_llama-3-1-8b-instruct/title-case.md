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
  let capitalized = list.map(words, |word| string.capitalize(word))
  string.join(capitalized, " ")
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

1 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ")
  let capitalized = list.map(words, |word| string.capitalize(word))
  string.join(capitalized, " ")
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error: '|x|' closure syntax is not valid in Almide at line 3:37
  --> /tmp/dojo-title-case-1.almd:3:37
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |   let capitalized = list.map(words, |word| string.capitalize(word))
  |                                     ^
error[E003]: undefined variable 'capitalized'
  --> /tmp/dojo-title-case-1.almd:4:15
  in variable capitalized
  hint: Check the variable name
  |
4 |   string.join(capitalized, " ")
  |               ^^^^^^^^^^^

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
