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
        |> list.filter(fn(x) => string.is_not_empty(x))
        |> list.map(fn(x) => x)
        |> list.fold(map.new(), fn(map, word) => {
            let count = map.get_or(word, 0);
            map.set(word, count + 1);
            map
        })
    }
    words
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
error: Expected function name at line 3:26 (got LParen '(')
  --> /tmp/dojo-word-count-0.almd:3:26
  |
3 |         |> list.filter(fn(x) => string.is_not_empty(x))
  |                          ^
error: Expected function name at line 4:23 (got LParen '(')
  --> /tmp/dojo-word-count-0.almd:4:23
  |
4 |         |> list.map(fn(x) => x)
  |                       ^
error: Expected function name at line 5:35 (got LParen '(')
  --> /tmp/dojo-word-count-0.almd:5:35
  |
5 |         |> list.fold(map.new(), fn(map, word) => {
  |                                   ^

4 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ")
        |> list.filter(fn(x) => string.is_not_empty(x))
        |> list.map(fn(x) => x)
        |> list.fold(map.new(), fn(map, word) => {
            let count = map.get_or(word, 0);
            map.set(word, count + 1);
            map
        })
    words
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 3:24 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:3:24
  |
3 |         |> list.filter(fn(x) => string.is_not_empty(x))
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:10 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:9:10
  |
9 |         })
  |          ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:6:36
  in variable word
  hint: Check the variable name
  |
6 |             let count = map.get_or(word, 0);
  |                                    ^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:6:42
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
6 |             let count = map.get_or(word, 0);
  |                                          ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:7:21
  in variable word
  hint: Check the variable name
  |
7 |             map.set(word, count + 1);
  |                     ^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:7:35
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
7 |             map.set(word, count + 1);
  |                                   ^
error[E003]: undefined variable 'map'
  --> /tmp/dojo-word-count-1.almd:8:13
  in variable map
  hint: Check the variable name
  |
8 |             map
  |             ^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ")
        |> list.filter(fn(x) => string.is_not_empty(x))
        |> list.map(fn(x) => x)
        |> list.fold(map.new(), fn(m, word) => {
            let count = map.get_or(m, word, 0);
            map.set(m, word, count + 1);
            m
        })
    map
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 3:24 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:3:24
  |
3 |         |> list.filter(fn(x) => string.is_not_empty(x))
  |                        ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 9:10 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:9:10
  |
9 |         })
  |          ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-2.almd:6:36
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
6 |             let count = map.get_or(m, word, 0);
  |                                    ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:6:39
  in variable word
  hint: Check the variable name
  |
6 |             let count = map.get_or(m, word, 0);
  |                                       ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-2.almd:7:21
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
7 |             map.set(m, word, count + 1);
  |                     ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:7:24
  in variable word
  hint: Check the variable name
  |
7 |             map.set(m, word, count + 1);
  |                        ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-2.almd:8:13
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
8 |             m
  |             ^

7 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
    let words = string.split(s, " ")
        |> list.filter(fn(x) => string.is_not_empty(x))
    list.fold(words, map.new(), fn(m, word) => {
        let count = map.get_or(m, word, 0);
        map.set(m, word, count + 1);
        m
    })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 3:24 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:3:24
  |
3 |         |> list.filter(fn(x) => string.is_not_empty(x))
  |                        ^
error: Expected expression at line 4:33 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:4:33
  |
4 |     list.fold(words, map.new(), fn(m, word) => {
  |                                 ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:6 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:8:6
  |
8 |     })
  |      ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-3.almd:5:32
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
5 |         let count = map.get_or(m, word, 0);
  |                                ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:5:35
  in variable word
  hint: Check the variable name
  |
5 |         let count = map.get_or(m, word, 0);
  |                                   ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-3.almd:6:17
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
6 |         map.set(m, word, count + 1);
  |                 ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:6:20
  in variable word
  hint: Check the variable name
  |
6 |         map.set(m, word, count + 1);
  |                    ^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-3.almd:7:9
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
7 |         m
  |         ^

8 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
