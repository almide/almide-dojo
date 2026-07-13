# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => !string.is_empty(x))
  list.fold(words, map.new(), (m, word) => 
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => !string.is_empty(x))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-0.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(m, word, 0) + 1
  |     ^^^
error: Expected expression at line 5:28 (got RParen ')')
  --> /tmp/dojo-word-count-0.almd:5:28
  |
5 |     map.set(m, word, count))
  |                            ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-0.almd:5:13
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
5 |     map.set(m, word, count))
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-0.almd:5:16
  in variable word
  hint: Check the variable name
  |
5 |     map.set(m, word, count))
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-0.almd:5:22
  in variable count
  hint: Check the variable name
  |
5 |     map.set(m, word, count))
  |                      ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:5:22
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
5 |     map.set(m, word, count))
  |                      ^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => !string.is_empty(x))
  list.fold(words, map.new(), (m, word) => 
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
    m)
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => !string.is_empty(x))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-1.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(m, word, 0) + 1
  |     ^^^
error: Expected expression at line 6:6 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:6:6
  |
6 |     m)
  |      ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:5:13
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
5 |     map.set(m, word, count)
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:5:16
  in variable word
  hint: Check the variable name
  |
5 |     map.set(m, word, count)
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-1.almd:5:22
  in variable count
  hint: Check the variable name
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-1.almd:6:5
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
6 |     m)
  |     ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:6:5
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |     m)
  |     ^

8 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => !string.is_empty(x))
  list.fold(words, map.new(), (m, word) => 
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
    map)
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => !string.is_empty(x))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-2.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(m, word, 0) + 1
  |     ^^^
error: Expected expression at line 6:8 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:6:8
  |
6 |     map)
  |        ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-2.almd:5:13
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
5 |     map.set(m, word, count)
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:5:16
  in variable word
  hint: Check the variable name
  |
5 |     map.set(m, word, count)
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-2.almd:5:22
  in variable count
  hint: Check the variable name
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
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

8 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => !string.is_empty(x))
  list.fold(words, map.new(), (m, word) => 
    let count = map.get_or(m, word, 0) + 1
    map.set(m, word, count)
    m)
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => !string.is_empty(x))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = map.get_or(m, word, 0) + 1
  |     ^^^
error: Expected expression at line 6:6 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:6:6
  |
6 |     m)
  |      ^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-3.almd:5:13
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
5 |     map.set(m, word, count)
  |             ^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:5:16
  in variable word
  hint: Check the variable name
  |
5 |     map.set(m, word, count)
  |                ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:5:22
  in variable count
  hint: Check the variable name
  |
5 |     map.set(m, word, count)
  |                      ^^^^^
error[E003]: undefined variable 'm'
  --> /tmp/dojo-word-count-3.almd:6:5
  in variable m
  hint: Did you mean `s`?
  try:
      // m  →  s
      s
  |
6 |     m)
  |     ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:6:5
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |     m)
  |     ^

8 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
