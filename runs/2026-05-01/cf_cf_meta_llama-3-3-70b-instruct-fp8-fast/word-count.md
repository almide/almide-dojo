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
    non_empty_words = list.filter(words, (x) => not string.is_empty(x))
    freq_map = list.fold(
      non_empty_words,
      map.new(),
      (acc, word) =>
        let
          count = map.get_or(acc, word, 0)
        in
          map.set(acc, word, count + 1)
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
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-0.almd:9:9
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
9 |         let
  |         ^^^
error: Expected expression at line 11:9 (got In 'in')
  --> /tmp/dojo-word-count-0.almd:11:9
   |
11 |         in
   |         ^
error: Expected expression at line 13:5 (got RParen ')')
  --> /tmp/dojo-word-count-0.almd:13:5
   |
13 |     )
   |     ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:4:35
  in variable words
  hint: Check the variable name
  |
4 |     non_empty_words = list.filter(words, (x) => not string.is_empty(x))
  |                                   ^^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-0.almd:10:30
  in variable acc
  hint: Check the variable name
   |
10 |           count = map.get_or(acc, word, 0)
   |                              ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-0.almd:10:35
  in variable word
  hint: Check the variable name
   |
10 |           count = map.get_or(acc, word, 0)
   |                                   ^^^^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-0.almd:12:19
  in variable acc
  hint: Check the variable name
   |
12 |           map.set(acc, word, count + 1)
   |                   ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-0.almd:12:24
  in variable word
  hint: Check the variable name
   |
12 |           map.set(acc, word, count + 1)
   |                        ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-0.almd:12:30
  in variable count
  hint: Check the variable name
   |
12 |           map.set(acc, word, count + 1)
   |                              ^^^^^
error[E003]: undefined variable 'freq_map'
  --> /tmp/dojo-word-count-0.almd:15:5
  in variable freq_map
  hint: Check the variable name
   |
15 |     freq_map
   |     ^^^^^^^^

11 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] =
  string.split(s, " ")
  |> list.filter((x) => not string.is_empty(x))
  |> list.fold(
    map.new(),
    (acc, word) =>
      map.set(
        acc,
        word,
        map.get_or(acc, word, 0) + 1
      )
  )
```
