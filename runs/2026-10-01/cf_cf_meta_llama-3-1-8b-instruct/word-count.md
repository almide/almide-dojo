# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **state**: `measured`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:51
  here: let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:3:13
  in variable words
  here: list.fold(words, map.new(), (map, word) =>
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (map, word) =>
  |             ^^^^^

2 error(s) found
FAILED: /tmp/dojo-word-count-0.almd
Compile error for /tmp/dojo-word-count-0.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  let map = map.new()
  list.fold(words, map, (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:51
  here: let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:4:13
  in variable words
  here: list.fold(words, map, (map, word) =>
  hint: Check the variable name
  |
4 |   list.fold(words, map, (map, word) =>
  |             ^^^^^

2 error(s) found
FAILED: /tmp/dojo-word-count-1.almd
Compile error for /tmp/dojo-word-count-1.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  let map = map.new()
  list.fold(words, map, (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:51
  here: let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:13
  in variable words
  here: list.fold(words, map, (map, word) =>
  hint: Check the variable name
  |
4 |   list.fold(words, map, (map, word) =>
  |             ^^^^^

2 error(s) found
FAILED: /tmp/dojo-word-count-2.almd
Compile error for /tmp/dojo-word-count-2.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  let map = map.new()
  list.fold(words, map, (map, word) => 
    map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:51
  here: let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  hint: The parser expected a different token here. The message names what it wanted; check the token just BEFORE this position too — an unclosed delimiter or an idiom from another language usually breaks the shape one token earlier (grammar reference: docs/GRAMMAR.md).
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:13
  in variable words
  here: list.fold(words, map, (map, word) =>
  hint: Check the variable name
  |
4 |   list.fold(words, map, (map, word) =>
  |             ^^^^^

2 error(s) found
FAILED: /tmp/dojo-word-count-3.almd
Compile error for /tmp/dojo-word-count-3.almd:
compile failed

0 via WASM, 0 via native fallback, 1 failed (of 1 files)

```
