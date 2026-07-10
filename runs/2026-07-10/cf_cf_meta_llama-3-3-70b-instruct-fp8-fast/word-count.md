# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let
    words = string.split(s, " ")
    filtered_words = list.filter(words, (x) => not(string.is_empty(x)))
    initial_map = map.new()
    count_map = list.fold(
      filtered_words,
      initial_map,
      (acc, word) =>
        map.set(
          acc,
          word,
          map.get_or(acc, word, 0) + 1
        )
    )
  in
    count_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-word-count-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 16:3 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:16:3
   |
16 |   in
   |   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:4:34
  in variable words
  hint: Check the variable name
  |
4 |     filtered_words = list.filter(words, (x) => not(string.is_empty(x)))
  |                                  ^^^^^
error[E003]: undefined variable 'filtered_words'
  --> /tmp/dojo-word-count-0.almd:7:7
  in variable filtered_words
  hint: Check the variable name
  |
7 |       filtered_words,
  |       ^^^^^^^^^^^^^^
error[E003]: undefined variable 'initial_map'
  --> /tmp/dojo-word-count-0.almd:8:7
  in variable initial_map
  hint: Check the variable name
  |
8 |       initial_map,
  |       ^^^^^^^^^^^
error[E003]: undefined variable 'count_map'
  --> /tmp/dojo-word-count-0.almd:17:5
  in variable count_map
  hint: Check the variable name
   |
17 |     count_map
   |     ^^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ")
  let filtered_words = list.filter(words, (x) => not(string.is_empty(x)))
  let initial_map = map.new()
  let count_map = list.fold(
    filtered_words,
    initial_map,
    (acc, word) =>
      map.set(
        acc,
        word,
        map.get_or(acc, word, 0) + 1
      )
  )
  in count_map
```
