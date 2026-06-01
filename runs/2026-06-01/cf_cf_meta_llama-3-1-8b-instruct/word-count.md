# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: type-error
- **diagnostic code**: `E005`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] {
    let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower())
    olup.fold(words, map.new(), |m, word| {
        map.set(m, word, map.get_or(m, word, 0) + 1)
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
    let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower())
    map.fold(words, map.new(), |m, word| {
        map.set(m, word, map.get_or(m, word, 0) + 1)
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
2 |     let words = string.split(s, " ").filter(|x| !x.is_empty()).map(|x| x.to_lower())
  |                                             ^
error: '|x|' closure syntax is not valid in Almide at line 3:32
  --> /tmp/dojo-word-count-1.almd:3:32
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
3 |     map.fold(words, map.new(), |m, word| {
  |                                ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 5:6 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:5:6
  |
5 |     })
  |      ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:4:17
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
4 |         map.set(m, word, map.get_or(m, word, 0) + 1)
  |                 ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:4:20
  in variable word
  hint: Check the variable name
  |
4 |         map.set(m, word, map.get_or(m, word, 0) + 1)
  |                    ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:4:37
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
4 |         map.set(m, word, map.get_or(m, word, 0) + 1)
  |                                     ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:4:40
  in variable word
  hint: Check the variable name
  |
4 |         map.set(m, word, map.get_or(m, word, 0) + 1)
  |                                        ^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter((x) => !x.is_empty()).map((x) => x.to_lower())
    let m = map.new()
    list.fold(words, m, (acc, word) => {
        map.set(acc, word, map.get_or(acc, word, 0) + 1)
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: '!' is not valid in Almide at line 2:52
  --> /tmp/dojo-word-count-2.almd:2:52
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |     let words = string.split(s, " ").filter((x) => !x.is_empty()).map((x) => x.to_lower())
  |                                                    ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:15
  in variable words
  hint: Check the variable name
  |
4 |     list.fold(words, m, (acc, word) => {
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
    let words = string.split(s, " ").filter((x) => not x.is_empty()).map((x) => x.to_lower())
    let m = map.new()
    list.fold(words, m, (acc, word) => {
        map.set(acc, word, map.get_or(acc, word, 0) + 1)
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> ?3) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:33
  in call to list.filter()
  hint: Fix the argument type
  |
2 |     let words = string.split(s, " ").filter((x) => not x.is_empty()).map((x) => x.to_lower())
  |                                 ^^^
error[E005]: argument 'f' expects fn(String) -> B but got fn(fn() -> ?1) -> ?1
  --> /tmp/dojo-word-count-3.almd:2:33
  in call to list.map()
  hint: Fix the argument type
  |
2 |     let words = string.split(s, " ").filter((x) => not x.is_empty()).map((x) => x.to_lower())
  |                                 ^^^
error[E001]: type mismatch in call to list.filter(): expected fn(String) -> Bool but got fn(fn() -> ?3) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:33
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |     let words = string.split(s, " ").filter((x) => not x.is_empty()).map((x) => x.to_lower())
  |                                 ^^^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got fn(fn() -> ?1) -> ?1
  --> /tmp/dojo-word-count-3.almd:2:33
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |     let words = string.split(s, " ").filter((x) => not x.is_empty()).map((x) => x.to_lower())
  |                                 ^^^

4 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
