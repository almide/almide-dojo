# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String =
  match string.split(s, " ") {
    list() => ""
    list(words) => string.join(map(words, (word) => string.capitalize(word)), " ")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error: Expected FatArrow at line 3:9 (got LParen '(')
  --> /tmp/dojo-title-case-0.almd:3:9
  |
3 |     list() => ""
  |         ^

1 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String =
  match string.split(s, " ") {
    list() => ""
    list(words) => string.join(map(words, (word) => string.capitalize(word)), " ")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error: Expected FatArrow at line 3:9 (got LParen '(')
  --> /tmp/dojo-title-case-1.almd:3:9
  |
3 |     list() => ""
  |         ^

1 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String =
  match string.split(s, " ") {
    list() => ""
    list(words) => string.join(map(words, (word) => string.capitalize(word)), " ")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error: Expected FatArrow at line 3:9 (got LParen '(')
  --> /tmp/dojo-title-case-2.almd:3:9
  |
3 |     list() => ""
  |         ^

1 error(s) found
Compile error for /tmp/dojo-title-case-2.almd:
compile failed
FAILED: /tmp/dojo-title-case-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String =
  match string.split(s, " ") {
    list() => ""
    list(words) => string.join(map(words, (word) => string.capitalize(word)), " ")
  }
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
error: Expected FatArrow at line 3:9 (got LParen '(')
  --> /tmp/dojo-title-case-3.almd:3:9
  |
3 |     list() => ""
  |         ^

1 error(s) found
Compile error for /tmp/dojo-title-case-3.almd:
compile failed
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
