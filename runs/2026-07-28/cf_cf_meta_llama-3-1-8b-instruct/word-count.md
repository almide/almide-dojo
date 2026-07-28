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
    let words = string.split(s, " ").filter(|x| !string.is_empty(x)).map(|x| x.to_lower()).list;
    list.fold(words, map.new(), (map, word) => {
        let count = map.get_or(word, 0);
        map.set(word, count + 1);
        map
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
    let words = string.split(s, " ").filter(|x| !string.is_empty(x)).map(|x| x.to_lower()).list;
    list.fold(words, map.new(), (map, word) => {
        let count = map.get_or(word, 0);
        map.set(word, count + 1);
        map
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
2 |     let words = string.split(s, " ").filter(|x| !string.is_empty(x)).map(|x| x.to_lower()).list;
  |                                             ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-1.almd:3:15
  in variable words
  hint: Check the variable name
  |
3 |     list.fold(words, map.new(), (map, word) => {
  |               ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:4:38
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
4 |         let count = map.get_or(word, 0);
  |                                      ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:31
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |         map.set(word, count + 1);
  |                               ^

4 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter((x) => !string.is_empty(x)).map((x) => x.to_lower()).list;
    list.fold(words, map.new(), (map, word) => {
        let count = map.get_or(word, 0, 0);
        map.set(map, word, count + 1);
        map
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
2 |     let words = string.split(s, " ").filter((x) => !string.is_empty(x)).map((x) => x.to_lower()).list;
  |                                                    ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:3:15
  in variable words
  hint: Check the variable name
  |
3 |     list.fold(words, map.new(), (map, word) => {
  |               ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Map[Int, Int], Int]
  --> /tmp/dojo-word-count-2.almd:6:9
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
6 |         map
  |         ^^^

3 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ").filter((x) => not string.is_empty(x)).map((x) => x.to_lower()).list;
    let freq_map = map.new();
    list.fold(words, freq_map, (map, word) => {
        let count = map.get_or(word, 0);
        map.set(map, word, count + 1);
        map
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E005]: argument 'f' expects fn(String) -> B but got fn(fn() -> ?1) -> ?1
  --> /tmp/dojo-word-count-3.almd:2:33
  in call to list.map()
  hint: Fix the argument type
  |
2 |     let words = string.split(s, " ").filter((x) => not string.is_empty(x)).map((x) => x.to_lower()).list;
  |                                 ^^^
error[E013]: no field 'list' on list
  --> /tmp/dojo-word-count-3.almd:2:33
  in field access .list
  hint: Almide values have no fields. Use `list.<fn>(x)` (or `x |> list.<fn>`) — see docs/stdlib/list.md for available functions.
  |
2 |     let words = string.split(s, " ").filter((x) => not string.is_empty(x)).map((x) => x.to_lower()).list;
  |                                 ^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:5:38
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |         let count = map.get_or(word, 0);
  |                                      ^
error[E001]: type mismatch in call to list.map(): expected fn(String) -> B but got fn(fn() -> ?1) -> ?1
  --> /tmp/dojo-word-count-3.almd:2:33
  in call to list.map()
  hint: Fix the expression type or change the expected type
  |
2 |     let words = string.split(s, " ").filter((x) => not string.is_empty(x)).map((x) => x.to_lower()).list;
  |                                 ^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Map[Int, V], ?5]
  --> /tmp/dojo-word-count-3.almd:7:9
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
7 |         map
  |         ^^^

5 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
