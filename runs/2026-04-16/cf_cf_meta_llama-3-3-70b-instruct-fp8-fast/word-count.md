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
    words = list.filter(string.split(s, " "), (x) => x != "")
    freq_map = list.fold(
      words,
      map.new(),
      (acc, word) =>
        map.set(
          acc,
          word,
          map.get_or(acc, word, 0) + 1
        )
    )
  in
    freq_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected identifier at line 2:6 (got Newline '')
  --> /tmp/dojo-word-count-0.almd:2:6
  |
2 |   let
  |      ^
error: Expected expression at line 14:3 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:14:3
   |
14 |   in
   |   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:5:7
  in variable words
  hint: Check the variable name
  |
5 |       words,
  |       ^^^^^
error[E003]: undefined variable 'freq_map'
  --> /tmp/dojo-word-count-0.almd:15:5
  in variable freq_map
  hint: Check the variable name
   |
15 |     freq_map
   |     ^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  list.fold(
    list.filter(string.split(s, " "), (x) => x != ""),
    map.new(),
    (acc, word) =>
      map.set(
        acc,
        word,
        map.get_or(acc, word, 0) + 1
      )
  )
```
