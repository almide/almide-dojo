# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => not string.is_empty(x))
  list.fold(words, map.new(), 
            (acc, word) => 
              let count = map.get_or(acc, word, 0) + 1
              map.set(acc, word, count))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-0.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => not string.is_empty(x))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-0.almd:5:15
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |               let count = map.get_or(acc, word, 0) + 1
  |               ^^^
error: Expected expression at line 6:40 (got RParen ')')
  --> /tmp/dojo-word-count-0.almd:6:40
  |
6 |               map.set(acc, word, count))
  |                                        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-0.almd:6:23
  in variable acc
  hint: Check the variable name
  |
6 |               map.set(acc, word, count))
  |                       ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-0.almd:6:28
  in variable word
  hint: Check the variable name
  |
6 |               map.set(acc, word, count))
  |                            ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-0.almd:6:34
  in variable count
  hint: Check the variable name
  |
6 |               map.set(acc, word, count))
  |                                  ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-0.almd:6:34
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |               map.set(acc, word, count))
  |                                  ^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => not string.is_empty(x))
  list.fold(words, map.new(), 
            (acc, word) => 
              let count = map.get_or(acc, word, 0) + 1
              map.set(acc, word, count)) |> map.unwrap_or(map.new())
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-1.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => not string.is_empty(x))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-1.almd:5:15
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |               let count = map.get_or(acc, word, 0) + 1
  |               ^^^
error: Expected expression at line 6:40 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:6:40
  |
6 |               map.set(acc, word, count)) |> map.unwrap_or(map.new())
  |                                        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:6:23
  in variable acc
  hint: Check the variable name
  |
6 |               map.set(acc, word, count)) |> map.unwrap_or(map.new())
  |                       ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-1.almd:6:28
  in variable word
  hint: Check the variable name
  |
6 |               map.set(acc, word, count)) |> map.unwrap_or(map.new())
  |                            ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-1.almd:6:34
  in variable count
  hint: Check the variable name
  |
6 |               map.set(acc, word, count)) |> map.unwrap_or(map.new())
  |                                  ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-1.almd:6:34
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |               map.set(acc, word, count)) |> map.unwrap_or(map.new())
  |                                  ^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => not string.is_empty(x))
  list.fold(words, map.new(), 
            (acc, word) => 
              let count = map.get_or(acc, word, 0) + 1
              map.set(acc, word, count))
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-2.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => not string.is_empty(x))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-2.almd:5:15
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |               let count = map.get_or(acc, word, 0) + 1
  |               ^^^
error: Expected expression at line 6:40 (got RParen ')')
  --> /tmp/dojo-word-count-2.almd:6:40
  |
6 |               map.set(acc, word, count))
  |                                        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-2.almd:6:23
  in variable acc
  hint: Check the variable name
  |
6 |               map.set(acc, word, count))
  |                       ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-2.almd:6:28
  in variable word
  hint: Check the variable name
  |
6 |               map.set(acc, word, count))
  |                            ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-2.almd:6:34
  in variable count
  hint: Check the variable name
  |
6 |               map.set(acc, word, count))
  |                                  ^^^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:6:34
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
6 |               map.set(acc, word, count))
  |                                  ^^^^^

7 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ") |> list.filter(fn(x) => not string.is_empty(x))
  list.fold(words, map.new(), 
            (acc, word) => 
              let count = map.get_or(acc, word, 0) + 1
              map.set(acc, word, count)) |>
  map.unwrap_or(map.new())
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: Expected expression at line 2:51 (got Fn 'fn')
  --> /tmp/dojo-word-count-3.almd:2:51
  |
2 |   let words = string.split(s, " ") |> list.filter(fn(x) => not string.is_empty(x))
  |                                                   ^
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:5:15
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |               let count = map.get_or(acc, word, 0) + 1
  |               ^^^
error: Expected expression at line 6:40 (got RParen ')')
  --> /tmp/dojo-word-count-3.almd:6:40
  |
6 |               map.set(acc, word, count)) |>
  |                                        ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-3.almd:6:23
  in variable acc
  hint: Check the variable name
  |
6 |               map.set(acc, word, count)) |>
  |                       ^^^
error[E003]: undefined variable 'word'
  --> /tmp/dojo-word-count-3.almd:6:28
  in variable word
  hint: Check the variable name
  |
6 |               map.set(acc, word, count)) |>
  |                            ^^^^
error[E003]: undefined variable 'count'
  --> /tmp/dojo-word-count-3.almd:6:34
  in variable count
  hint: Check the variable name
  |
6 |               map.set(acc, word, count)) |>
  |                                  ^^^^^
error[E002]: undefined function 'map.unwrap_or'
  --> /tmp/dojo-word-count-3.almd:7:24
  in call to map.unwrap_or()
  hint: No function 'unwrap_or' in module 'map'. See docs/CHEATSHEET.md for available functions
  |
7 |   map.unwrap_or(map.new())
  |                        ^

7 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
