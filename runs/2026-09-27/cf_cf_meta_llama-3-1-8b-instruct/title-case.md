# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn title_case(s: String) -> String {
  let words = string.split(s, " ");
  let capitalized = words.map(string.capitalize);
  string.join(capitalized, " ")
}
```

**Diagnostic:**

```
error: Missing '=' before function body at line 1:36
  --> /tmp/dojo-title-case-0.almd:1:36
  here: fn title_case(s: String) -> String {
  hint: Almide requires '=' before the body. Write: fn title_case(...) -> Type = { ... }
  |
1 | fn title_case(s: String) -> String {
  |                                    ^

1 error(s) found
FAILED: /tmp/dojo-title-case-0.almd
Compile error for /tmp/dojo-title-case-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ");
  let capitalized = words.map(string.capitalize);
  string.join(capitalized, " ")
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-title-case-1.almd
  test: title_case all upper
  at:   /tmp/dojo-title-case-1.almd:11
  expected: "Hello World"
  found:    "HELLO WORLD"
  test: title_case mixed
  at:   /tmp/dojo-title-case-1.almd:12
  expected: "Hello World"
  found:    "HELLO WORLD"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ");
  let capitalized = words.map(string.capitalize);
  let lowercased = string.to_lower(string.join(capitalized, " "));
  lowercased
}
```

**Diagnostic:**

```
FAILED: /tmp/dojo-title-case-2.almd
  test: title_case single word
  at:   /tmp/dojo-title-case-2.almd:9
  expected: "Hello"
  found:    "hello"
  test: title_case two words
  at:   /tmp/dojo-title-case-2.almd:10
  expected: "Hello World"
  found:    "hello world"
  test: title_case already titled
  at:   /tmp/dojo-title-case-2.almd:11
  expected: "Hello World"
  found:    "hello world"
  test: title_case all upper
  at:   /tmp/dojo-title-case-2.almd:12
  expected: "Hello World"
  found:    "hello world"
  test: title_case mixed
  at:   /tmp/dojo-title-case-2.almd:13
  expected: "Hello World"
  found:    "hello world"
  test: title_case single char words
  at:   /tmp/dojo-title-case-2.almd:14
  expected: "A B C"
  found:    "a b c"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = {
  let words = string.split(s, " ");
  let capitalized = words.map(string.capitalize);
  let lowercased = string.to_lower(string.join(capitalized, " "));
  string.join(capitalized, " ")
}
```

**Diagnostic:**

```
warning: unused variable 'lowercased'
  --> /tmp/dojo-title-case-3.almd:4
  here: let lowercased = string.to_lower(string.join(capitalized, " "));
  hint: Prefix with '_' to suppress: _lowercased
  |
4 |   let lowercased = string.to_lower(string.join(capitalized, " "));
FAILED: /tmp/dojo-title-case-3.almd
  test: title_case all upper
  at:   /tmp/dojo-title-case-3.almd:12
  expected: "Hello World"
  found:    "HELLO WORLD"
  test: title_case mixed
  at:   /tmp/dojo-title-case-3.almd:13
  expected: "Hello World"
  found:    "HELLO WORLD"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
