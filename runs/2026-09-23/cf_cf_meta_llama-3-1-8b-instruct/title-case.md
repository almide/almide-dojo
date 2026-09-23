# title-case

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: yes
- **retries**: 3
- **category**: pass-retry

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
  let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-title-case-1.almd:3:95
  in call to string.capitalize()
  here: let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
...
3 |   let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  |                                                                                               ^^^^^^^^^^^^^^^^^^

1 error(s) found
FAILED: /tmp/dojo-title-case-1.almd
Compile error for /tmp/dojo-title-case-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => match string.first(word) {
    some(first) => string.to_lower(word) + string.capitalize(first),
    none => string.to_lower(word)
  })
  string.join(capitalized_words, " ")
```

**Diagnostic:**

```
FAILED: /tmp/dojo-title-case-2.almd
  test: title_case single word
  at:   /tmp/dojo-title-case-2.almd:10
  expected: "Hello"
  found:    "helloH"
  test: title_case two words
  at:   /tmp/dojo-title-case-2.almd:11
  expected: "Hello World"
  found:    "helloH worldW"
  test: title_case already titled
  at:   /tmp/dojo-title-case-2.almd:12
  expected: "Hello World"
  found:    "helloH worldW"
  test: title_case all upper
  at:   /tmp/dojo-title-case-2.almd:13
  expected: "Hello World"
  found:    "helloH worldW"
  test: title_case mixed
  at:   /tmp/dojo-title-case-2.almd:14
  expected: "Hello World"
  found:    "helloH worldW"
  test: title_case single char words
  at:   /tmp/dojo-title-case-2.almd:15
  expected: "A B C"
  found:    "aA bB cC"

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (PASS)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => match string.first(word) {
    some(first) => string.to_upper(first) + string.to_lower(string.drop(word, 1)),
    none => string.to_lower(word)
  })
  string.join(capitalized_words, " ")
```
