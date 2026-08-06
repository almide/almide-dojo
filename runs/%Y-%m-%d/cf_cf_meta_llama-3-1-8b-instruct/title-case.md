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
  string.join(string.map(words, string.capitalize), " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-0.almd
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-title-case-0.almd:3:39
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.join(string.map(words, string.capitalize), " ")
  |                                       ^

1 error(s) found
Compile error for /tmp/dojo-title-case-0.almd:
compile failed
FAILED: /tmp/dojo-title-case-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ") 
  string.join(string.map(words, string.capitalize), " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-1.almd
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-title-case-1.almd:3:39
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.join(string.map(words, string.capitalize), " ")
  |                                       ^

1 error(s) found
Compile error for /tmp/dojo-title-case-1.almd:
compile failed
FAILED: /tmp/dojo-title-case-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ") 
  string.join(string.map(words, string.capitalize), " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-2.almd
error[E002]: undefined function 'string.map'
  --> /tmp/dojo-title-case-2.almd:3:39
  in call to string.map()
  hint: No function 'map' in module 'string'. See docs/CHEATSHEET.md for available functions
  |
3 |   string.join(string.map(words, string.capitalize), " ")
  |                                       ^

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
  string.join(list.map(words, string.capitalize), " ")
```

**Diagnostic:**

```
Compiling /tmp/dojo-title-case-3.almd
FAILED: /tmp/dojo-title-case-3.almd

1/1 test file(s) failed

```
