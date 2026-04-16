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
  let words = string.split(s, " ").filter(|x| !x.is_empty()).to_list();
  let map = map.new();
  list.fold(words, map, (map, word) => {
    map.set_or(word, 0, (m) => m + 1);
    map
  });
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
  let words = string.split(s, " ").filter(|x| !x.is_empty()).to_list();
  let map = map.new();
  list.fold(words, map, (map, word) => {
    map.set_or(word, 0, (m) => m + 1);
    map
  });
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:43
  --> /tmp/dojo-word-count-1.almd:2:43
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").filter(|x| !x.is_empty()).to_list();
  |                                           ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, map, (map, word) => {
  |             ^^^^^
error[E002]: undefined function 'map.set_or'
  --> /tmp/dojo-word-count-1.almd:5:36
  in call to map.set_or()
  hint: Did you mean `map.get_or`?
  try:
      // map.set_or(...)  →  map.get_or(...)
      map.get_or(...)
  |
5 |     map.set_or(word, 0, (m) => m + 1);
  |                                    ^

3 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter(|x| !x.is_empty()).to_list();
  let map = map.new();
  list.fold(words, map, (map, word) => {
    map.set(word, map.get_or(word, 0) + 1);
    map
  });
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: '|x|' closure syntax is not valid in Almide at line 2:43
  --> /tmp/dojo-word-count-2.almd:2:43
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").filter(|x| !x.is_empty()).to_list();
  |                                           ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, map, (map, word) => {
  |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:36
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     map.set(word, map.get_or(word, 0) + 1);
  |                                    ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:41
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |     map.set(word, map.get_or(word, 0) + 1);
  |                                         ^

4 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter((x) => !x.is_empty()).to_list();
  let map = map.new();
  list.fold(words, map, (map, word) => {
    map.set(word, map.get_or(word, 0) + 1);
    map
  });
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: '!' is not valid in Almide at line 2:50
  --> /tmp/dojo-word-count-3.almd:2:50
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |   let words = string.split(s, " ").filter((x) => !x.is_empty()).to_list();
  |                                                  ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, map, (map, word) => {
  |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:5:36
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     map.set(word, map.get_or(word, 0) + 1);
  |                                    ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:5:41
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |     map.set(word, map.get_or(word, 0) + 1);
  |                                         ^

4 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
