# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (m, word) => 
    match m.get(word) {
      some(count) => map.set(m, word, count + 1),
      none => map.set(m, word, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, word) =>
  |             ^^^^^
error[E005]: argument 'm' expects Map[K, V] but got fn(?3) -> ?4
  --> /tmp/dojo-word-count-0.almd:5:47
  in call to map.set()
  hint: Fix the argument type
  |
5 |       some(count) => map.set(m, word, count + 1),
  |                                               ^

3 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (m, word) => 
    match m.get(word) {
      some(count) => map.set(m, word, count + 1),
      none => map.set(m, word, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, word) =>
  |             ^^^^^
error[E005]: argument 'm' expects Map[K, V] but got fn(?3) -> ?4
  --> /tmp/dojo-word-count-1.almd:5:47
  in call to map.set()
  hint: Fix the argument type
  |
5 |       some(count) => map.set(m, word, count + 1),
  |                                               ^

3 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (m, word) => 
    match m.get(word) {
      some(count) => map.set(m, word, count + 1),
      none => map.set(m, word, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, word) =>
  |             ^^^^^
error[E005]: argument 'm' expects Map[K, V] but got fn(?3) -> ?4
  --> /tmp/dojo-word-count-2.almd:5:47
  in call to map.set()
  hint: Fix the argument type
  |
5 |       some(count) => map.set(m, word, count + 1),
  |                                               ^

3 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (m, word) => 
    match map.get_or(m, word, 0) {
      some(count) => map.set(m, word, count + 1),
      none => map.set(m, word, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, word) =>
  |             ^^^^^
error[E010]: non-exhaustive match: missing _
  --> /tmp/dojo-word-count-3.almd:4:31
  in match
  hint: match on Int requires a catch-all '_' pattern
  |
4 |     match map.get_or(m, word, 0) {
  |                               ^

3 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
