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
  let words = string.split(s, " ").filter(|x| !x.is_empty()).map(string.to_lower)
  let mut count = map.new()
  list.fold(words, count, |acc, x| {
    let new_count = map.get_or(acc, x, 0) + 1
    map.set(acc, x, new_count)
    new_count
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
  let words = string.split(s, " ").filter(|x| !x.is_empty()).map(string.to_lower)
  let mut count = map.new()
  list.fold(words, count, |acc, x| {
    let new_count = map.get_or(acc, x, 0) + 1
    map.set(acc, x, new_count)
    new_count
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
2 |   let words = string.split(s, " ").filter(|x| !x.is_empty()).map(string.to_lower)
  |                                           ^
error: 'let mut' is not valid in Almide at line 3:7
  --> /tmp/dojo-word-count-1.almd:3:7
  hint: Use 'var' for mutable variables. Example: var x = 0
  |
3 |   let mut count = map.new()
  |       ^
error: '|x|' closure syntax is not valid in Almide at line 4:27
  --> /tmp/dojo-word-count-1.almd:4:27
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
4 |   list.fold(words, count, |acc, x| {
  |                           ^
error: Expected top-level declaration (fn, effect fn, type, let, trait, impl, test) at line 8:4 (got RParen ')')
  --> /tmp/dojo-word-count-1.almd:8:4
  |
8 |   })
  |    ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:5:32
  in variable acc
  hint: Check the variable name
  |
5 |     let new_count = map.get_or(acc, x, 0) + 1
  |                                ^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-word-count-1.almd:5:37
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
5 |     let new_count = map.get_or(acc, x, 0) + 1
  |                                     ^
error[E003]: undefined variable 'acc'
  --> /tmp/dojo-word-count-1.almd:6:13
  in variable acc
  hint: Check the variable name
  |
6 |     map.set(acc, x, new_count)
  |             ^^^
error[E003]: undefined variable 'x'
  --> /tmp/dojo-word-count-1.almd:6:18
  in variable x
  hint: Did you mean `s`?
  try:
      // x  →  s
      s
  |
6 |     map.set(acc, x, new_count)
  |                  ^
error[E001]: type mismatch in fn 'word_count': expected Map[String, Int] but got Int
  --> /tmp/dojo-word-count-1.almd:7:5
  in fn 'word_count'
  hint: Fix the expression type or change the expected type
  |
7 |     new_count
  |     ^^^^^^^^^

9 error(s) found
Compile error for /tmp/dojo-word-count-1.almd:
compile failed
FAILED: /tmp/dojo-word-count-1.almd

1/1 test file(s) failed

```

### Attempt 3 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter(|x| !string.is_empty(x)).map(string.to_lower)
  var count = map.new()
  list.fold(words, count, (acc, x) => {
    let new_count = map.get_or(acc, x, 0) + 1
    map.set(acc, x, new_count)
    new_count
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-2.almd
error: '|x|' closure syntax is not valid in Almide at line 2:43
  --> /tmp/dojo-word-count-2.almd:2:43
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").filter(|x| !string.is_empty(x)).map(string.to_lower)
  |                                           ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-2.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, count, (acc, x) => {
  |             ^^^^^
error[E005]: argument 'f' expects fn(Map[?0, ?1], ?3) -> Map[?0, ?1] but got fn(Map[?3, Int], ?3) -> Int
  --> /tmp/dojo-word-count-2.almd:7:5
  in call to list.fold()
  hint: Fix the argument type
  |
7 |     new_count
  |     ^^^^^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], String) -> Int
  --> /tmp/dojo-word-count-2.almd:7:5
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
7 |     new_count
  |     ^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-word-count-2.almd:
compile failed
FAILED: /tmp/dojo-word-count-2.almd

1/1 test file(s) failed

```

### Attempt 4 (FAIL)

```almide
fn word_count(s: String) -> Map[String, Int] = {
  let words = string.split(s, " ").filter(|x| !string.is_empty(x)).map(string.to_lower)
  var count = map.new()
  list.fold(words, count, (acc, x) => {
    let new_count = map.get_or(acc, x, 0) + 1
    map.set(acc, x, new_count)
    new_count
  })
}
```

**Diagnostic:**

```
Compiling /tmp/dojo-word-count-3.almd
error: '|x|' closure syntax is not valid in Almide at line 2:43
  --> /tmp/dojo-word-count-3.almd:2:43
  hint: Use '(x) => expr' for lambdas. Example: list.map(xs, (x) => x + 1)
  |
2 |   let words = string.split(s, " ").filter(|x| !string.is_empty(x)).map(string.to_lower)
  |                                           ^
error[E003]: undefined variable 'words'
  --> /tmp/dojo-word-count-3.almd:4:13
  in variable words
  hint: Check the variable name
  |
4 |   list.fold(words, count, (acc, x) => {
  |             ^^^^^
error[E005]: argument 'f' expects fn(Map[?0, ?1], ?3) -> Map[?0, ?1] but got fn(Map[?3, Int], ?3) -> Int
  --> /tmp/dojo-word-count-3.almd:7:5
  in call to list.fold()
  hint: Fix the argument type
  |
7 |     new_count
  |     ^^^^^^^^^
error[E001]: type mismatch in call to list.fold(): expected fn(Map[String, Int], String) -> Map[String, Int] but got fn(Map[String, Int], String) -> Int
  --> /tmp/dojo-word-count-3.almd:7:5
  in call to list.fold()
  hint: Fix the expression type or change the expected type
  |
7 |     new_count
  |     ^^^^^^^^^

4 error(s) found
Compile error for /tmp/dojo-word-count-3.almd:
compile failed
FAILED: /tmp/dojo-word-count-3.almd

1/1 test file(s) failed

```
