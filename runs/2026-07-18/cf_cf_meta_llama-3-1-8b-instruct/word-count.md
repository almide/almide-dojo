# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] {
    let words = string.split(s, " ")
        .filter(|x| !x.is_empty())
        .to_list();
    list.fold(words, map.new(), |m, word| {
        let count = map.get_or(m, word, 0);
        map.set(m, word, count + 1);
        m
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
    let words = string.split(s, " ")
        .filter(|x| !x.is_empty())
        .to_list();
    list.fold(words, map.new(), |m, word| {
        let count = map.get_or(m, word, 0);
        map.set(m, word, count + 1);
        m
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-word-count-1.almd:3:9
  |
3 |         .filter(|x| !x.is_empty())
  |         ^
error: '|x|' closure syntax is not valid in Almide at line 5:33
  --> /tmp/dojo-word-count-1.almd:5:33
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
5 |     list.fold(words, map.new(), |m, word| {
  |                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:6 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:9:6
  |
9 |     })
  |      ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:6:32
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
6 |         let count = map.get_or(m, word, 0);
  |                                ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:6:35
  in variable word
  hint: Did you mean `words`?
  try:
      // word  →  words
      words
  |
6 |         let count = map.get_or(m, word, 0);
  |                                   ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:7:17
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
7 |         map.set(m, word, count + 1);
  |                 ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:7:20
  in variable word
  hint: Did you mean `words`?
  try:
      // word  →  words
      words
  |
7 |         map.set(m, word, count + 1);
  |                    ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:8:9
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
8 |         m
  |         ^

8 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ")
        .filter(|x| !x.is_empty())
        .to_list();
    let freq_map = map.new();
    list.fold(words, freq_map, (freq_map, word) => {
        let count = map.get_or(freq_map, word, 0);
        map.set(freq_map, word, count + 1);
        freq_map
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-word-count-2.almd:3:9
  |
3 |         .filter(|x| !x.is_empty())
  |         ^

1 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ")
        .filter(|x| x.is_not_empty())
        .to_list();
    let freq_map = map.new();
    list.fold(words, freq_map, (freq_map, word) => {
        let count = map.get_or(freq_map, word, 0);
        map.set(freq_map, word, count + 1);
        freq_map
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 3:9 (got Dot '.')
  --> /tmp/dojo-word-count-3.almd:3:9
  |
3 |         .filter(|x| x.is_not_empty())
  |         ^

1 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
