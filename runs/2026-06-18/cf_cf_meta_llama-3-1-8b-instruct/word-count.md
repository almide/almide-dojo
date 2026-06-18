# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: import-error
- **diagnostic code**: `E004`

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] {
  let words = string.split(s, " ").list.filter(|x| !string.is_empty(x)).list.map(|x| string.to_lower(x))
  let mut map = map.new()
  words.list.fold(map, 0, |map, word| {
    let count = map.get_or(word, 0) + 1
    map.set(word, count)
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
  let words = string.split(s, " ").list.filter(|x| !string.is_empty(x)).list.map(|x| string.to_lower(x))
  let mut map = map.new()
  words.list.fold(map, 0, |map, word| {
    let count = map.get_or(word, 0) + 1
    map.set(word, count)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:48
  --> /tmp/dojo-word-count-1.almd:2:48
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").list.filter(|x| !string.is_empty(x)).list.map(|x| string.to_lower(x))
  |                                                ^
error: 'let mut' is not valid in Almide at line 3:7
  --> /tmp/dojo-word-count-1.almd:3:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |   let mut map = map.new()
  |       ^
error: '|x|' closure syntax is not valid in Almide at line 4:27
  --> /tmp/dojo-word-count-1.almd:4:27
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |   words.list.fold(map, 0, |map, word| {
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:4 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:7:4
  |
7 |   })
  |    ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:28
  in variable word
  hint: Check the variable name
  |
5 |     let count = map.get_or(word, 0) + 1
  |                            ^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     let count = map.get_or(word, 0) + 1
  |                                  ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:6:13
  in variable word
  hint: Check the variable name
  |
6 |     map.set(word, count)
  |             ^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:6:19
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |     map.set(word, count)
  |                   ^^^^^

8 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").list.filter(|x| !string.is_empty(x)).list.map(|x| string.to_lower(x))
  var map = map.new()
  words.list.fold(map, 0, |map, word| {
    let count = map.get_or(word, 0) + 1
    map.set(word, count)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: '|x|' closure syntax is not valid in Almide at line 2:48
  --> /tmp/dojo-word-count-2.almd:2:48
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").list.filter(|x| !string.is_empty(x)).list.map(|x| string.to_lower(x))
  |                                                ^
error: '|x|' closure syntax is not valid in Almide at line 4:27
  --> /tmp/dojo-word-count-2.almd:4:27
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |   words.list.fold(map, 0, |map, word| {
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:4 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:7:4
  |
7 |   })
  |    ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:5:28
  in variable word
  hint: Check the variable name
  |
5 |     let count = map.get_or(word, 0) + 1
  |                            ^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     let count = map.get_or(word, 0) + 1
  |                                  ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:6:13
  in variable word
  hint: Check the variable name
  |
6 |     map.set(word, count)
  |             ^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:6:19
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |     map.set(word, count)
  |                   ^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").list.filter((x) => !string.is_empty(x)).list.map((x) => string.to_lower(x))
  var map = map.new()
  words.list.fold(map, 0, (map, word) => {
    let count = map.get_or(word, 0) + 1
    map.set(word, count)
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: '!' is not valid in Almide at line 2:55
  --> /tmp/dojo-word-count-3.almd:2:55
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |   let words = string.split(s, " ").list.filter((x) => !string.is_empty(x)).list.map((x) => string.to_lower(x))
  |                                                       ^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:5:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     let count = map.get_or(word, 0) + 1
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:6:19
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |     map.set(word, count)
  |                   ^^^^^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:3
  in variable words
  hint: Check the variable name
  |
4 |   words.list.fold(map, 0, (map, word) => {
  |   ^^^^^

4 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
