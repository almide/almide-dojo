# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: unknown

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  let freq = list.fold(words, map.new(), (freq, word) => {
    let count = map.get_or(freq, word, 0)
    map.set(freq, word, count + 1)
  })
  freq
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  let words = list.filter(words, (word) => string.len(word) > 0)
  list.fold(words, map.new(), (freq, word) => {
    let count = map.get_or(freq, word, 0)
    map.set(freq, word, count + 1)
    freq
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  let words = list.filter(words, (word) => string.len(word) > 0)
  list.fold(words, map.new(), (freq, word) => {
    let count = map.get_or(freq, word, 0)
    map.set(freq, word, count + 1)
    freq
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  let words = list.filter(words, (word) => string.len(word) > 0)
  list.fold(words, map.new(), (freq, word) => {
    let count = map.get_or(freq, word, 0)
    map.set(freq, word, count + 1)
    freq
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
