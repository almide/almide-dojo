# word-count

- **model**: `cf:@cf/meta/llama-3.1-8b-instruct`
- **success**: no
- **retries**: 3
- **category**: parse-error

## Attempts

### Attempt 1 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter(|x| x.len() > 0)
  list.fold(words, map.new(), (m, word) => 
    match map.get(m, word) {
      some(count) => map.set(m, word, count + 1),
      none => map.set(m, word, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-0.almd
error: '|x|' closure syntax is not valid in Almide at line 2:43
  --> /tmp/dojo-word-count-0.almd:2:43
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").filter(|x| x.len() > 0)
  |                                           ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-0.almd:3:13
  in variable words
  hint: Check the variable name
  |
3 |   list.fold(words, map.new(), (m, word) =>
  |             ^^^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-0.almd:
compile failed
FAILED: /tmp/dojo-word-count-0.almd

1/1 test file(s) failed

```

### Attempt 2 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter((x) => x.len() > 0)
  let map_ = map.new()
  list.fold(words, map_, (m, word) => 
    match map.get(m, word) {
      some(count) => map.set(m, word, count + 1),
      none => map.set(m, word, 1)
    })
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-1.almd
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> Int) -> Bool
  --> /tmp/dojo-word-count-1.almd:2:31
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let words = string.split(s, " ").filter((x) => x.len() > 0)
  |                               ^^^
error[E001]: type mismatch in call to list.filter(): expected fn(String) -> Bool but got fn(fn() -> Int) -> Bool
  --> /tmp/dojo-word-count-1.almd:2:31
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let words = string.split(s, " ").filter((x) => x.len() > 0)
  |                               ^^^

2 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter((x) => x.len() > 0)
  let map_ = map.new()
  list.fold(words, map_, (m, word) => 
    let count = match map.get(m, word) {
      some(count) => count + 1,
      none => 1
    }
    map.set(m, word, count))

  map_
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-2.almd:5:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
5 |     let count = match map.get(m, word) {
  |     ^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:5 (got RBrace '}')
  --> /tmp/dojo-word-count-2.almd:8:5
  |
8 |     }
  |     ^
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> Int) -> Bool
  --> /tmp/dojo-word-count-2.almd:2:31
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let words = string.split(s, " ").filter((x) => x.len() > 0)
  |                               ^^^
error[E001]: type mismatch in call to list.filter(): expected fn(String) -> Bool but got fn(fn() -> Int) -> Bool
  --> /tmp/dojo-word-count-2.almd:2:31
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let words = string.split(s, " ").filter((x) => x.len() > 0)
  |                               ^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-2.almd:3:21
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
3 |   let map_ = map.new()
  |                     ^

5 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = 
  let words = string.split(s, " ").filter((x) => x.len() > 0)
  list.fold(words, map.new(), (m, word) => 
    let count = match map.get(m, word) {
      some(count) => count + 1,
      none => 1
    }
    map.set(m, word, count))
  map_
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: 'let' is not an expression in Almide
  --> /tmp/dojo-word-count-3.almd:4:5
  in let-in
  hint: Lists are immutable — use `+` to build a new list: `some(stack + [item])`. If you need a temporary binding, use a block: `{ let x = expr; body }`
  |
4 |     let count = match map.get(m, word) {
  |     ^^^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 7:5 (got RBrace '}')
  --> /tmp/dojo-word-count-3.almd:7:5
  |
7 |     }
  |     ^
error[E005]: argument 'f' expects fn(String) -> Bool but got fn(fn() -> Int) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:31
  in call to list.filter()
  hint: Fix the argument type
  |
2 |   let words = string.split(s, " ").filter((x) => x.len() > 0)
  |                               ^^^
error[E001]: type mismatch in call to list.filter(): expected fn(String) -> Bool but got fn(fn() -> Int) -> Bool
  --> /tmp/dojo-word-count-3.almd:2:31
  in call to list.filter()
  hint: Fix the expression type or change the expected type
  |
2 |   let words = string.split(s, " ").filter((x) => x.len() > 0)
  |                               ^^^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Unit
  --> /tmp/dojo-word-count-3.almd:2:31
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  try:
      // fn body ends with a statement (returns Unit); add a final expression that evaluates to Map[String, Int]:
      //   let tmp = <computation>
      //   tmp                            // <-- the returned value
      // Or inline:
      //   <expression>                   // must have type Map[String, Int]
  |
2 |   let words = string.split(s, " ").filter((x) => x.len() > 0)
  |                               ^^^

5 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
