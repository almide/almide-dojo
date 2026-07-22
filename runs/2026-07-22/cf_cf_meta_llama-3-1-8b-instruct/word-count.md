# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: yes
- **retries**: 2
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  list.fold(words, map.new(), (acc, word) => {
    let count = map.get_or(acc, word, 0) + 1
    map.set(acc, word, count)
  })
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
  list.filter(words, (word) => {
    !string.is_empty(word)
  }) |> list.fold(map.new(), (acc, word) => {
    let count = map.get_or(acc, word, 0) + 1
    map.set(acc, word, count)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: '!' is not valid in Almide at line 4:5
  --> /tmp/dojo-word-count-1.almd:4:5
  hint: Use 'not' for boolean negation. Write: not x
  |
4 |     !string.is_empty(word)
  |     ^
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(?0) -> Unit
  --> /tmp/dojo-word-count-1.almd:3:32
  in call to list.filter()
  hint: Fix the argument type
  |
3 |   list.filter(words, (word) => {
  |                                ^
error[E001]: type mismatch in call to list.filter(): expected fn(String) -> Bool but got fn(String) -> Unit
  --> /tmp/dojo-word-count-1.almd:3:32
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
3 |   list.filter(words, (word) => {
  |                                ^

3 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ")
  list.filter(words, (word) => {
    not string.is_empty(word)
  }) |> list.fold(map.new(), (acc, word) => {
    let count = map.get_or(acc, word, 0) + 1
    map.set(acc, word, count)
  })
}
```
