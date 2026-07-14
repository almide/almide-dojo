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
  list.fold(words, map.new(), (map, word) => map.set_or(word, 0, (map.get(word) + 1)))
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
  --> /tmp/dojo-word-count-0.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (map, word) => map.set_or(word, 0, (map.get(word) + 1)))
  |             ^^^^^
error[E004]: map.get() expects 2 argument(s) but got 1
  --> /tmp/dojo-word-count-0.almd:3:75
  in call to map.get()
  hint: Check the number of arguments
  try:
      // map.get() takes 2 arg(s) — you passed 1
      map.get(<m: Map[K, V]>, <key: K>)
  |
3 |   list.fold(words, map.new(), (map, word) => map.set_or(word, 0, (map.get(word) + 1)))
  |                                                                           ^^^^
error: operator '+' requires numeric, String, or List types but got Option[?5] and Int
  --> /tmp/dojo-word-count-0.almd:3:83
  in operator +
  hint: Use + with numeric types, String, or List
  |
3 |   list.fold(words, map.new(), (map, word) => map.set_or(word, 0, (map.get(word) + 1)))
  |                                                                                   ^
error[E002]: undefined function 'map.set_or'
  --> /tmp/dojo-word-count-0.almd:3:83
  in call to map.set_or()
  hint: Did you mean `map.get_or`?
  try:
      // map.set_or(...)  →  map.get_or(...)
      map.get_or(...)
  |
3 |   list.fold(words, map.new(), (map, word) => map.set_or(word, 0, (map.get(word) + 1)))
  |                                                                                   ^

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
  list.fold(words, map.new(), (map, word) => 
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
  --> /tmp/dojo-word-count-1.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(word, 0)
  |     ^^^
error: Expected expression at line 5:29 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:5:29
  |
5 |     map.set(word, count + 1))
  |                             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:13
  in variable word
  hint: Check the variable name
  |
5 |     map.set(word, count + 1))
  |             ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-1.almd:5:19
  in variable count
  hint: Check the variable name
  |
5 |     map.set(word, count + 1))
  |                   ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-1.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |     map.set(word, count + 1))
  |                           ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:5:27
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |     map.set(word, count + 1))
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
  list.fold(words, map.new(), (map, word) => 
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
    map)

fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (map, word) => 
    map.set(word, map.get_or(word, 0) + 1)
    map)
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
  --> /tmp/dojo-word-count-2.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(word, 0)
  |     ^^^
error: Expected expression at line 6:8 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:6:8
  |
6 |     map)
  |        ^
error: Expected expression at line 9:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:9:51
  |
9 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |                                                   ^
error: Missing ',' between function arguments at line 12:5
  --> /tmp/dojo-word-count-2.almd:12:5
  hint: Add a comma after the previous element. Example: f(a, b, c)
   |
12 |     map)
   |     ^
error[E012]: duplicate function 'word_count'
  at line 8
  in fn word_count
  hint: Rename one of the definitions, or remove the earlier one. Almide requires each function name to be unique within a module.
  |
1 | fn word_count(s: String) -> Map[String, Int] =
  | ------------------------------------- first definition of 'word_count' here
...
8 | fn word_count(s: String) -> Map[String, Int] =
  | ^^^^^^^^^^^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:5:13
  in variable word
  hint: Check the variable name
  |
5 |     map.set(word, count + 1)
  |             ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-2.almd:5:19
  in variable count
  hint: Check the variable name
  |
5 |     map.set(word, count + 1)
  |                   ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-2.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E003]: undefined variable 'map'
  --> /tmp/dojo-word-count-2.almd:6:5
  in variable map
  hint: Check the variable name
  |
6 |     map)
  |     ^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:6:5
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |     map)
  |     ^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:9:3
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
9 |   let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  |   ^^^

12 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => x != "")
  list.fold(words, map.new(), (map, word) => 
    let count = map.get_or(word, 0)
    map.set(word, count + 1)
    map.set(map, word, count + 1)
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
  --> /tmp/dojo-word-count-3.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(word, 0)
  |     ^^^
error: Expected expression at line 7:3 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:7:3
  |
7 |   )
  |   ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:5:13
  in variable word
  hint: Check the variable name
  |
5 |     map.set(word, count + 1)
  |             ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:5:19
  in variable count
  hint: Check the variable name
  |
5 |     map.set(word, count + 1)
  |                   ^^^^^
error[E004]: map.set() expects 3 argument(s) but got 2
  --> /tmp/dojo-word-count-3.almd:5:27
  in call to map.set()
  hint: Check the number of arguments
  try:
      // map.set() takes 3 arg(s) — you passed 2
      map.set(<m: Map[K, V]>, <key: K>, <value: V>)
  |
5 |     map.set(word, count + 1)
  |                           ^
error[E003]: undefined variable 'map'
  --> /tmp/dojo-word-count-3.almd:6:13
  in variable map
  hint: Check the variable name
  |
6 |     map.set(map, word, count + 1)
  |             ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:6:18
  in variable word
  hint: Check the variable name
  |
6 |     map.set(map, word, count + 1)
  |                  ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:6:24
  in variable count
  hint: Check the variable name
  |
6 |     map.set(map, word, count + 1)
  |                        ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:6:32
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |     map.set(map, word, count + 1)
  |                                ^

10 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
