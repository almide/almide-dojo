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
  let words = string.split(s, " ").filter(|x| !x.is_empty());
  let mut map = map.new();
  words.fold(0, |acc, word| {
    let count = map.get_or(word, 0);
    map.set(word, count + 1);
    acc
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
  let words = string.split(s, " ").filter(|x| !x.is_empty());
  let mut map = map.new();
  words.fold(0, |acc, word| {
    let count = map.get_or(word, 0);
    map.set(word, count + 1);
    acc
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: '|x|' closure syntax is not valid in Almide at line 2:43
  --> /tmp/dojo-word-count-1.almd:2:43
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").filter(|x| !x.is_empty());
  |                                           ^
error: 'let mut' is not valid in Almide at line 3:7
  --> /tmp/dojo-word-count-1.almd:3:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |   let mut map = map.new();
  |       ^
error: '|x|' closure syntax is not valid in Almide at line 4:17
  --> /tmp/dojo-word-count-1.almd:4:17
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |   words.fold(0, |acc, word| {
  |                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:4 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:8:4
  |
8 |   })
  |    ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:28
  in variable word
  hint: Check the variable name
  |
5 |     let count = map.get_or(word, 0);
  |                            ^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     let count = map.get_or(word, 0);
  |                                  ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:6:13
  in variable word
  hint: Check the variable name
  |
6 |     map.set(word, count + 1);
  |             ^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:6:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |     map.set(word, count + 1);
  |                           ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:7:5
  in variable acc
  hint: Check the variable name
  |
7 |     acc
  |     ^^^

9 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter((x) => !x.is_empty());
  let map = map.new();
  words.fold(0, (acc, word) => {
    let count = map.get_or(word, 0);
    map.set(word, count + 1);
    acc
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: '!' is not valid in Almide at line 2:50
  --> /tmp/dojo-word-count-2.almd:2:50
  hint: Use 'not' for boolean negation. Write: not x
  |
2 |   let words = string.split(s, " ").filter((x) => !x.is_empty());
  |                                                  ^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:34
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
5 |     let count = map.get_or(word, 0);
  |                                  ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:6:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |     map.set(word, count + 1);
  |                           ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:3
  in variable words
  hint: Check the variable name
  |
4 |   words.fold(0, (acc, word) => {
  |   ^^^^^

4 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter((x) => not x.is_empty());
  let map = map.new();
  words.fold(0, (acc, word) => {
    let count = map.get_or(word, map.new(), 0);
    map.set(word, count + 1);
    acc
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> ?1) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:31
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let words = string.split(s, " ").filter((x) => not x.is_empty());
  |                               ^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:6:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |     map.set(word, count + 1);
  |                           ^
error[E005]: argument 'f' expects fn(Int, String) -> Int but got fn(?4, Map[Map[?6, ?7], Int]) -> ?4
  --> /tmp/dojo-word-count-3.almd:4:3
  in call to list.fold()
  hint: Fix the argument type
  |
4 |   words.fold(0, (acc, word) => {
  |   ^^^^^
error[E001]: type mismatch in call to list.filter(): expected fn(String) -> Bool but got fn(fn() -> ?1) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:31
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let words = string.split(s, " ").filter((x) => not x.is_empty());
  |                               ^^^
error[E001]: type mismatch in call to map.set(): expected Map[?6, ?7] but got Int
  --> /tmp/dojo-word-count-3.almd:6:27
  in call to map.set()
  hint: Fix the expression type or change the expected type
  |
6 |     map.set(word, count + 1);
  |                           ^
error[E001]: type mismatch in call to list.fold(): expected fn(Int, String) -> Int but got fn(Int, Map[Map[?6, ?7], Int]) -> Int
  --> /tmp/dojo-word-count-3.almd:4:3
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
4 |   words.fold(0, (acc, word) => {
  |   ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Int
  --> /tmp/dojo-word-count-3.almd:4:3
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
4 |   words.fold(0, (acc, word) => {
  |   ^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
