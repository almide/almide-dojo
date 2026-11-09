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
  let capitalized_words = list.map(words, (word) => string.capitalize(word))
  list.join(capitalized_words, " ")
```

**Diagnostic:**

```
FAILED: /tmp/dojo-title-case-0.almd
  test: title_case all upper
  at:   /tmp/dojo-title-case-0.almd:10
  expected: Hello World
  found:    HELLO WORLD
  test: title_case mixed
  at:   /tmp/dojo-title-case-0.almd:11
  expected: Hello World
  found:    HELLO WORLD

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  list.join(capitalized_words, " ")
```

**Diagnostic:**

```
error[E005]: argument 's' expects String but got Option[String]
  --> /tmp/dojo-title-case-1.almd:3:95
  in call to string.capitalize()
  here: let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(string.first(word)))
  hint: the argument is an Option[String] — unwrap it first: `?? fallback` supplies a default, or `match` handles the none case
  |
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
  let capitalized_words = list.map(words, (word) => string.to_lower(word) + string.capitalize(word))
  list.join(capitalized_words, " ")
```

**Diagnostic:**

```
FAILED: /tmp/dojo-title-case-2.almd
  test: title_case single word
  at:   /tmp/dojo-title-case-2.almd:7
  expected: Hello
  found:    helloHello
  test: title_case two words
  at:   /tmp/dojo-title-case-2.almd:8
  expected: Hello World
  found:    helloHello worldWorld
  test: title_case already titled
  at:   /tmp/dojo-title-case-2.almd:9
  expected: Hello World
  found:    helloHello worldWorld
  test: title_case all upper
  at:   /tmp/dojo-title-case-2.almd:10
  expected: Hello World
  found:    helloHELLO worldWORLD
  test: title_case mixed
  at:   /tmp/dojo-title-case-2.almd:11
  expected: Hello World
  found:    helloHELLO worldWORLD
  test: title_case single char words
  at:   /tmp/dojo-title-case-2.almd:12
  expected: A B C
  found:    aA bB cC

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn title_case(s: String) -> String = 
  let words = string.split(s, " ")
  let capitalized_words = list.map(words, (word) => string.capitalize(word) + string.to_lower(string.drop(word, 1)))
  list.join(capitalized_words, " ")
```

**Diagnostic:**

```
FAILED: /tmp/dojo-title-case-3.almd
  test: title_case single word
  at:   /tmp/dojo-title-case-3.almd:7
  expected: Hello
  found:    Helloello
  test: title_case two words
  at:   /tmp/dojo-title-case-3.almd:8
  expected: Hello World
  found:    Helloello Worldorld
  test: title_case already titled
  at:   /tmp/dojo-title-case-3.almd:9
  expected: Hello World
  found:    Helloello Worldorld
  test: title_case all upper
  at:   /tmp/dojo-title-case-3.almd:10
  expected: Hello World
  found:    HELLOello WORLDorld
  test: title_case mixed
  at:   /tmp/dojo-title-case-3.almd:11
  expected: Hello World
  found:    HELLOello WORLDorld

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
