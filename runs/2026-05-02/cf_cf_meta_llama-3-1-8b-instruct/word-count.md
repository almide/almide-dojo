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
    let words = string.split(s, " ").filter(|word| !word.is_empty()).map(|word| word.to_lower())
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
    let words = string.split(s, " ").filter(|word| !word.is_empty()).map(|word| word.to_lower())
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
error: '|x|' closure syntax is not valid in Almide at line 2:45
  --> /tmp/dojo-word-count-1.almd:2:45
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     let words = string.split(s, " ").filter(|word| !word.is_empty()).map(|word| word.to_lower())
  |                                             ^
error: '|x|' closure syntax is not valid in Almide at line 3:33
  --> /tmp/dojo-word-count-1.almd:3:33
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |     list.fold(words, map.new(), |m, word| {
  |                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:6 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:7:6
  |
7 |     })
  |      ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:4:32
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
4 |         let count = map.get_or(m, word, 0);
  |                                ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:4:35
  in variable word
  hint: Check the variable name
  |
4 |         let count = map.get_or(m, word, 0);
  |                                   ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:5:17
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
5 |         map.set(m, word, count + 1);
  |                 ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:20
  in variable word
  hint: Check the variable name
  |
5 |         map.set(m, word, count + 1);
  |                    ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:6:9
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
6 |         m
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
    let words = string.split(s, " ").filter(|word| !word.is_empty()).map(|word| word.to_lower())
    list.fold(words, map.new(), (m, word) => {
        let count = map.get_or(m, word, 0);
        map.set(m, word, count + 1);
        m
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: '|x|' closure syntax is not valid in Almide at line 2:45
  --> /tmp/dojo-word-count-2.almd:2:45
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     let words = string.split(s, " ").filter(|word| !word.is_empty()).map(|word| word.to_lower())
  |                                             ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:3:15
  in variable words
  hint: Check the variable name
  |
3 |     list.fold(words, map.new(), (m, word) => {
  |               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter(|word| !word.is_empty()).map(|word| word.to_lower())
    let word_count_map = map.new()
    list.fold(words, word_count_map, (m, word) => {
        let count = map.get_or(m, word, 0);
        map.set(m, word, count + 1);
        m
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: '|x|' closure syntax is not valid in Almide at line 2:45
  --> /tmp/dojo-word-count-3.almd:2:45
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |     let words = string.split(s, " ").filter(|word| !word.is_empty()).map(|word| word.to_lower())
  |                                             ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:15
  in variable words
  hint: Check the variable name
  |
4 |     list.fold(words, word_count_map, (m, word) => {
  |               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
