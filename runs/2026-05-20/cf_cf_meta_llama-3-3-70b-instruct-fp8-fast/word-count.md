# word-count

- **model**: `cf:@cf/meta/llama-3.3-70b-instruct-fp8-fast`
- **success**: yes
- **retries**: 1
- **category**: pass-retry

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] =
  let words = string.split(s, " ")
  let words = list.filter(words, (x) => x != "")
  let freq_map = list.fold(words, map.new(), (acc, word) =>
    let count = map.get_or(acc, word, 0)
    map.set(acc, word, count + 1)
  )
  freq_map
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-0.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = map.get_or(acc, word, 0)
  |     ^^^
error: Expected expression at line 7:3 (got RParen ')')
  --> /tmp/dojo-word-count-0.almd:7:3
  |
7 |   )
  |   ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-0.almd:6:13
  in variable acc
  hint: Check the variable name
  |
6 |     map.set(acc, word, count + 1)
  |             ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-0.almd:6:18
  in variable word
  hint: Did you mean `words`?
  try:
      // word  →  words
      words
  |
6 |     map.set(acc, word, count + 1)
  |                  ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-0.almd:6:24
  in variable count
  hint: Check the variable name
  |
6 |     map.set(acc, word, count + 1)
  |                        ^^^^^
error[E003]: undefined variable 'freq_map'
  --> /tmp/dojo-word-count-0.almd:8:3
  in variable freq_map
  hint: Check the variable name
  |
8 |   freq_map
  |   ^^^^^^^^

6 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (PASS)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  string.split(s, " ") 
  |> list.filter((x) => x != "") 
  |> list.fold(map.new(), (acc, word) => 
    map.set(acc, word, map.get_or(acc, word, 0) + 1)
  )
```
