# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
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

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized = list.map(words, string.capitalize)
  let lowercased = list.map(words, string.to_lower)
  string.join(lowercased, " ")
```

**Diagnostic:**

```
warning: unused variable 'capitalized'
  --> /tmp/dojo-title-case-1.almd:3
  here: let capitalized = list.map(words, string.capitalize)
  hint: Prefix with '_' to suppress: _capitalized
  |
3 |   let capitalized = list.map(words, string.capitalize)
FAILED: /tmp/dojo-title-case-1.almd
  test: title_case single word
  at:   /tmp/dojo-title-case-1.almd:8
  expected: "Hello"
  found:    "hello"
  test: title_case two words
  at:   /tmp/dojo-title-case-1.almd:9
  expected: "Hello World"
  found:    "hello world"
  test: title_case already titled
  at:   /tmp/dojo-title-case-1.almd:10
  expected: "Hello World"
  found:    "hello world"
  test: title_case all upper
  at:   /tmp/dojo-title-case-1.almd:11
  expected: "Hello World"
  found:    "hello world"
  test: title_case mixed
  at:   /tmp/dojo-title-case-1.almd:12
  expected: "Hello World"
  found:    "hello world"
  test: title_case single char words
  at:   /tmp/dojo-title-case-1.almd:13
  expected: "A B C"
  found:    "a b c"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized = list.map(words, string.capitalize)
  let lowercased = list.map(words, string.to_lower)
  string.join(capitalized, " ")
```

**Diagnostic:**

```
warning: unused variable 'lowercased'
  --> /tmp/dojo-title-case-2.almd:4
  here: let lowercased = list.map(words, string.to_lower)
  hint: Prefix with '_' to suppress: _lowercased
  |
4 |   let lowercased = list.map(words, string.to_lower)
FAILED: /tmp/dojo-title-case-2.almd
  test: title_case all upper
  at:   /tmp/dojo-title-case-2.almd:11
  expected: "Hello World"
  found:    "HELLO WORLD"
  test: title_case mixed
  at:   /tmp/dojo-title-case-2.almd:12
  expected: "Hello World"
  found:    "HELLO WORLD"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

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
FAILED: /tmp/dojo-title-case-3.almd
  test: title_case all upper
  at:   /tmp/dojo-title-case-3.almd:10
  expected: "Hello World"
  found:    "HELLO WORLD"
  test: title_case mixed
  at:   /tmp/dojo-title-case-3.almd:11
  expected: "Hello World"
  found:    "HELLO WORLD"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
