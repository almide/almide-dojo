# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  let map = map.new[String, Int]()
  list.fold(words, map, (map, word) => map.set(word, map.get_or(word, 0) + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, map, (map, word) => map.set(word, map.get_or(word, 0) + 1))
  |             ^^^^^
error[E004]: map.get_or() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:4:71
  in call to map.get_or()
  hint: Check the number of arguments
  try:
      // map.get_or() takes 3 arg(s) — you passed 2
      map.get_or(<m: Map[K, V]>, <key: K>, <default: V>)
  |
4 |   list.fold(words, map, (map, word) => map.set(word, map.get_or(word, 0) + 1))
  |                                                                       ^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-0.almd:4:76
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
4 |   list.fold(words, map, (map, word) => map.set(word, map.get_or(word, 0) + 1))
  |                                                                            ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Map[Int, ?1]
  --> /tmp/dojo-word-count-0.almd:4:76
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
4 |   list.fold(words, map, (map, word) => map.set(word, map.get_or(word, 0) + 1))
  |                                                                            ^

5 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  let map = map.new[String, Int]()
  list.fold(words, map, (m, word) => 
    let count = map.get_or(word, 0)
    map.set(word, count + 1))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-1.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = map.get_or(word, 0)
  |     ^^^
error: Expected expression at line 6:29 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:6:29
  |
6 |     map.set(word, count + 1))
  |                             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:6:13
  in variable word
  hint: Check the variable name
  |
6 |     map.set(word, count + 1))
  |             ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-1.almd:6:19
  in variable count
  hint: Check the variable name
  |
6 |     map.set(word, count + 1))
  |                   ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:6:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
6 |     map.set(word, count + 1))
  |                           ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:6:27
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |     map.set(word, count + 1))
  |                           ^

7 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  let map = map.new[String, Int]()
  list.fold(words, map, (m, word) => 
    let count = map.get_or(word, 0)
    map.set(m, word, count + 1)
    m)
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-2.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = map.get_or(word, 0)
  |     ^^^
error: Expected expression at line 7:6 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:7:6
  |
7 |     m)
  |      ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-2.almd:6:13
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
6 |     map.set(m, word, count + 1)
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:6:16
  in variable word
  hint: Check the variable name
  |
6 |     map.set(m, word, count + 1)
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-2.almd:6:22
  in variable count
  hint: Check the variable name
  |
6 |     map.set(m, word, count + 1)
  |                      ^^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-2.almd:7:5
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
7 |     m)
  |     ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:7:5
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
7 |     m)
  |     ^

8 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  let map = map.new[String, Int]()
  list.fold(words, map, (m, word) => 
    let count = map.get_or(word, 0)
    let new_map = map.set(m, word, count + 1)
    new_map
  )
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = map.get_or(word, 0)
  |     ^^^
error: Expected expression at line 8:3 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:8:3
  |
8 |   )
  |   ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-3.almd:6:27
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
6 |     let new_map = map.set(m, word, count + 1)
  |                           ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:6:30
  in variable word
  hint: Check the variable name
  |
6 |     let new_map = map.set(m, word, count + 1)
  |                              ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:6:36
  in variable count
  hint: Check the variable name
  |
6 |     let new_map = map.set(m, word, count + 1)
  |                                    ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:7:5
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
7 |     new_map
  |     ^^^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
