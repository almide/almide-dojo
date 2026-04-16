# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: name-error
- **diagnostic code**: `E003`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] {
  let words = string.split(s, " ").filter(|s| !s.is_empty()).map(|s| s.to_lower())
  let init = map.new()
  list.fold(words, init, (m, word) => {
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Missing '=' before function body at line 1:46
  --> /tmp/dojo-word-count-0.almd:1:46
  hint: Almide requires '=' before the body. Write: fn word_count(...) -> Type = { ... }
  |
1 | fn word_count(s: String) -> Map[String, Int] {
  |                                              ^

1 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter(|s| !s.is_empty()).map(|s| s.to_lower())
  let init = map.new()
  list.fold(words, init, (m, word) => {
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:43
  --> /tmp/dojo-word-count-1.almd:2:43
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").filter(|s| !s.is_empty()).map(|s| s.to_lower())
  |                                           ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, init, (m, word) => {
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower())
  let init = map.new()
  list.fold(words, init, (m, word) => {
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: '|x|' closure syntax is not valid in Almide at line 2:43
  --> /tmp/dojo-word-count-2.almd:2:43
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower())
  |                                           ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, init, (m, word) => {
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter((x) => !x.is_empty()).map((x) => x.to_lower())
  let init = map.new()
  list.fold(words, init, (m, word) => {
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: '!' is not valid in Almide at line 2:50
  --> /tmp/dojo-word-count-3.almd:2:50
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |   let words = string.split(s, " ").filter((x) => !x.is_empty()).map((x) => x.to_lower())
  |                                                  ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, init, (m, word) => {
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
