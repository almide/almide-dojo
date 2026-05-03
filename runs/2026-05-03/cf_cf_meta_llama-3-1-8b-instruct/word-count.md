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
    let m = map.new()
    list.fold(words, m, |m, w| {
        map.set(m, w, map.get_or(m, w, 0) + 1)
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
    let m = map.new()
    list.fold(words, m, |m, w| {
        map.set(m, w, map.get_or(m, w, 0) + 1)
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
2 |     let words = string.split(s, " ").filter(|s| !s.is_empty()).map(|s| s.to_lower())
  |                                             ^
error: '|x|' closure syntax is not valid in Almide at line 4:25
  --> /tmp/dojo-word-count-1.almd:4:25
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |     list.fold(words, m, |m, w| {
  |                         ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 6:6 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:6:6
  |
6 |     })
  |      ^
error[E003]: undefined variable 'w'
  --> /tmp/dojo-word-count-1.almd:5:20
  in variable w
  hint: Did you mean `s`?
  try:
      // w  →  s
      s
  |
5 |         map.set(m, w, map.get_or(m, w, 0) + 1)
  |                    ^
error[E003]: undefined variable 'w'
  --> /tmp/dojo-word-count-1.almd:5:37
  in variable w
  hint: Did you mean `s`?
  try:
      // w  →  s
      s
  |
5 |         map.set(m, w, map.get_or(m, w, 0) + 1)
  |                                     ^

5 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter(|s| !s.is_empty()).map(|s| s.to_lower())
    let m = map.new()
    list.fold(words, m, (m, w) => {
        map.set(m, w, map.get_or(m, w, 0) + 1)
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
2 |     let words = string.split(s, " ").filter(|s| !s.is_empty()).map(|s| s.to_lower())
  |                                             ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:15
  in variable words
  hint: Check the variable name
  |
4 |     list.fold(words, m, (m, w) => {
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
    let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower())
    let m = map.new()
    list.fold(words, m, (map, w) => {
        map.set(map, w, map.get_or(map, w, 0) + 1)
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
2 |     let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower())
  |                                             ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:15
  in variable words
  hint: Check the variable name
  |
4 |     list.fold(words, m, (map, w) => {
  |               ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
